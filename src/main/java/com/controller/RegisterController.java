package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Register;
import com.dao.RegisterDao;

@Controller
public class RegisterController {

	@Autowired
	RegisterDao dao;
	
	@RequestMapping("/registerform")
	public String showregister(Model m)
	{
		m.addAttribute("register", new Register());
		return "registerform";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("register")Register register,Model m,RedirectAttributes redirectAttributes)
	{
		dao.save(register);
		redirectAttributes.addFlashAttribute("message", "Registered Successfully! ");
		return "redirect:/registerform";
	}
}

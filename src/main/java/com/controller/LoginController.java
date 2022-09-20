package com.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Login;
import com.bean.Register;
import com.dao.LoginDao;

@Controller
public class LoginController {

	@Autowired
	LoginDao loginDao;
	
	@RequestMapping(value="/loginform",method=RequestMethod.GET)
	public String init(Model m)
	{
		m.addAttribute("login", new Login());
		return "loginform";
	}
	
	@RequestMapping(value="/userlogin", method = RequestMethod.POST)
	public String login(@ModelAttribute("login")Login login,Model m,HttpServletRequest request,RedirectAttributes redirectAttributes)
	{
		String role = loginDao.authenticateUser(login);
		if(role.equals("patient"))
		{
			request.getSession(true).setAttribute("patientlogin", login.getUsername());
			m.addAttribute("patient", login);

			return "redirect:/patientHome";
		}
		else if(role.equals("admin"))
		{
			return "redirect:/adminHome";
		}
		else if(role.equals("doctor"))
		{
			request.getSession(true).setAttribute("doctorlogin", login.getUsername());
			m.addAttribute("doctor", login);
			return "redirect:/doctorHome";
		}
		else
		{
			redirectAttributes.addFlashAttribute("message", "Invalid Login Credentials");
			return "redirect:/loginform";
		}
	}
}

package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Doctor;
import com.bean.Feedback;
import com.dao.ContactDao;

@Controller
public class ContactController {
	
	@Autowired
	ContactDao contactDao;

	@RequestMapping("/contact")
	public String showContact()
	{
		return "contactus";
	}
	
	@RequestMapping(value="/submitfeedback", method = RequestMethod.POST)
	public String save(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("contact")Integer contact,
						@RequestParam("feedback")String feedback, Model m,RedirectAttributes redirectAttributes)
	{
		Feedback fb = new Feedback();
		fb.setName(name);
		fb.setEmail(email);
		fb.setContact(contact);
		fb.setFeedback(feedback);
		
		contactDao.saveFeedback(fb);
		redirectAttributes.addFlashAttribute("message", "Thank you for your feedback!");
		return "redirect:/contact";
	}
}

package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String showHome()
	{
		return "homepage";
	}
	
	@RequestMapping("/aboutus")
	public String showAbout()
	{
		return "aboutUs";
	}
}

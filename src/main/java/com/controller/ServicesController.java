package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServicesController {

	@RequestMapping("/services")
	public String showServices()
	{
		return "servicespage";
	}
	
	@RequestMapping("/ent")
	public String showENT()
	{
		return "serviceENT";
	}
	
	@RequestMapping("/ophthalmology")
	public String showOphthalmology()
	{
		return "serviceophthalmology";
	}
	
	@RequestMapping("/neurology")
	public String showNeurology()
	{
		return "serviceneurology";
	}
	
	@RequestMapping("/cardiology")
	public String showCardiology()
	{
		return "servicecardiology";
	}
	
	@RequestMapping("/urology")
	public String showUrology()
	{
		return "serviceurology";
	}
	
	@RequestMapping("/orthopedics")
	public String showOrthopedics()
	{
		return "serviceorthopedics";
	}
}

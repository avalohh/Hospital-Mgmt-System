package com.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Appointment;
import com.bean.Doctor;
import com.bean.Register;
import com.bean.Report;
import com.dao.DoctorDao;

@Controller
public class DoctorController {

	@Autowired
	DoctorDao doctorDao;
	String username = null;
	
	@RequestMapping("/doctorHome")
	public String showHome(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		if (session == null) {
		    // Not created yet.
		    System.out.println("no session created");
		} else {
		    System.out.println(session.getId());
		    if((String)request.getSession().getAttribute("doctorlogin")!=null)
		    	username = (String)session.getAttribute("doctorlogin");
		}
		request.getSession().setAttribute("doctor", username);
		return "doctorportal";
	}
	
	@RequestMapping("/doctorfront")
	public String showFront()
	{
		return "doctorhome";
	}
	
//	@RequestMapping("/doctorviewpatient")
//	public String showPatient(Model m)
//	{
//		List<Register> list = doctorDao.getPatients();
//		m.addAttribute("list", list);
//		return "doctorViewPatient";
//	}
	
	@RequestMapping(value="/doctorsearchpatient", method=RequestMethod.POST)
	public String searchPatient(HttpServletRequest request, Model m,RedirectAttributes redirectAttributes)
	{
		String search = request.getParameter("search");
		List<Register> list = doctorDao.getPatientBySearch(search);
		if(list.isEmpty())
		{
			redirectAttributes.addFlashAttribute("unsuccess", "Sorry... No Patient Found");
			return "redirect:/doctorviewpatient/1";
		}
		else
		{
			m.addAttribute("list", list);
			return "doctorViewPatient";
		}	
	}
	
	@RequestMapping(value="/doctorviewpatient/{pageid}")
	public String displayPatient(@PathVariable int pageid, Model m)
	{
		int total=6;
		if(pageid==1) 
		{}
		else {
			pageid=(pageid-1)*total+1;
		}
		List<Register> list = doctorDao.getPatientByPage(pageid, total);
		m.addAttribute("list", list);
		
		return "doctorViewPatient";
	}
	
	@RequestMapping("/doctorviewappointment")
	public String displayAppointment(HttpServletRequest request,Model m)
	{
		int count = doctorDao.countAppointment(username);
		List<Appointment> list = new ArrayList<Appointment>();
		
		if(count > 0)
		{
			list = doctorDao.getAppointment(username);
		}
		
		request.getSession().setAttribute("count", count);
		m.addAttribute("list", list);
		return "doctorViewAppointment";
	}
	
	@RequestMapping("/createreport/{id}")
	public String displayReportForm(@PathVariable int id,Model m)
	{
		Report report = doctorDao.getDetails(id);
		m.addAttribute("report", report);
		return "doctorCreateReport";
	}
	
	@RequestMapping(value="/savereport",method=RequestMethod.POST)
	public String processReport(@ModelAttribute("report")Report report, HttpServletRequest request,RedirectAttributes redirectAttributes) throws Exception
	{
		int id = report.getIdappointment();
		
		String date = request.getParameter("date");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date getDate = df.parse(date);
		java.sql.Date mySqlDate = new java.sql.Date(getDate.getTime());
		report.setDate(mySqlDate);
		
		int save = doctorDao.saveReport(report);
		
		if(save>0)
		{
			doctorDao.updateAppointmentStatus(id);
		}
		
		redirectAttributes.addFlashAttribute("message", "Report created successfully!");
		return "redirect:/doctorviewappointment";
	}
	
	@RequestMapping("/viewhistory")
	public String displayHistory(HttpServletRequest request,Model m)
	{
		int count = doctorDao.countExpAppointment();
		List<Appointment> list = new ArrayList<Appointment>();
		
		if(count > 0)
		{
			list = doctorDao.getAllHistory();
		}
		
		request.getSession().setAttribute("count", count);
		m.addAttribute("list", list);
		return "viewHistory";
	}
	
	@RequestMapping("/viewreport/{id}")
	public String displayReport(@PathVariable int id,Model m)
	{
		Report report = doctorDao.viewReport(id);
		m.addAttribute("report", report);
		return "viewReport";
	}
	
	@RequestMapping(value="/searchhistory", method=RequestMethod.POST)
	public String searchHistory(HttpServletRequest request, Model m,RedirectAttributes redirectAttributes)
	{
		String search = request.getParameter("search");
		List<Appointment> list = doctorDao.getHistoryBySearch(search);
		if(list.isEmpty())
		{
			redirectAttributes.addFlashAttribute("unsuccess", "Sorry... No Medical History Found");
			return "redirect:/viewhistory";
		}
		else
		{
			int count = doctorDao.countExpAppointment();
			request.getSession().setAttribute("count", count);
			m.addAttribute("list", list);
			return "viewHistory";
		}	
	}
	
	@RequestMapping("/doctorprofile")
	public String viewProfile(Model m)
	{
		Doctor doctor = doctorDao.getDoctorByUsername(username);
		m.addAttribute("doctor", doctor);
		return "doctorProfile";
	}
	
	@RequestMapping("/editdoctorprofile")
	public String updateProfile(Model m)
	{
		Doctor doctor = doctorDao.getDoctorByUsername(username);
		m.addAttribute("doctor", doctor);
		return "doctorProfileEdit";
	}
	
	@RequestMapping(value="/doctorSaveProfile",method=RequestMethod.POST)
	public String editDoctorSave(@ModelAttribute("doctor")Doctor doctor, RedirectAttributes redirectAttributes)
	{
		doctorDao.updateProfile(doctor);
		redirectAttributes.addFlashAttribute("message", "Profile Updated Successfully");
		return "redirect:/doctorprofile";
	}
}

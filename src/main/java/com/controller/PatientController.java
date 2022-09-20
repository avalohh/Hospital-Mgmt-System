package com.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.enhydra.jdbc.sybase.SybaseConnectionPoolDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Appointment;
import com.bean.Doctor;
import com.bean.Login;
import com.bean.PackageBean;
import com.bean.PackageOrder;
import com.bean.Register;
import com.bean.Report;
import com.dao.PatientDao;


@Controller
public class PatientController {
	
	@Autowired
	PatientDao patientDao;
	String username = null;
	
	@RequestMapping("/patientHome")
	public String showHome(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		if (session == null) {
		    // Not created yet. 
		    System.out.println("no session created");
		} else {
		    System.out.println(session.getId());
		    if((String)request.getSession().getAttribute("patientlogin")!=null)
		    	username = (String)session.getAttribute("patientlogin");
		}
		session.setAttribute("patient", username);
		return "patientportal";
	}

	@RequestMapping("/patientfront")
	public String showFront(Model m,HttpServletRequest request)
	{
		return "patienthome";
	}
	
	@RequestMapping(value="/bookappointment",method = RequestMethod.GET)
	public String showForm(Model m,HttpServletRequest request)
	{
		Register patient = patientDao.getPatientByUsername(username);
		List<String> ENT = patientDao.getDoctorByDept("ENT");
		List<String> Cardiology = patientDao.getDoctorByDept("Cardiology");
		List<String> Ophthalmology = patientDao.getDoctorByDept("Ophthalmology");
		List<String> Neurology = patientDao.getDoctorByDept("Neurology");
		List<String> Urology = patientDao.getDoctorByDept("Urology");
		List<String> Orthopedics = patientDao.getDoctorByDept("Orthopedics");
		List<String> packageOrder = patientDao.getPackageByUsername(patient.getIdregister());
		request.getSession().setAttribute("ENT", ENT);
		request.getSession().setAttribute("Cardiology", Cardiology);
		request.getSession().setAttribute("Ophthalmology", Ophthalmology);
		request.getSession().setAttribute("Neurology", Neurology);
		request.getSession().setAttribute("Urology", Urology);
		request.getSession().setAttribute("Orthopedics", Orthopedics);
		request.getSession().setAttribute("packageOrder", packageOrder);
		m.addAttribute("patient", patient);
//		m.addAttribute("ENT", ENT);
//		m.addAttribute("Cardiology", Cardiology);
		m.addAttribute("appointment", new Appointment());
		return "patientBookAppointment";
	}
	
	@RequestMapping(value="/booking",method = RequestMethod.POST)
	public String save(@ModelAttribute("appointment")Appointment appointment,Model m,HttpServletRequest request,RedirectAttributes redirectAttributes) throws ParseException
	{
		int idregister = Integer.parseInt(request.getParameter("idregister"));
		appointment.setIdregister(idregister);
		
		Date getDate = appointment.getDate();
		java.sql.Date mySqlDate = new java.sql.Date(getDate.getTime());
		appointment.setDate(mySqlDate);
		
		if(appointment.getPurpose().equals("Consultation"))
		{
			String doctorName = request.getParameter("doctorSelect");
			String doctorName2 = request.getParameter("doctorSelect2");
			String doctorName3 = request.getParameter("doctorSelect3");
			String doctorName4 = request.getParameter("doctorSelect4");
			String doctorName5 = request.getParameter("doctorSelect5");
			String doctorName6 = request.getParameter("doctorSelect6");
			if(doctorName != null)
				appointment.setDoctorName(doctorName);
			else if(doctorName2 != null)
				appointment.setDoctorName(doctorName2);
			else if(doctorName3 != null)
				appointment.setDoctorName(doctorName3);
			else if(doctorName4 != null)
				appointment.setDoctorName(doctorName4);
			else if(doctorName5 != null)
				appointment.setDoctorName(doctorName5);
			else if(doctorName6 != null)
				appointment.setDoctorName(doctorName6);
		}
		else if(appointment.getPurpose().equals("Package"))
		{
			String packageName = request.getParameter("package");
			appointment.setPackageName(packageName);
		}

		patientDao.bookAppointment(appointment);
		redirectAttributes.addFlashAttribute("message", "Booking succeed!");
		return "redirect:/bookappointment";
	}
	
	@RequestMapping("/patientviewappointment")
	public String displayAppointment(Model m,HttpServletRequest request)
	{
		Register patient = patientDao.getPatientByUsername(username);
		int idregister = patient.getIdregister();
		int consultation = patientDao.countPatientAppointment("Consultation", idregister);
		int packageCount = patientDao.countPatientAppointment("Package", idregister);
		List<Appointment> con = patientDao.getConsultationAppointments(idregister);
		List<Appointment> pkg = patientDao.getPackageAppointments(idregister);
		
		request.getSession().setAttribute("consultation", consultation);
		request.getSession().setAttribute("packageCount", packageCount);
		m.addAttribute("con", con);
		m.addAttribute("pkg", pkg);
		return "patientViewAppointment";
	}
	
	@RequestMapping(value="/cancelappointment/{id}",method=RequestMethod.GET)
	public String deleteDoctor(@PathVariable int id, RedirectAttributes redirectAttributes)
	{
		patientDao.updateAppointmentStatus(id);
		redirectAttributes.addFlashAttribute("message", "Booking ID "+id+" Cancelled Successfully");
		return "redirect:/patientviewappointment";
	}
	
	@RequestMapping("/buypackage")
	public String showPackage(Model m)
	{
		List<PackageBean> list = patientDao.getPackages();
		m.addAttribute("list", list);
		return "patientBuyPackage";
	}
	
	@RequestMapping("/patientbuypackage/{id}")
	public String buyPackage(@PathVariable int id, Model m, RedirectAttributes redirectAttributes)
	{
		Register patient = patientDao.getPatientByUsername(username);
		int idregister = patient.getIdregister();
		System.out.println(idregister);
		float price = patientDao.getPackagePrice(id);
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
		PackageOrder po = new PackageOrder();
		po.setIdpackage(id);
		po.setIdregister(idregister);
		po.setPrice(price);
		po.setDate(sqlDate);
		
		patientDao.saveOrder(po);
		redirectAttributes.addFlashAttribute("message", "Purchased successfully!");
		return "redirect:/patientvieworder";
	}
	
	@RequestMapping("/patientvieworder")
	public String viewOrder(Model m,HttpServletRequest request)
	{
		System.out.println(username);
		Register patient = patientDao.getPatientByUsername(username);
		int idregister = patient.getIdregister();
		int live = patientDao.countPackage(idregister, "live");
		int expired = patientDao.countPackage(idregister, "expired");
		List<PackageOrder> livelist = new ArrayList<PackageOrder>();
		List<PackageOrder> expiredlist = new ArrayList<PackageOrder>();
		
		if(live>0)
		{
			livelist = patientDao.getPackageOrder(idregister, "live");
		}
		if(expired>0)
		{
			expiredlist = patientDao.getPackageOrder(idregister, "expired");
		}
		
		request.getSession().setAttribute("live", live);
		request.getSession().setAttribute("expired", expired);
		m.addAttribute("livelist", livelist);
		m.addAttribute("expiredlist", expiredlist);
		return "patientViewPackageOrder";
	}
	
	@RequestMapping("/patientviewhistory")
	public String displayHistory(HttpServletRequest request,Model m)
	{
		Register patient = patientDao.getPatientByUsername(username);
		int idregister = patient.getIdregister();
		
		int count = patientDao.countPatientHistory(idregister);
		List<Appointment> list = new ArrayList<Appointment>();
		
		if(count > 0)
		{
			list = patientDao.getPatientHistory(idregister);
		}
		
		request.getSession().setAttribute("count", count);
		m.addAttribute("list", list);
		return "patientViewHistory";
	}
	
	@RequestMapping("/patientviewreport/{id}")
	public String displayReport(@PathVariable int id,Model m)
	{
		Report report = patientDao.viewReport(id);
		m.addAttribute("report", report);
		return "patientViewReport";
	}
	
	@RequestMapping(value="/patientsearchhistory", method=RequestMethod.POST)
	public String searchHistory(HttpServletRequest request, Model m,RedirectAttributes redirectAttributes)
	{
		String search = request.getParameter("search");
		List<Appointment> list = patientDao.getHistoryBySearch(search);
		if(list.isEmpty())
		{
			redirectAttributes.addFlashAttribute("message", "Sorry..No Medical History Found");
			return "redirect:/patientviewhistory";
		}
		else
		{
			Register patient = patientDao.getPatientByUsername(username);
			int idregister = patient.getIdregister();
			int count = patientDao.countPatientHistory(idregister);
			request.getSession().setAttribute("count", count);
			m.addAttribute("list", list);
			return "patientViewHistory";
		}	
	}
	
	@RequestMapping("/patientprofile")
	public String viewProfile(Model m)
	{
		Register patient = patientDao.getPatientByUsername(username);
		m.addAttribute("patient", patient);
		return "patientProfile";
	}
	
	@RequestMapping("/editpatientprofile")
	public String updateProfile(Model m)
	{
		Register patient = patientDao.getPatientByUsername(username);
		m.addAttribute("patient", patient);
		return "patientProfileEdit";
	}
	
	@RequestMapping(value="/patientSaveProfile",method=RequestMethod.POST)
	public String editPatientSave(@ModelAttribute("patient")Register patient, RedirectAttributes redirectAttributes)
	{
		patientDao.updateProfile(patient);
		username = patient.getUsername();
		redirectAttributes.addFlashAttribute("message", "Profile Updated Successfully");
		return "redirect:/patientprofile";
	}
}

package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Appointment;
import com.bean.Doctor;
import com.bean.Login;
import com.bean.Register;
import com.dao.AdminDao;

@Controller
public class AdminController {

	@Autowired
	AdminDao adminDao;
	
	@RequestMapping("/adminHome")
	public String showHome(@ModelAttribute("adminlogin")String name,Model m)
	{
		System.out.println(name);
		m.addAttribute("login", name);
		return "adminportal";
	}
	
	@RequestMapping("/adminfront")
	public String showFront()
	{
		return "adminhome";
	}
	
	//Manage doctors controller
	@RequestMapping("/adddoctor")
	public String showForm(Model m)
	{
		m.addAttribute("doctor", new Doctor());
		return "addDoctorForm";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String save(@ModelAttribute("doctor")Doctor doctor,Model m,RedirectAttributes redirectAttributes)
	{
		adminDao.save(doctor);
		redirectAttributes.addFlashAttribute("message", doctor.getName()+"'s record added successfully!");
		return "redirect:/adddoctor";
	}
	
	@RequestMapping("/editdoctor/{id}")
	public String editDoctor(@PathVariable int id, Model m)
	{
		Doctor doctor = adminDao.getDoctorById(id);
		m.addAttribute("doctor", doctor);
		return "admineditdoctorform";
	}
	
	@RequestMapping(value="/editdoctorsave",method=RequestMethod.POST)
	public String editDoctorSave(@ModelAttribute("doctor")Doctor doctor, RedirectAttributes redirectAttributes)
	{
		adminDao.updateDoctor(doctor);
		redirectAttributes.addFlashAttribute("message", doctor.getName()+"'s record updated successfully!");
		return "redirect:/adminviewdoctor";
	}
	
	@RequestMapping(value="/deletedoctor/{id}",method=RequestMethod.GET)
	public String deleteDoctor(@PathVariable int id, RedirectAttributes redirectAttributes)
	{
		adminDao.delete(id);
		redirectAttributes.addFlashAttribute("message", id+"'s record deleted successfully!");
		return "redirect:/adminviewdoctor";
	}
	
	@RequestMapping(value="/searchdoctor",method=RequestMethod.POST)
	public String searchDoctor(HttpServletRequest request, Model m,RedirectAttributes redirectAttributes)
	{
		String search = request.getParameter("search");
		List<Doctor> list = adminDao.getDoctorBySearch(search);
		if(list.isEmpty())
		{
			redirectAttributes.addFlashAttribute("unsuccess", "Sorry... No Doctor Found");
			return "redirect:/adminviewdoctor";
		}
		else
		{
			m.addAttribute("list", list);
			return "adminViewDoctor";
		}	
	}
	
	@RequestMapping("/adminviewdoctor")
	public String showDoctor(Model m)
	{
		List<Doctor> list = adminDao.getDoctors();
		m.addAttribute("list", list);
		return "adminViewDoctor";
	}
	
	//Manage Patient Controller
	@RequestMapping("/editpatient/{id}")
	public String editPatient(@PathVariable int id, Model m)
	{
		Register register = adminDao.getPatientById(id);
		m.addAttribute("register", register);
		return "admineditpatientform";
	}
	
	@RequestMapping(value="/editpatientsave",method=RequestMethod.POST)
	public String editDoctorSave(@ModelAttribute("register")Register register, RedirectAttributes redirectAttributes)
	{
		adminDao.updatePatient(register);
		redirectAttributes.addFlashAttribute("message", register.getFname()+"'s record updated successfully!");
		return "redirect:/adminviewpatient/1";
	}
	
//	@RequestMapping("/adminviewpatient")
//	public String showPatient(Model m)
//	{
//		List<Register> list = adminDao.getPatients();
//		m.addAttribute("list", list);
//		return "adminViewPatient";
//	}
	
	@RequestMapping(value="/searchpatient", method=RequestMethod.POST)
	public String searchPatient(HttpServletRequest request, Model m,RedirectAttributes redirectAttributes)
	{
		String search = request.getParameter("search");
		List<Register> list = adminDao.getPatientBySearch(search);
		if(list.isEmpty())
		{
			redirectAttributes.addFlashAttribute("unsuccess", "Sorry... No Patient Found");
			return "redirect:/adminviewpatient/1";
		}
		else
		{
			m.addAttribute("list", list);
			return "adminViewPatient";
		}	
	}
	
	@RequestMapping(value="/adminviewpatient/{pageid}")
	public String displayPatient(@PathVariable int pageid, Model m)
	{
		int total=6;
		if(pageid==1) 
		{}
		else {
			pageid=(pageid-1)*total+1;
		}
		System.out.println(pageid);
		List<Register> list = adminDao.getPatientByPage(pageid, total);
		m.addAttribute("list", list);
		
		return "adminViewPatient";
	}
	
	@RequestMapping("/viewAppointment")
	public String displayAppointment(Model m)
	{
		List<Appointment> consultation = adminDao.getConsultationAppointments("live");
		List<Appointment> packageApp = adminDao.getPackageAppointments("live");
		
		m.addAttribute("consultation", consultation);
		m.addAttribute("packageApp", packageApp);
		return "adminViewAppointment";
	}
	
	//logout Controller
	@RequestMapping("/logout")
	public ModelAndView logout()
	{
		return new ModelAndView("redirect:" + "http://localhost:8585/SpringMVCProject/");
	}
}

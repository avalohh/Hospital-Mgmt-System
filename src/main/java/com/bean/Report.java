package com.bean;

import java.util.Date;

public class Report {

	private int idreport;
	private int idappointment;
	private int idregister;
	private Date date;
	private String inoutPatient;
	private String patientDetails;
	private String treatmentDetails;
	
	private String fname;
	private String lname;
	private int contact;
	private String gender;
	
	private String doctorName;
	private String department;
	
	public int getIdreport() {
		return idreport;
	}
	public void setIdreport(int idreport) {
		this.idreport = idreport;
	}
	public int getIdappointment() {
		return idappointment;
	}
	public void setIdappointment(int idappointment) {
		this.idappointment = idappointment;
	}
	public int getIdregister() {
		return idregister;
	}
	public void setIdregister(int idregister) {
		this.idregister = idregister;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getInoutPatient() {
		return inoutPatient;
	}
	public void setInoutPatient(String inoutPatient) {
		this.inoutPatient = inoutPatient;
	}
	public String getPatientDetails() {
		return patientDetails;
	}
	public void setPatientDetails(String patientDetails) {
		this.patientDetails = patientDetails;
	}
	public String getTreatmentDetails() {
		return treatmentDetails;
	}
	public void setTreatmentDetails(String treatmentDetails) {
		this.treatmentDetails = treatmentDetails;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}

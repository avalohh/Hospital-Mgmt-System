package com.bean;

import java.util.Date;

public class Appointment {

	private int idappointment;
	private String purpose;
	private String packageName;
	private String department;
	private String doctorName;
	private Date date;
	private int idregister;
	private String status;
	
	private String fname;
	private String lname;
	
	public int getIdappointment() {
		return idappointment;
	}
	public void setIdappointment(int idappointment) {
		this.idappointment = idappointment;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getIdregister() {
		return idregister;
	}
	public void setIdregister(int idregister) {
		this.idregister = idregister;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}

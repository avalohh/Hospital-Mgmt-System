package com.bean;

import java.util.Date;

public class PackageOrder {

	private int idorder;
	private int idpackage;
	private String name;
	private int idregister;
	private float price;
	private String status;
	private Date date;
	
	public int getIdorder() {
		return idorder;
	}
	public void setIdorder(int idorder) {
		this.idorder = idorder;
	}
	public int getIdpackage() {
		return idpackage;
	}
	public void setIdpackage(int idpackage) {
		this.idpackage = idpackage;
	}
	public int getIdregister() {
		return idregister;
	}
	public void setIdregister(int idregister) {
		this.idregister = idregister;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

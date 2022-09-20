package com.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.bean.Register;

public class RegisterDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int save(Register register)
	{
		String sql = "insert into register(fname,lname,username,password,email,contact,gender) values ('"+register.getFname()
				+"','"+register.getLname()+"','"+register.getUsername()+"','"+register.getPassword()
				+"','"+register.getEmail()+"',"+register.getContact()+",'"+register.getGender()+"')";
		
		return template.update(sql);
	}
}

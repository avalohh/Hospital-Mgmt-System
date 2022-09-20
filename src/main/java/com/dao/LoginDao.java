package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bean.Doctor;
import com.bean.Login;
import com.bean.Register;


public class LoginDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public String authenticateUser(Login login)
	{
		String username = login.getUsername();
		String password = login.getPassword();
		String role = "invalid";
		
		if(login.getRole().equals("admin"))
		{
			String sql = "select username, password from admin";
			List<Register> list = template.query(sql, new RowMapper<Register>()
			{
				public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
					Register register = new Register();
					register.setUsername(rs.getString("username"));
					register.setPassword(rs.getString("password"));
					
					return register;
				}
			});
			
			for(Register user:list)
			{
				if(user.getUsername().equals(username))
				{
					if(user.getPassword().equals(password))
						role = "admin";
				}
			}
			
			return role;
		}
		else if(login.getRole().equals("doctor"))
		{
			String sql = "select name, email from doctor";
			List<Doctor> list = template.query(sql, new RowMapper<Doctor>()
			{
				public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {
					Doctor doctor = new Doctor();
					doctor.setName(rs.getString("name"));
					doctor.setEmail(rs.getString("email"));
					
					return doctor;
				}
			});
			
			for(Doctor doctor: list)
			{
				if(doctor.getName().equals(username))
				{
					if(doctor.getEmail().equals(password))
						role = "doctor";
				}
			}
			
			return role;
		}
		else
		{
			String sql = "select username, password from register";
			List<Register> list = template.query(sql, new RowMapper<Register>()
			{
				public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
					Register register = new Register();
					register.setUsername(rs.getString("username"));
					register.setPassword(rs.getString("password"));
					
					return register;
				}
			});
			
			for(Register user:list)
			{
				if(user.getUsername().equals(username))
				{
					if(user.getPassword().equals(password))
						role = "patient";
				}
			}
			
			return role;
		}
	}
}

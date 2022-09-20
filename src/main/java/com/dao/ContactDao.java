package com.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.bean.Feedback;

public class ContactDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int saveFeedback(Feedback feedback)
	{
		String sql = "insert into feedback(name,email,contact,feedback) values ('"
					+feedback.getName()+"','"+feedback.getEmail()+"',"+feedback.getContact()+",'"+feedback.getFeedback()+"')" ;
		
		return template.update(sql);
	}
}

package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bean.Appointment;
import com.bean.Doctor;
import com.bean.Register;

public class AdminDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	//Manage doctors dao
	public int save(Doctor doctor)
	{
		String sql = "insert into doctor(name,email,contact,department,gender) values ('"
					+doctor.getName()+"','"+doctor.getEmail()+"',"+doctor.getContact()+",'"+doctor.getDepartment()+"','"+doctor.getGender()+"')";
		
		return template.update(sql);
	}
	
	public List<Doctor> getDoctors()
	{
		return template.query("select * from doctor", new RowMapper<Doctor>() {

			public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {
				Doctor d = new Doctor();
				d.setIddoctor(rs.getInt("iddoctor"));
				d.setName(rs.getString("name"));
				d.setEmail(rs.getString("email"));
				d.setContact(rs.getInt("contact"));
				d.setDepartment(rs.getString("department"));
				d.setGender(rs.getString("gender"));
				
				return d;
			}
		});
	}
	
	public Doctor getDoctorById(int id)
	{
		String sql = "select * from doctor where iddoctor = ?";
		return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}
	
	public int updateDoctor(Doctor doctor)
	{
		String sql = "update doctor set name='"+doctor.getName()+"', email='"+doctor.getEmail()+"',contact="+doctor.getContact()
		+",department='"+doctor.getDepartment()+"',gender='"+doctor.getGender()+"' where iddoctor="+doctor.getIddoctor()+"";
		
		return template.update(sql);
	}
	
	public int delete(int id)
	{
		String sql = "delete from doctor where iddoctor = " +id +"";
		return template.update(sql);
	}
	
	public List<Doctor> getDoctorBySearch(String search)
	{
		String sql = "select * from doctor where upper(name) like upper('%" + search + "%') "
				+ "or upper(department) like upper('%" + search + "%') or iddoctor like '%" + search + "%'";
		
		return template.query(sql, new RowMapper<Doctor>() {

			public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {
				Doctor d = new Doctor();
				d.setIddoctor(rs.getInt("iddoctor"));
				d.setName(rs.getString("name"));
				d.setEmail(rs.getString("email"));
				d.setContact(rs.getInt("contact"));
				d.setDepartment(rs.getString("department"));
				d.setGender(rs.getString("gender"));
				
				return d;
			}
		});
	}
	
	//Manage patients dao
	public Register getPatientById(int id)
	{
		String sql = "select * from register where idregister = ?";
		return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Register>(Register.class));
	}
	
	public int updatePatient(Register register)
	{
		String sql = "update register set fname='"+register.getFname()+"',lname='"+register.getLname()+"', email='"+register.getEmail()
		+"',contact="+register.getContact()+",gender='"+register.getGender()+"' where idregister="+register.getIdregister()+"";
		
		return template.update(sql);
	}
	
	public List<Register> getPatients()
	{
		return template.query("select * from register", new RowMapper<Register>() {

			public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
				Register r = new Register();
				r.setIdregister(rs.getInt("idregister"));
				r.setFname(rs.getString("fname"));
				r.setLname(rs.getString("lname"));
				r.setEmail(rs.getString("email"));
				r.setContact(rs.getInt("contact"));
				r.setGender(rs.getString("gender"));
				
				return r;
			}
		});
	}
	
	public List<Register> getPatientByPage(int pageid, int total)
	{
		String sql = "select * from register limit "+(pageid-1)+","+total;
		
		return template.query(sql, new RowMapper<Register>() {

			public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
				Register r = new Register();
				r.setIdregister(rs.getInt("idregister"));
				r.setFname(rs.getString("fname"));
				r.setLname(rs.getString("lname"));
				r.setEmail(rs.getString("email"));
				r.setContact(rs.getInt("contact"));
				r.setGender(rs.getString("gender"));
				
				return r;
			}
		});
	}
	
	public List<Register> getPatientBySearch(String search)
	{
		String sql = "select * from register where upper(fname) like upper('%" + search + "%') "
				+ "or upper(lname) like upper('%" + search + "%') or contact like '%" + search + "%'";
		
		return template.query(sql, new RowMapper<Register>() {

			public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
				Register r = new Register();
				r.setIdregister(rs.getInt("idregister"));
				r.setFname(rs.getString("fname"));
				r.setLname(rs.getString("lname"));
				r.setEmail(rs.getString("email"));
				r.setContact(rs.getInt("contact"));
				r.setGender(rs.getString("gender"));
				
				return r;
			}
		});
	}
	
	public List<Appointment> getConsultationAppointments(String status)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.department, appointment.doctorName, appointment.date"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and appointment.status = '"+status+"' order by date";
		
		return template.query(sql, new RowMapper<Appointment>() {

			public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Appointment app = new Appointment();
				app.setIdappointment(rs.getInt("idappointment"));
				app.setIdregister(rs.getInt("idregister"));
				app.setFname(rs.getString("fname"));
				app.setLname(rs.getString("lname"));
				app.setDepartment(rs.getString("department"));
				app.setDoctorName(rs.getString("doctorName"));
				app.setDate(rs.getDate("date"));
				
				return app;
			}
		});
	}
	
	public List<Appointment> getPackageAppointments(String status)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.packageName, appointment.date"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Package' and appointment.status='"+status+"' order by date";
		
		return template.query(sql, new RowMapper<Appointment>() {

			public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Appointment app = new Appointment();
				app.setIdappointment(rs.getInt("idappointment"));
				app.setIdregister(rs.getInt("idregister"));
				app.setFname(rs.getString("fname"));
				app.setLname(rs.getString("lname"));
				app.setPackageName(rs.getString("packageName"));
				app.setDate(rs.getDate("date"));
				
				return app;
			}
		});
	}
}

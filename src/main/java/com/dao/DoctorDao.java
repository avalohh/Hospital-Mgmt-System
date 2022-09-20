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
import com.bean.Report;

public class DoctorDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
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
	
	public int countAppointment(String username)
	{
		String sql = "select count(*) from appointment where status = 'live' and doctorName = ?";
		int count = template.queryForObject(sql, new Object[]{username},Integer.class);
		
		return count;
	}
	
	public List<Appointment> getAppointment(String username)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.date, appointment.department,appointment.doctorName"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and appointment.status='live'"
				+ " and appointment.doctorName = '"+username+"' order by date";
		
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
	
	public Report getDetails(int id)
	{
		String sql = "select appointment.idappointment,register.idregister,register.fname,register.lname,register.contact,register.gender,"
				+ "appointment.doctorName,appointment.department"
				+ " from appointment,register where appointment.idregister = register.idregister and idappointment = ?";
		Report report = template.queryForObject(sql, new Object[]{id}, new RowMapper<Report>(){

			public Report mapRow(ResultSet rs, int rowNum) throws SQLException {
				Report rpt = new Report();
				rpt.setIdappointment(rs.getInt("idappointment"));
				rpt.setIdregister(rs.getInt("idregister"));
				rpt.setFname(rs.getString("fname"));
				rpt.setLname(rs.getString("lname"));
				rpt.setContact(rs.getInt("contact"));
				rpt.setGender(rs.getString("gender"));
				rpt.setDoctorName(rs.getString("doctorName"));
				rpt.setDepartment(rs.getString("department"));
				
				return rpt;
			}
		});
		
		return report;
	}
	
	public int updateAppointmentStatus(int id)
	{
		String sql = "update appointment set status = 'expired' where idappointment = "+id+"";
		
		return template.update(sql);
	}
	
	public int saveReport(Report report)
	{
		String sql = "insert into report(idappointment,idregister,date,inoutPatient,patientDetails,treatmentDetails) values ("
					+report.getIdappointment()+","+report.getIdregister()+",'"+report.getDate()+"','"+report.getInoutPatient()
					+"','"+report.getPatientDetails()+"','"+report.getTreatmentDetails()+"')";
		
		return template.update(sql);
	}
	
	public Report viewReport(int id)
	{
		String sql = "select appointment.idappointment,register.idregister,register.fname,register.lname,register.contact,register.gender,"
				+ "appointment.doctorName,appointment.department,report.idreport,report.date,report.inoutPatient,report.patientDetails,report.treatmentDetails"
				+ " from appointment,register,report "
				+ "where appointment.idregister = register.idregister and appointment.idappointment=report.idappointment and report.idappointment = ?";
		Report report = template.queryForObject(sql, new Object[]{id}, new RowMapper<Report>(){

			public Report mapRow(ResultSet rs, int rowNum) throws SQLException {
				Report rpt = new Report();
				rpt.setIdappointment(rs.getInt("idappointment"));
				rpt.setIdregister(rs.getInt("idregister"));
				rpt.setFname(rs.getString("fname"));
				rpt.setLname(rs.getString("lname"));
				rpt.setContact(rs.getInt("contact"));
				rpt.setGender(rs.getString("gender"));
				rpt.setDoctorName(rs.getString("doctorName"));
				rpt.setDepartment(rs.getString("department"));
				rpt.setIdreport(rs.getInt("idreport"));
				rpt.setDate(rs.getDate("date"));
				rpt.setInoutPatient(rs.getString("inoutPatient"));
				rpt.setPatientDetails(rs.getString("patientDetails"));
				rpt.setTreatmentDetails(rs.getString("treatmentDetails"));
				return rpt;
			}
		});
		
		return report;
	}
	
	public int countExpAppointment()
	{
		String sql = "select count(*) from appointment where status = 'expired'";
		int count = template.queryForObject(sql, new Object[]{},Integer.class);
		
		return count;
	}
	
	public List<Appointment> getAllHistory()
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.date, appointment.department,appointment.doctorName,appointment.status"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and (appointment.status='expired' or appointment.status='cancelled') order by date";
		
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
				app.setStatus(rs.getString("status"));
				
				return app;
			}
		});
	}
	
	public List<Appointment> getHistoryBySearch(String search)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.date, appointment.department,appointment.doctorName,appointment.status"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and (appointment.status='expired' or appointment.status='cancelled')"
				+ " and (upper(register.fname) like upper('%" + search + "%') or  upper(register.lname) like upper('%" + search + "%')"
				+ " or upper(appointment.department) like upper('%" + search + "%') or appointment.doctorName like ('%"+search+"%')) order by date";
		
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
				app.setStatus(rs.getString("status"));
				
				return app;
			}
		});
	}
	
	public Doctor getDoctorByUsername(String username)
	{
		String sql = "select * from doctor where name = '"+username+"'";
		
		return template.queryForObject(sql, new Object[]{},new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}
	
	public int updateProfile(Doctor doctor)
	{
		String sql = "update doctor set email='"+doctor.getEmail()+"',contact="+doctor.getContact()
		+" where iddoctor="+doctor.getIddoctor()+"";
		
		return template.update(sql);
	}
}

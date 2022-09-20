package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bean.Appointment;
import com.bean.Doctor;
import com.bean.Login;
import com.bean.PackageBean;
import com.bean.PackageOrder;
import com.bean.Register;
import com.bean.Report;

public class PatientDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public List<PackageBean> getPackages()
	{
		return template.query("select * from package", new RowMapper<PackageBean>() {

			public PackageBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				PackageBean p = new PackageBean();
				p.setIdpackage(rs.getInt("idpackage"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getFloat("price"));
				
				return p;
			}
		});
	}
	
	public List<String> getDoctorByDept(String dept)
	{
		String sql = "select name from doctor where department = '"+dept+"'";
		return template.query(sql, new RowMapper<String>() {

			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("name");
				return name;
			}
		});
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
	
	public Register getPatientByUsername(String username)
	{
		String sql = "select * from register where username = '"+username+"'";
		
		return template.queryForObject(sql, new Object[]{},new BeanPropertyRowMapper<Register>(Register.class));
	}
	
	public List<String> getPackageByUsername(int id)
	{
		String sql = "select package.name from package, packageorder where package.idpackage = packageorder.idpackage and packageorder.status='live' and packageorder.idregister ="+id+"";
		
		return template.query(sql, new RowMapper<String>() {

			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("name");
				return name;
			}
		});
	}
	
	public int bookAppointment(Appointment appointment)
	{
		String sql = "insert into appointment(purpose,packageName,department,doctorName,date,idregister) values ('"
					+appointment.getPurpose()+"','"+appointment.getPackageName()+"','"+appointment.getDepartment()
					+"','"+appointment.getDoctorName()+"','"+appointment.getDate()+"',"+appointment.getIdregister()+")";
		
		return template.update(sql);
	}
	
	public int countPatientAppointment(String purpose,int id)
	{
		String sql = "select count(*) from appointment where status = 'live' and idregister = ? and purpose = ?";
		int count = template.queryForObject(sql, new Object[]{id,purpose},Integer.class);
		
		return count;
	}
	
	public List<Appointment> getConsultationAppointments(int id)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.department, appointment.doctorName, appointment.date"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation'"
				+ " and appointment.status = 'live' and appointment.idregister="+id+"";
		
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
	
	public List<Appointment> getPackageAppointments(int id)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.packageName, appointment.date"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Package'"
				+ " and appointment.status='live' and appointment.idregister="+id+"";
		
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
	
	public int updateAppointmentStatus(int id)
	{
		String sql = "update appointment set status = 'cancelled' where idappointment = "+id+"";
		
		return template.update(sql);
	}
	
	public float getPackagePrice(int id)
	{
		String sql = "select price from package where idpackage=?";
		float price = template.queryForObject(sql, new Object[]{id},float.class);
	
		return price;
	}
	
	public int saveOrder(PackageOrder po)
	{
		String sql = "insert into packageorder(idpackage,idregister,price,date) values ("
				+po.getIdpackage()+","+po.getIdregister()+","+po.getPrice()+",'"+po.getDate()+"')";
	
		return template.update(sql);
	}
	
	public int countPackage(int id,String status)
	{
		String sql = "select count(*) from package, packageorder "
				+ "where package.idpackage = packageorder.idpackage and packageorder.idregister ="+id+" and packageorder.status='"+status+"'";
		int count = template.queryForObject(sql, new Object[]{},Integer.class);
		
		return count;
	}
	
	public List<PackageOrder> getPackageOrder(int id,String status)
	{
		String sql = "select packageorder.idorder, packageorder.date, package.name, packageorder.price, packageorder.status from package, packageorder "
				+ "where package.idpackage = packageorder.idpackage and packageorder.idregister ="+id+" and packageorder.status='"+status+"'";
		
		return template.query(sql, new RowMapper<PackageOrder>() {

			public PackageOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
				PackageOrder po = new PackageOrder();
				po.setIdorder(rs.getInt("idorder"));
				po.setDate(rs.getDate("date"));
				po.setName(rs.getString("name"));
				po.setPrice(rs.getFloat("price"));
				po.setStatus(rs.getString("status"));
				
				return po;
			}
		});
	}
	
	public int countPatientHistory(int id)
	{
		String sql = "select count(*) from appointment where (status = 'expired' or status='cancelled') and idregister = ?";
		int count = template.queryForObject(sql, new Object[]{id},Integer.class);
		
		return count;
	}
	
	public List<Appointment> getPatientHistory(int id)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.date, appointment.department,appointment.doctorName,appointment.status"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and"
				+ " (appointment.status='expired' or appointment.status='cancelled') "
				+ "and appointment.idregister = "+id+" order by date";
		
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
	
	public List<Appointment> getHistoryBySearch(String search)
	{
		String sql = "select appointment.idappointment,appointment.idregister, register.fname, register.lname, appointment.date, appointment.department,appointment.doctorName"
				+ " from appointment, register where appointment.idregister = register.idregister and appointment.purpose = 'Consultation' and appointment.status='expired'"
				+ " and (upper(appointment.department) like upper('%" + search + "%') or appointment.doctorName like ('%"+search+"%')) order by date";
		
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
	
	public int updateProfile(Register register)
	{
		String sql = "update register set username='"+register.getUsername()+"',password='"+register.getPassword()+"', email='"+register.getEmail()
		+"',contact="+register.getContact()+" where idregister="+register.getIdregister()+"";
		
		return template.update(sql);
	}
}

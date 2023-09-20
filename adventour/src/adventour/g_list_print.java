package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import adventour.g_getset;

public class g_list_print {
	Connection conn = null; 
	Statement stmt = null;
	
	public void con() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root","qhdks12!@");
		stmt = conn.createStatement();
	}
	
	public void discon() {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {
			
		}
		
	}
	
	public ArrayList<g_getset> g1() throws Exception {
		

				ArrayList<g_getset> arr = new ArrayList<g_getset>();

				try{
					con();

				
				ResultSet rs = stmt.executeQuery("select *from guide;");
				

				while(rs.next()) {
					g_getset table = new g_getset();
					
					table.setName(rs.getString("g_lastname")+rs.getString("g_firstname"));
					table.setCountry(rs.getString("g_country"));
					table.setCity(rs.getString("g_city"));
					table.setTheme(rs.getString("g_theme"));
					table.setImg(rs.getString("g_img"));
					table.setG_id(rs.getString("g_id"));
					table.setNick(rs.getString("g_nickname"));
					table.setEmail(rs.getString("g_email"));
					table.setGender(rs.getString("g_gender"));
					table.setPnum(rs.getString("g_pnum"));
							
					arr.add(table);
				}
				
			} finally {
				discon();

				}
				
				return arr;
	}
	
	
	public ArrayList<g_getset> g2(String g_id) throws Exception {
		

		ArrayList<g_getset> arr2 = new ArrayList<g_getset>();

		try{
			con();

		
		ResultSet rs = stmt.executeQuery("select *from guide where g_id ='"+g_id+"';");
		

		while(rs.next()) {
			g_getset table = new g_getset();
			
			table.setName(rs.getString("g_lastname")+rs.getString("g_firstname"));
			table.setCountry(rs.getString("g_country"));
			table.setCity(rs.getString("g_city"));
			table.setTheme(rs.getString("g_theme"));
			table.setImg(rs.getString("g_img"));
			table.setG_id(rs.getString("g_id"));
			table.setNick(rs.getString("g_nickname"));
			table.setEmail(rs.getString("g_email"));
			table.setGender(rs.getString("g_gender"));
			table.setPnum(rs.getString("g_pnum"));
					
			arr2.add(table);
		}
		
	} finally {
		discon();

		}
		
		return arr2;
}
}

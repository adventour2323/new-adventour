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
		
		 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root", "qhdks12!@");
		
//		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root","0521");
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
//					table.setName(rs.getString("g_lastname")+rs.getString("g_firstname"));
					table.setName(rs.getString("g_name"));
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
			

			table.setName(rs.getString("g_name"));
			table.setCountry(rs.getString("g_country"));
			table.setCity(rs.getString("g_city"));
			table.setTheme(rs.getString("g_theme"));
			table.setImg(rs.getString("g_img"));
			table.setG_id(rs.getString("g_id"));
			table.setNick(rs.getString("g_nickname"));
			table.setEmail(rs.getString("g_email"));
			table.setGender(rs.getString("g_gender"));
			table.setPnum(rs.getString("g_pnum"));
			table.setYear(rs.getString("g_birth_y"));
			table.setG_introduce(rs.getString("g_introduce"));
			
			table.setG_country_eng(rs.getString("g_country_eng"));
			arr2.add(table);
						}
			} finally {
				discon();
					}
		return arr2;
}
	
	public ArrayList<g_getset> g3(String g_country_eng) throws Exception {

		ArrayList<g_getset> arr2 = new ArrayList<g_getset>();
		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select *from guide where g_country_eng ='"+g_country_eng+"';");

		while(rs.next()) {
			g_getset table = new g_getset();
			
//			table.setName(rs.getString("g_lastname")+rs.getString("g_firstname"));
			table.setName(rs.getString("g_name"));
			table.setCountry(rs.getString("g_country"));
			table.setCity(rs.getString("g_city"));
			table.setTheme(rs.getString("g_theme"));
			table.setImg(rs.getString("g_img"));
			table.setG_id(rs.getString("g_id"));
			table.setNick(rs.getString("g_nickname"));
			table.setEmail(rs.getString("g_email"));
			table.setGender(rs.getString("g_gender"));
			table.setPnum(rs.getString("g_pnum"));
			table.setYear(rs.getString("g_birth_y"));
			table.setG_introduce(rs.getString("g_introduce"));
			
			table.setG_country_eng(rs.getString("g_country_eng"));
			arr2.add(table);
						}
			} finally {
				discon();
					}
		return arr2;
}
	// ↓↓ 확인l
	
/* public ArrayList<g_getset> g3(String g_country) throws Exception { */ 
	/*
	 * public ArrayList<g_getset> g3( ) throws Exception {
	 * 
	 * ArrayList<g_getset> arr3 = new ArrayList<g_getset>();
	 * 
	 * try{ con();
	 */
			
			/*
			 * ResultSet rs =
			 * stmt.executeQuery("select *from guide where g_country ='"+g_country+"';");
			 */
			
	/*
	 * ResultSet rs =
	 * stmt.executeQuery("select *from guide where g_country ='영국';");
	 * 
	 * 
	 * 
	 * while(rs.next()) { g_getset table = new g_getset();
	 * 
	 * table.setName(rs.getString("g_lastname")+rs.getString("g_firstname"));
	 * table.setCountry(rs.getString("g_country"));
	 * table.setCity(rs.getString("g_city"));
	 * table.setTheme(rs.getString("g_theme")); table.setImg(rs.getString("g_img"));
	 * table.setG_id(rs.getString("g_id"));
	 * table.setNick(rs.getString("g_nickname"));
	 * table.setEmail(rs.getString("g_email"));
	 * table.setGender(rs.getString("g_gender"));
	 * table.setPnum(rs.getString("g_pnum"));
	 * 
	 * arr3.add(table); }
	 * 
	 * } finally { discon();
	 * 
	 * }
	 * 
	 * return arr3; }
	 */
	
	//
	
// 이 밑으론 투어 관련
	
	public ArrayList<t_getset> t1() throws Exception {
		
		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select t_id, t_name, g_id, country, city, depart_time, meeting_spot, meeting_x, meeting_y, format(t_price,0), t_theme, t_info, t_spot1, t_spot2, t_spot3, t_img1, t_img2, t_img3, t_logo1 from tour;");

		while(rs.next()) {
			t_getset table = new t_getset();
			
								
			table.setT_id(rs.getString("t_id"));
			table.setT_name(rs.getString("t_name"));
			table.setG_id(rs.getString("g_id"));
			table.setCountry(rs.getString("country"));
			table.setCity(rs.getString("city"));
			table.setD_time(rs.getString("depart_time"));
			
			table.setM_spot(rs.getString("meeting_spot"));
			table.setM_x(rs.getString("meeting_x"));
			table.setM_y(rs.getString("meeting_y"));
			table.setT_price(rs.getString("format(t_price,0)"));
			table.setT_theme(rs.getString("t_theme"));
			table.setT_info(rs.getString("t_info"));
			table.setT_spot1(rs.getString("t_spot1"));
			table.setT_spot2(rs.getString("t_spot2"));
			table.setT_spot3(rs.getString("t_spot3"));
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			table.setT_logo(rs.getString("t_logo1"));
			arr.add(table);
		}
		
	} finally {
		discon();

		}
		
		return arr;
}
//
	
	public ArrayList<t_getset> t2(String g_id) throws Exception {

		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select *from tour where g_id = '"+g_id+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			table.setT_name(rs.getString("t_name"));
			table.setT_id(rs.getString("t_id"));
			table.setCountry(rs.getString("country"));
			table.setCity(rs.getString("city"));
			table.setT_price(rs.getString("t_price"));
			table.setT_theme(rs.getString("t_theme"));
			table.setT_info(rs.getString("t_info"));	
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
//	
	public ArrayList<t_getset> t3(String country_eng) throws Exception {

		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select t_id, t_name, g_id, country, country_eng, city, depart_time, meeting_spot, meeting_x, meeting_y, t_price, t_theme, t_info, t_spot1, t_spot2, t_spot3, t_img1, t_img2, t_img3, t_logo1 from tour where country_eng = '"+country_eng+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			
			table.setT_id(rs.getString("t_id"));
			table.setT_name(rs.getString("t_name"));
			table.setG_id(rs.getString("g_id"));
			table.setCountry(rs.getString("country"));
			table.setCountry_eng(rs.getString("country_eng"));
			table.setCity(rs.getString("city"));
			table.setD_time(rs.getString("depart_time"));
			
			table.setM_spot(rs.getString("meeting_spot"));
			table.setM_x(rs.getString("meeting_x"));
			table.setM_y(rs.getString("meeting_y"));
				/* table.setT_price(rs.getString("format(t_price,0)")); */
			table.setT_price(rs.getString("t_price"));
			table.setT_theme(rs.getString("t_theme"));
			table.setT_info(rs.getString("t_info"));
			table.setT_spot1(rs.getString("t_spot1"));
			table.setT_spot2(rs.getString("t_spot2"));
			table.setT_spot3(rs.getString("t_spot3"));
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			table.setT_logo(rs.getString("t_logo1"));
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
//	
	

	public ArrayList<t_getset> t4(String t_id) throws Exception {

		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select *from tour where t_id = '"+t_id+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			table.setT_id(rs.getString("t_id"));
			table.setT_name(rs.getString("t_name"));
			table.setCountry(rs.getString("country"));
			table.setCity(rs.getString("city"));
			table.setD_time(rs.getString("depart_time"));
			table.setM_spot(rs.getString("meeting_spot"));
			table.setM_x(rs.getString("meeting_x"));
			table.setM_y(rs.getString("meeting_y"));
			table.setT_price(rs.getString("t_price"));
			table.setT_theme(rs.getString("t_theme"));
			table.setT_info(rs.getString("t_info"));	
			table.setT_spot1(rs.getString("t_spot1"));
			table.setT_spot2(rs.getString("t_spot2"));
			table.setT_spot3(rs.getString("t_spot3"));
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			table.setSpot1_x(rs.getString("spot1_x"));
			table.setSpot1_y(rs.getString("spot1_y"));
			table.setSpot2_x(rs.getString("spot2_x"));
			table.setSpot2_y(rs.getString("spot2_y"));
			table.setSpot3_x(rs.getString("spot3_x"));
			table.setSpot3_y(rs.getString("spot3_y"));
			
			table.setG_id(rs.getString("g_id"));
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	public ArrayList<t_getset> t5(String t_id) throws Exception {

		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select tour.t_id, tour.t_name, tour.country, tour.country_eng, tour.city, tour.depart_time, tour.meeting_spot, tour.meeting_x, tour.meeting_y, tour.t_price, tour.t_theme, tour.t_info, tour.t_spot1, tour.spot1_x, tour.spot1_y, tour.t_spot2, tour.spot2_x, tour.spot2_y, tour.t_spot3, tour.spot3_x, tour.spot3_y, tour.t_img1, tour.t_img2, tour.t_img3,  guide.g_name, guide.g_img, guide.g_email from tour inner join guide on tour.g_id = guide.g_id where tour.t_id = '"+t_id+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			table.setT_id(rs.getString("tour.t_id"));
			table.setT_name(rs.getString("tour.t_name"));
			table.setCountry(rs.getString("tour.country"));
			table.setCountry(rs.getString("tour.country_eng"));
			table.setCity(rs.getString("tour.city"));
			table.setD_time(rs.getString("tour.depart_time"));
			table.setM_spot(rs.getString("tour.meeting_spot"));
			table.setM_x(rs.getString("tour.meeting_x"));
			table.setM_y(rs.getString("tour.meeting_y"));
			table.setT_price(rs.getString("tour.t_price"));
			table.setT_theme(rs.getString("tour.t_theme"));
			table.setT_info(rs.getString("tour.t_info"));	
			table.setT_spot1(rs.getString("tour.t_spot1"));
			table.setT_spot2(rs.getString("tour.t_spot2"));
			table.setT_spot3(rs.getString("tour.t_spot3"));
			table.setT_img1(rs.getString("tour.t_img1"));
			table.setT_img2(rs.getString("tour.t_img2"));
			table.setT_img3(rs.getString("tour.t_img3"));
			table.setSpot1_x(rs.getString("tour.spot1_x"));
			table.setSpot1_y(rs.getString("tour.spot1_y"));
			table.setSpot2_x(rs.getString("tour.spot2_x"));
			table.setSpot2_y(rs.getString("tour.spot2_y"));
			table.setSpot3_x(rs.getString("tour.spot3_x"));
			table.setSpot3_y(rs.getString("tour.spot3_y"));
			table.setG_name(rs.getString("guide.g_name"));
			table.setG_email(rs.getString("guide.g_email"));
			table.setG_img(rs.getString("guide.g_img"));
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
//
	public ArrayList<t_r_getset> t6(String t_id) throws Exception {

		ArrayList<t_r_getset> arr = new ArrayList<t_r_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("select *from tour_rating where t_id = '"+t_id+"';");

		while(rs.next()) {
			t_r_getset table = new t_r_getset();
			table.setT_review_id(rs.getString("t_review_id"));
			table.setT_review(rs.getString("t_review"));
			table.setT_rating(rs.getInt("t_rating"));
			table.setT_id(rs.getString("t_id"));
			table.setM_id(rs.getString("m_id"));
			table.setReview_date(rs.getString("review_date"));
			table.setReview_date_modify(rs.getString("review_date_modify"));
			
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
	
}

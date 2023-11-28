package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import adventour.t_getset;
import adventour.g_getset;
import getset.H_getset;


public class g_list_print {
	Connection conn = null; 
	Statement stmt = null;
	
	public void con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
//		 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour","root", "qhdks12!@");
		
		conn = DriverManager.getConnection("jdbc:mysql://15.164.100.232:3306/adventour","adventour2323","0521");
		stmt = conn.createStatement();
	}
	 
	public void discon() {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
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
	
	public ArrayList<t_getset> g4(String theme ,String g_id) throws Exception {

		ArrayList<t_getset> arr2 = new ArrayList<t_getset>();
		try{
			con();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM tour WHERE t_theme = '"+theme+"' and g_id !='"+g_id+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			

			table.setT_name(rs.getString("t_name"));
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			table.setT_img4(rs.getString("t_img4"));
			table.setT_price(rs.getString("t_price"));
			table.setT_id(rs.getString("t_id"));
			arr2.add(table);
						}
			} finally {
				discon();
					}
		return arr2;
}	
	
	//
	
	public ArrayList<g_r_getset> g5(String g_id) throws Exception {

		ArrayList<g_r_getset> arr = new ArrayList<g_r_getset>();

		try{
			con();
		
			ResultSet rs = stmt.executeQuery(
				    "SELECT "
				    + "  g_review_id, " +
				    "  g_review, " +
				    "  g_rating, " +
				    "  g_id, " +
				    "  m_id, " +
				    "  DATE_FORMAT(g_review_date, '%Y-%m-%d %H:%i') AS g_review_date "
				    + "FROM guide_rating "
				    + "WHERE g_id = '" + g_id + "' ORDER BY g_review_date DESC;");


		while(rs.next()) {
			g_r_getset table = new g_r_getset();
			table.setG_review_id(rs.getString("g_review_id"));
			table.setG_review(rs.getString("g_review"));
			table.setG_rating(rs.getInt("g_rating"));
			table.setG_id(rs.getString("g_id"));
			table.setM_id(rs.getString("m_id"));
			table.setG_review_date(rs.getString("g_review_date"));

			
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
	public ArrayList<g_r_getset> g6(String g_id) throws Exception {

		ArrayList<g_r_getset> arr = new ArrayList<g_r_getset>();

		try{
			con();
		
			ResultSet rs = stmt.executeQuery(
				    "SELECT "
				    + "  g_id, "
				    + "  AVG(g_rating) as g_rating "
				    + "FROM guide_rating "
				    + "WHERE g_id = '" + g_id + "';");


		while(rs.next()) {
			g_r_getset table = new g_r_getset();
			
			table.setG_id(rs.getString("g_id"));
			table.setG_rating(rs.getInt("g_rating"));			
						
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
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
			table.setT_theme_code(rs.getString("t_theme_code"));
			table.setG_id(rs.getString("g_id"));
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
			table.setCountry_eng(rs.getString("country_eng"));
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
			table.setT_img4(rs.getString("t_img4"));
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
		
		ResultSet rs = stmt.executeQuery
						("select "
						+ "*"
						+ "from tour_rating "
						+ "where t_id = '"+t_id+""
								+ "' order by review_date desc;");

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
	
	public ArrayList<t_r_getset> t7(String t_id) throws Exception {

		ArrayList<t_r_getset> arr = new ArrayList<t_r_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery
				("SELECT avg(t_rating), t_id FROM tour_rating where t_id='"+t_id+"';");

		while(rs.next()) {
			t_r_getset table = new t_r_getset();
			
			table.setT_rating(rs.getInt("avg(t_rating)"));
			table.setT_id(rs.getString("t_id"));
			
			
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
	
	public ArrayList<t_rating_getset> t8() throws Exception {

		ArrayList<t_rating_getset> arr = new ArrayList<t_rating_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery
				("SELECT t.t_id, t.t_name, t.t_price, t.country, t.city, t.t_img1, tr.review_count, tr.avg_rating FROM tour t "
						+ "LEFT OUTER JOIN ( SELECT t_id, COUNT(t_id) AS review_count, AVG(t_rating) AS avg_rating "
						+ "FROM tour_rating WHERE review_date BETWEEN NOW() + INTERVAL 9 HOUR - INTERVAL 1 WEEK AND NOW() + INTERVAL 9 HOUR GROUP BY t_id ) tr ON t.t_id = tr.t_id "
						+ "ORDER BY tr.review_count DESC LIMIT 3"); 				
			

		while(rs.next()) {
			t_rating_getset table = new t_rating_getset();
			table.setT_id(rs.getString("t_id"));
			table.setT_name(rs.getString("t_name"));
			table.setT_price(rs.getString("t_price"));
			table.setCountry(rs.getString("country"));
			table.setCity(rs.getString("city"));
			table.setT_img1(rs.getString("t_img1"));
			table.setReview_count(rs.getInt("review_count"));
			table.setAvg_rating(rs.getInt("avg_rating"));
			
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
//
	public ArrayList<t_getset> t9(String t_id) throws Exception {

		ArrayList<t_getset> arr = new ArrayList<t_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("SELECT "
				+ "    t.t_id, "
				+ "    t.t_name, "
				+ "    t.g_id, "
				+ "    t.country, "
				+ "    t.country_eng, "
				+ "    t.city, "
				+ "    t.depart_time, "
				+ "    t.meeting_spot, "
				+ "    t.meeting_x, "
				+ "    t.meeting_y, "
				+ "    t.t_price, "
				+ "    t.t_theme, "
				+ "    t.t_headcount, "
				+ "    t.t_img1, "
				+ "    t.t_img2, "
				+ "    t.t_img3, "
				+ "    t.t_img4, "
				+ "    g.g_name, "
				+ "    g.g_img, "
				+ "    g.g_email, "
				+ "    g.g_pnum "
				+ "FROM "
				+ "    adventour.tour AS t "
				+ "JOIN "
				+ "    adventour.guide AS g ON t.g_id = g.g_id "
				+ "WHERE "
				+ "    t.t_id = '"+t_id+"';");

		while(rs.next()) {
			t_getset table = new t_getset();
			table.setT_id(rs.getString("t_id"));
			table.setT_name(rs.getString("t_name"));
			table.setCountry(rs.getString("country"));
			table.setCountry_eng(rs.getString("country_eng"));
			table.setCity(rs.getString("city"));
			table.setD_time(rs.getString("depart_time"));
			table.setM_spot(rs.getString("meeting_spot"));
			table.setM_x(rs.getString("meeting_x"));
			table.setM_y(rs.getString("meeting_y"));
			table.setT_price(rs.getString("t_price"));
			table.setT_img1(rs.getString("t_img1"));
			table.setT_img2(rs.getString("t_img2"));
			table.setT_img3(rs.getString("t_img3"));
			table.setT_img4(rs.getString("t_img4"));			
			table.setG_id(rs.getString("g_id"));
			table.setG_name(rs.getString("g_name"));
			table.setG_img(rs.getString("g_img"));
			table.setG_email(rs.getString("g_email"));
			table.setG_pnum(rs.getString("g_pnum"));
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
		
	


//	
	
//	호텔 ↓↓
	public ArrayList<H_getset> h1() throws Exception {

		ArrayList<H_getset> arr = new ArrayList<H_getset>();

		try{
			con();
		
		ResultSet rs = stmt.executeQuery("SELECT country_eng ,country_ko, city_ko, h_name_eng, h_name_ko, h_pho, h_grade FROM h_hotel;");

		while(rs.next()) {
			H_getset table = new H_getset();
			
			table.setCountry_eng(rs.getString("country_eng"));
			table.setCountry_ko(rs.getString("country_ko"));
			table.setCity_ko(rs.getString("city_ko"));
			table.setH_name_ko(rs.getString("h_name_ko"));
			table.setH_name_eng(rs.getString("h_name_eng"));
			table.setH_pho(rs.getString("h_pho"));
			table.setH_grade(rs.getString("h_grade"));
			
			arr.add(table);
		}
	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
	public ArrayList<H_getset> h2(String h_country) throws Exception {
		
		
		ArrayList<H_getset> arr = new ArrayList<H_getset>();
		
		try{
			con();
		
		ResultSet rs = stmt.executeQuery("SELECT " + 
				"    h_hotel.h_pho, " + 
				"    h_hotel.h_name_ko, " + 
				"    h_hotel.h_name_eng, " + 
				"    h_hotel.h_grade, " + 
				"    h_hotel.country_ko, " + 
				"    h_hotel.city_ko, " + 
				"    MIN(h_room.h_roompri) as min_price " + 
				"FROM " + 
				"    h_hotel " + 
				"INNER JOIN " + 
				"    h_room " + 
				"ON " + 
				"    h_hotel.h_name_eng = h_room.h_name_eng " + 
				"Where " + 
				"	country_ko = '"+h_country+"'" +
				"GROUP BY " + 
				"    h_hotel.h_pho, " + 
				"    h_hotel.h_name_ko, " + 
				"    h_hotel.h_name_eng, " + 
				"    h_hotel.h_grade, " + 
				"    h_hotel.country_ko, " + 
				"    h_hotel.city_ko; ");
		
		
		
		while (rs.next()) {
		    H_getset table = new H_getset();
		    table.setH_pho(rs.getString("h_pho"));
		    table.setH_name_ko(rs.getString("h_name_ko"));
		    table.setH_grade(rs.getString("h_grade"));
		    table.setCountry_ko(rs.getString("country_ko"));
		    table.setCity_ko(rs.getString("city_ko"));
		    table.setH_roompri(rs.getInt("min_price"));

		    arr.add(table);
		    
		    // 디버깅 출력을 추가
		    System.out.println("h_pho: " + table.getH_pho());
		    System.out.println("h_name_ko: " + table.getH_name_ko());
		    System.out.println("h_grade: " + table.getH_grade());
		    System.out.println("country_ko: " + table.getCountry_ko());
		    System.out.println("city_ko: " + table.getCity_ko());
		    System.out.println("h_roompri: " + table.getH_roompri());
		    System.out.println("test test test test");
		    System.out.println(h_country + "java3");
		    
		}

	} finally {
		discon();
		}
		return arr;
		}
		
	//
	public ArrayList<H_getset> h3(String h_country) throws Exception {
		
		
		ArrayList<H_getset> arr = new ArrayList<H_getset>();
		
		try{
			con();
		
		ResultSet rs = stmt.executeQuery("SELECT " + 
				"    h_hotel.h_pho, " + 
				"    h_hotel.h_name_ko, " + 
				"    h_hotel.h_name_eng, " + 
				"    h_hotel.h_grade, " + 
				"    h_hotel.country_ko, " +
				"    h_hotel.country_eng, " +
				"    h_hotel.city_ko, " + 
				"    MIN(h_room.h_roompri) as min_price " + 
				"FROM " + 
				"    h_hotel " + 
				"INNER JOIN " + 
				"    h_room " + 
				"ON " + 
				"    h_hotel.h_name_eng = h_room.h_name_eng " + 
				"Where " + 
				"	country_eng = '"+h_country+"'" +
				"GROUP BY " + 
				"    h_hotel.h_pho, " + 
				"    h_hotel.h_name_ko, " + 
				"    h_hotel.h_name_eng, " + 
				"    h_hotel.h_grade, " + 
				"    h_hotel.country_ko, " + 
				"    h_hotel.city_ko; ");
		
		
		
		while (rs.next()) {
		    H_getset table = new H_getset();
		    table.setH_pho(rs.getString("h_pho"));
		    table.setH_name_ko(rs.getString("h_name_ko"));
		    table.setH_name_eng(rs.getString("h_name_eng"));
		    table.setH_grade(rs.getString("h_grade"));
		    table.setCountry_ko(rs.getString("country_ko"));
		    table.setCity_ko(rs.getString("city_ko"));
		    table.setH_roompri(rs.getInt("min_price"));
		    arr.add(table);
		    
		}

	} finally {
		discon();
		}
		return arr;
		}
	
	//
	
    public void t_likesave(String t_id, String m_id) throws Exception { // 입력받은 정보를 저장 insert하는 매소드
    	  
        try {
            con();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            String command = String.format(
                    "INSERT INTO t_like (t_like_t_id, t_like_m_id)"
            +"VALUES('"+t_id+"', '"+m_id +"');" ); 
              //데이터베이스 명령문 사용      
                    
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에 입력할 수 없습니다.");
            }
        } finally {
            discon();
        }
       
    } 
}

package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import adventour.t_getset;
import getset.H_getset;
 
public class Mypage_db {
	Connection conn = null; //매소드 분리를 위해 전역변수로 
    Statement stmt = null;

    public void connec() throws Exception { // 데이터베이스 연결을 위한 매소드
        Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf-8", "root", "0521");
        stmt = conn.createStatement();
    }

    public void closecon() { // close를 위한 매소드 - 반복적으로 사용되어 매소드로분리
        try {
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public ArrayList<H_getset> m_h_like(String m_id) throws Exception { 
        ArrayList<H_getset> arr = new ArrayList<H_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT h_hotel.* " + 
            	    "FROM adventour.h_like " + // 첫 번째 주의할 점: 테이블명과 JOIN 구문 사이에 공백이 필요합니다.
            	    "JOIN adventour.h_hotel ON h_like.like_h_name_eng = h_hotel.h_name_eng " + // 두 번째 주의할 점: JOIN과 WHERE 구문 사이에 공백이 필요합니다.
            	    "WHERE h_like.like_m_id = '" + m_id + "';"); // 세 번째 주의할 점: WHERE 키워드 앞에 공백이 필요합니다.

            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	H_getset obj = new H_getset();
                obj.setH_name_eng(rs.getString("h_name_eng"));
                obj.setH_name_ko(rs.getString("h_name_ko"));
                obj.setCountry_ko(rs.getString("country_ko"));
                obj.setCity_ko(rs.getString("city_ko"));
                
                System.out.println("자바파일");
               arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    }


 
//    public void dbDelete(String c_num) throws Exception {
//        try {
//            connec();
//            if (conn == null)
//                throw new Exception("데이터베이스에 연결할 수 없습니다");
//            
//            String command = "DELETE FROM community WHERE c_num = " + c_num;
//            
//            int rowNum = stmt.executeUpdate(command);
//            if (rowNum < 1) {
//                throw new Exception("데이터를 DB에서 삭제할 수 없습니다.");
//            }
//        } finally {
//            closecon();
//        }
//    }
    
}

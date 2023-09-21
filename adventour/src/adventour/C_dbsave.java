package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class C_dbsave {
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

    public void dbsave(String m_id, String country, String city, String c_title, 
    		String c_cont, String c_pho1,String c_pho2,String c_pho3,String c_pho4,String c_pho5) throws Exception { // 입력받은 정보를 저장 insert하는 매소드
  
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            String command = String.format(
                    "INSERT INTO community (m_id, country,  city,c_title, c_cont, c_pho1, c_pho2, c_pho3, c_pho4, c_pho5 )"
            +"VALUES('"+m_id+"', '"+ country+"', '"+ city+"', '"+ c_title+"', '"+ c_cont+"', '"+ c_pho1+"', '"+ c_pho2+"', '"+ c_pho3+"', '"+ c_pho4+"','"+c_pho5+"');" ); 
              //데이터베이스 명령문 사용      
                    
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에 입력할 수 없습니다.");
            }
        } finally {
            closecon();
        }
       
    } 
    public ArrayList<C_getset> c_listshow() throws Exception { 
        ArrayList<C_getset> arr = new ArrayList<C_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT * FROM community\r\n ORDER BY c_date DESC;"); //데이터베이스 명령문사용
            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	C_getset obj = new C_getset();
                obj.setC_num(rs.getString("c_num"));
                obj.setC_title(rs.getString("c_title"));
                obj.setM_id(rs.getString("m_id"));
                obj.setC_date(rs.getString("c_date"));
                obj.setCountry(rs.getString("country"));
                obj.setCity(rs.getString("city"));
           
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    }
    
    public ArrayList<C_getset> c_country() throws Exception { // 게시판 리스트에 보여주는 매소드
        ArrayList<C_getset> arr = new ArrayList<C_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT * FROM community\r\n ORDER BY c_date DESC;"); //데이터베이스 명령문사용
            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	C_getset obj = new C_getset();
                obj.setC_num(rs.getString("c_num"));
                obj.setC_title(rs.getString("c_title"));
                obj.setM_id(rs.getString("m_id"));
                obj.setC_date(rs.getString("c_date"));
                obj.setCountry(rs.getString("country"));
                obj.setCity(rs.getString("city"));
           
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    }
    
    public ArrayList<C_getset> searchByKeyword(String keyword) throws Exception {
        ArrayList<C_getset> arr = new ArrayList<C_getset>();
        PreparedStatement pstmt = null; // 새로운 PreparedStatement 변수 선언
        try {
            connec();
            if (conn == null) {
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            }
            String query = "SELECT * FROM community WHERE c_title LIKE ? OR country LIKE ? OR city LIKE ? ORDER BY c_date DESC;";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, "%" + keyword + "%"); 
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setString(3, "%" + keyword + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                C_getset obj = new C_getset();
                obj.setC_num(rs.getString("c_num"));
                obj.setC_title(rs.getString("c_title"));
                obj.setM_id(rs.getString("m_id"));
                obj.setC_date(rs.getString("c_date"));
                obj.setCountry(rs.getString("country"));
                obj.setCity(rs.getString("city"));
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr;
    }
   
}

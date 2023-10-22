package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import getset.H_getset;


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
            ResultSet rs = stmt.executeQuery("SELECT * FROM community ORDER BY c_num DESC;"); //데이터베이스 명령문사용
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

    public ArrayList<C_getset> c_contshow(String c_num ) throws Exception { 
        ArrayList<C_getset> arr = new ArrayList<C_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT * FROM community WHERE c_num='" + c_num + "';"); //데이터베이스 명령문사용
            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	C_getset obj = new C_getset();
                obj.setC_num(rs.getString("c_num"));
                obj.setC_title(rs.getString("c_title"));
                obj.setM_id(rs.getString("m_id"));
                obj.setC_date(rs.getString("c_date"));
                obj.setCountry(rs.getString("country"));
                obj.setCity(rs.getString("city"));
                obj.setC_cont(rs.getString("c_cont"));
                obj.setC_pho1(rs.getString("c_pho1"));
                obj.setC_pho2(rs.getString("c_pho2"));
                obj.setC_pho3(rs.getString("c_pho3"));
                obj.setC_pho4(rs.getString("c_pho4"));
                obj.setC_pho5(rs.getString("c_pho5"));
               
           
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    } 
    public ArrayList<H_getset> h_PackageShow() throws Exception { 
        ArrayList<H_getset> arr = new ArrayList<H_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT * FROM packages LIMIT 4;"); //데이터베이스 명령문사용
            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	H_getset obj = new H_getset();
                obj.setP_pho(rs.getString("p_pho"));
                obj.setP_name_ko(rs.getString("p_name_ko"));
                obj.setP_title1(rs.getString("p_title1"));
                obj.setP_title2(rs.getString("p_title2"));
                obj.setP_price(rs.getInt("p_price"));
       
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    }
    public boolean dbupdate(String c_num, String country, String city, String c_title, String c_cont, String c_pho1, String c_pho2, String c_pho3, String c_pho4, String c_pho5) throws Exception {
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            
            String command = "UPDATE community SET " +
                            "country = '" + country + "', " +
                            "city = '" + city + "', " +
                            "c_title = '" + c_title + "', " +
                            "c_cont = '" + c_cont + "', " +
                            "c_pho1 = '" + c_pho1 + "', " +
                            "c_pho2 = '" + c_pho2 + "', " +
                            "c_pho3 = '" + c_pho3 + "', " +
                            "c_pho4 = '" + c_pho4 + "', " +
                            "c_pho5 = '" + c_pho5 + "' " +
                            "WHERE c_num = " + c_num;
            
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에 업데이트할 수 없습니다.");
            }

            // 성공적으로 업데이트되면 true 반환
            return true;
        } finally {
            closecon();
        }
    }
    public void dbDelete(String c_num) throws Exception {
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            
            String command = "DELETE FROM community WHERE c_num = " + c_num;
            
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에서 삭제할 수 없습니다.");
            }
        } finally {
            closecon();
        }
    }

}

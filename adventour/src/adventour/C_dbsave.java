package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class C_dbsave {
	Connection conn = null; //매소드 분리를 위해 전역변수로 
    Statement stmt = null;

    public void connec() throws Exception { // 데이터베이스 연결을 위한 매소드
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour", "root", "0521");
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

    public void dbsave(String m_id, String c_date, String country, String city, String c_title, 
    		String c_cont, String c_pho1,String c_pho2,String c_pho3,String c_pho4,String c_pho5) throws Exception { // 입력받은 정보를 저장 insert하는 매소드
  
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            String command = String.format(
                    "INSERT INTO community (m_id, c_date, country,  city,c_title, c_cont, c_pho1, c_pho2, c_pho3, c_pho4, c_pho5 )"
            +"VALUES('"+m_id+"', '"+ c_date+"', '"+ country+"', '"+ city+"', '"+ c_title+"', '"+ c_cont+"', '"+ c_pho1+"', '"+ c_pho2+"', '"+ c_pho3+"', '"+ c_pho4+"','"+c_pho5+"');" ); 
              //데이터베이스 명령문 사용      
                    
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에 입력할 수 없습니다.");
            }
        } finally {
            closecon();
        }
       
    } 

   
}

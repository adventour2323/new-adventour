package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class C_dbsave {
	Connection conn = null; //�żҵ� �и��� ���� ���������� 
    Statement stmt = null;

    public void connec() throws Exception { // �����ͺ��̽� ������ ���� �żҵ�
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour", "root", "0521");
        stmt = conn.createStatement();
    }

    public void closecon() { // close�� ���� �żҵ� - �ݺ������� ���Ǿ� �żҵ�κи�
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
    		String c_cont, String c_pho1,String c_pho2,String c_pho3,String c_pho4,String c_pho5) throws Exception { // �Է¹��� ������ ���� insert�ϴ� �żҵ�
  
        try {
            connec();
            if (conn == null)
                throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
            String command = String.format(
                    "INSERT INTO community (m_id, c_date, country,  city,c_title, c_cont, c_pho1, c_pho2, c_pho3, c_pho4, c_pho5 )"
            +"VALUES('"+m_id+"', '"+ c_date+"', '"+ country+"', '"+ city+"', '"+ c_title+"', '"+ c_cont+"', '"+ c_pho1+"', '"+ c_pho2+"', '"+ c_pho3+"', '"+ c_pho4+"','"+c_pho5+"');" ); 
              //�����ͺ��̽� ��ɹ� ���      
                    
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
            }
        } finally {
            closecon();
        }
       
    } 

   
}

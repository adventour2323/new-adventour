package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class C_search {
    Connection conn = null; // 메소드 분리를 위해 전역 변수로
    PreparedStatement pstmt = null;

    public void connec() throws Exception { // 데이터베이스 연결을 위한 메소드
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf-8", "root", "0521");
    }

    public void closecon() { // close를 위한 메소드 - 반복적으로 사용되어 메소드로 분리
        try {
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<C_getset> c_search(String c_sch) throws Exception {
        ArrayList<C_getset> arr = new ArrayList<C_getset>();
        try {
            connec();
            if (conn == null) {
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            }
            String query = "SELECT * FROM community WHERE c_title LIKE ? OR m_id LIKE ? OR country LIKE ? OR city LIKE ? ORDER BY c_date DESC;";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, "%" + c_sch + "%");
            pstmt.setString(2, "%" + c_sch + "%");
            pstmt.setString(3, "%" + c_sch + "%");
            pstmt.setString(4, "%" + c_sch + "%");
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

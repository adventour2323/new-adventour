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

    public void db122(String id, String pw, String name, String year, String snum, String depart,
            String m1, String m2, String address, String email) throws Exception { // 입력받은 정보를 저장 insert하는 매소드
  
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            String command = String.format(
                    "INSERT INTO student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email)"
            +"VALUES('"+id+"', '"+ pw+"', '"+ name+"', '"+ year+"', '"+ snum+"', '"+ depart+"', '"+ m1+"', '"+ m2+"', '"+ address+"', '"+ email+"');" ); 
              //데이터베이스 명령문 사용      
                    
            int rowNum = stmt.executeUpdate(command);
            if (rowNum < 1) {
                throw new Exception("데이터를 DB에 입력할 수 없습니다.");
            }
        } finally {
            closecon();
        }
     
    }

    public ArrayList<C_getset> db12() throws Exception {
        ArrayList<C_getset> arr = new ArrayList<C_getset>(); //여려개의 객체를 받아서 가지고 오기위해서 
        try {
            connec();
            if (conn == null)
                throw new Exception("데이터베이스에 연결할 수 없습니다");
            ResultSet rs = stmt.executeQuery("SELECT * FROM student;"); //데이터베이스 명령문사용
            while (rs.next()) { //rs의 값이 없을 때 까지 - 값을 받아온다
            	C_getset obj = new C_getset();
                //obj.setIdd(rs.getString("id"));
               // obj.setPasswd(rs.getString("passwd"));
               // obj.setName(rs.getString("name"));
               // obj.setYear(rs.getString("year"));
               // obj.setSnum(rs.getString("snum"));
              //  obj.setDepart(rs.getString("depart"));
               // obj.setMobile1(rs.getString("mobile1"));
               // obj.setMobile2(rs.getString("mobile2"));
               // obj.setAddress(rs.getString("address"));
              //  obj.setEmail(rs.getString("email"));
                arr.add(obj);
            }
        } finally {
            closecon();
        }
        return arr; //여러개의 객체를 담아서 정보를 보내기 위해서 필요
    }
    

        public C_getset db123(String id) throws Exception { //아이디를 선택받아 그 아이디만의 정보를 셀렉하는 매서드
        	C_getset obj = null; //선택받은 아이디를 매개변수로 받아와 그 아이디를 다시 리턴값으로 보냄
            try {
                connec();
                if (conn == null)
                    throw new Exception("데이터베이스에 연결할 수 없습니다");
                ResultSet rs = stmt.executeQuery("SELECT * FROM student where id='" + id + "';");

                if (rs.next()) {
                 //   obj = new C_getset();
                   // obj.setIdd(rs.getString("id"));
                   // obj.setPasswd(rs.getString("passwd"));
                  //  obj.setName(rs.getString("name"));
                  //  obj.setYear(rs.getString("year"));
                  //  obj.setSnum(rs.getString("snum"));
                   // obj.setDepart(rs.getString("depart"));
                  //  obj.setMobile1(rs.getString("mobile1"));
                   // obj.setMobile2(rs.getString("mobile2"));
                  //  obj.setAddress(rs.getString("address"));
                  //  obj.setEmail(rs.getString("email"));
                }
            } finally {
                closecon();
            }
            return obj;
        }
}

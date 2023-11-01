package adventour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Mpg_Q_dbsave {
	
	/**
	 * @return
	 * @throws Exception
	 * 
	 * db연결 Connection 생성
	 * 
	 */
	private Connection getConnection() throws Exception { // 데이터베이스 연결을 위한 매소드
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf-8", "root", "0521");
		/* return DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf-8", "root", "qhdks12!@"); */
 
	}
	
//	private Connection getConnection(String driver, String url, String id, String pw) throws Exception { // 데이터베이스 연결을 위한 매소드
//		Class.forName(driver);
//		return DriverManager.getConnection(url+"?characterEncoding=utf-8", id, pw);
//	}
	
	/**
	 * @param conn
	 * @return
	 * @throws Exception
	 * 
	 * statement 생성
	 * 
	 */
	private Statement getStmt(Connection conn) throws Exception {
		return conn.createStatement();
	}

	/**
	 * @param q_num
	 * @param q_title
	 * @param q_cntt
	 * @param m_id
	 * @param q_date
	 * @return
	 * @throws Exception
	 * 
	 * db 저장.
	 */
	
	
	//insert 메서드
	public int dbInsert(String q_title, String q_cntt, String m_id) throws Exception { // 입력받은 정보를 저장 insert하는 매소드

		int rowNum = 0;
		
		// try 종료 후 () 선언한 변수 종료. close 필요 없음
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다");
			}
			
			String command = String.format(
					"INSERT INTO qna (q_title, q_cntt, m_id )"
							+"VALUES('"+ q_title+"', '"+ q_cntt+"', '"+ m_id+"');" ); 
			//데이터베이스 명령문 사용
					
			rowNum = stmt.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return rowNum;
	}
	
	
	//select 메서드
	public List<Map<String, Object>> dbSelect(String m_id) throws Exception{
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다");
			}
			
			String command = "SELECT * FROM qna where m_id = '"+m_id+"';"; 
			//데이터베이스 명령문 사용
//			result = 
			ResultSet rs =  stmt.executeQuery(command);
			
			while(rs.next()) {
				Map<String, Object> tmpMap = new HashMap<String, Object>();
				String q_num	= rs.getString("q_num");
				String q_title	= rs.getString("q_title");
				String q_cntt	= rs.getString("q_cntt");
//				String m_id_t	= rs.getString("m_id");
				String q_date	= rs.getString("q_date");
				tmpMap.put("q_num", q_num);
				tmpMap.put("q_title", q_title);
				tmpMap.put("q_cntt", q_cntt);
				tmpMap.put("m_id", m_id);
				tmpMap.put("q_date", q_date);
				resultList.add(tmpMap);
			}
			
//			System.out.println("Mpg_Q_dbsave dbSelect");
//			System.out.println(resultList);
//			System.out.println("Mpg_Q_dbsave dbSelect");
					
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return resultList;
	}
	
	
	//delete 메서드
	public int dbDelete(int q_num) throws Exception{
		int rowNum = 0;
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다");
			}
			
			
			String command = "delete FROM qna where q_num = "+q_num + ";";
			//데이터베이스 명령문 사용
			rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 DB에 삭제할 수 없습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return rowNum;
	}
	
}
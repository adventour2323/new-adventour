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
	 * db���� Connection ����
	 * 
	 */
	private Connection getConnection() throws Exception { // �����ͺ��̽� ������ ���� �żҵ�
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/adventour?characterEncoding=utf-8", "root", "dkssud2!!");
	}
	
//	private Connection getConnection(String driver, String url, String id, String pw) throws Exception { // �����ͺ��̽� ������ ���� �żҵ�
//		Class.forName(driver);
//		return DriverManager.getConnection(url+"?characterEncoding=utf-8", id, pw);
//	}
	
	/**
	 * @param conn
	 * @return
	 * @throws Exception
	 * 
	 * statement ����
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
	 * db ����.
	 */
	
	
	//insert �޼���
	public int dbInsert(String q_title, String q_cntt, String m_id) throws Exception { // �Է¹��� ������ ���� insert�ϴ� �żҵ�

		int rowNum = 0;
		
		// try ���� �� () ������ ���� ����. close �ʿ� ����
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
			}
			
			String command = String.format(
					"INSERT INTO qna (q_title, q_cntt, m_id )"
							+"VALUES('"+ q_title+"', '"+ q_cntt+"', '"+ m_id+"');" ); 
			//�����ͺ��̽� ��ɹ� ���
					
			rowNum = stmt.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return rowNum;
	}
	
	
	//select �޼���
	public List<Map<String, Object>> dbSelect(String m_id) throws Exception{
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
			}
			
			String command = "SELECT * FROM qna where m_id = '"+m_id+"';"; 
			//�����ͺ��̽� ��ɹ� ���
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
	
	
	//delete �޼���
	public int dbDelete(int q_num) throws Exception{
		int rowNum = 0;
		try (Connection conn = getConnection(); Statement stmt = getStmt(conn);){
			
			if (conn == null) {
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�");
			}
			
			
			String command = "delete FROM qna where q_num = "+q_num + ";";
			//�����ͺ��̽� ��ɹ� ���
			rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("�����͸� DB�� ������ �� �����ϴ�.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		return rowNum;
	}
	
}
package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.H_getset;

public class H_Select_package_conn {

	static H_Select_package_conn mainConn = new H_Select_package_conn();
	// 아래 매소드에서 실제 명령문이 적혀이는 xml에서  받아온 값을 가지고 다른파일에 가지위해서 싱글톤형식으로 객체화
	public static H_Select_package_conn instance() {
		return mainConn;
	}
	SqlSessionFactory dbconnect = DB_conn.getSqlSession(); 
	//데이터베이스를 연결하는 파일을 연결해서 받아온다 = 싱글톤 페턴으로 객체화

	public List<H_getset> h_P_select() {

	    SqlSession ret_dbconn = dbconnect.openSession();
	  //리턴타입 확인 후 객체화- openSession = 데이터베이스 명령문을 그대로 집어넣는게 아닌 클래스를 이용하기위해
	    List<H_getset> p_list = ret_dbconn.selectList("select_packages"); 

	    //selectList 스페이스 울러서 확인 한 값
	  //statement 안에 데이터베이스 명령문 작성해야함 selectList= 파일을 만들어서 연결 할 것(select문에 mapper의 해당문장 id를 받아와야함다 /
	    ret_dbconn.close();//open을 했으면 닫아줘야함
	    return p_list;
	  //호출한 앞페이지로 리턴값 전달
	}
}
package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.H_getset;

public class H_Select_mainsch_conn {

	static H_Select_mainsch_conn mainConn = new H_Select_mainsch_conn();
	// 아래 매소드에서 실제 명령문이 적혀이는 xml에서  받아온 값을 가지고 다른파일에 가지위해서 싱글톤형식으로 객체화
	public static H_Select_mainsch_conn instance() {
		return mainConn;
	}

	SqlSessionFactory dbconnect = DB_conn.getSqlSession(); 
	//데이터베이스를 연결하는 파일을 연결해서 받아온다 = 싱글톤 페턴으로 객체화
	
	public List<H_getset> h_schselect(String country_eng, String city_eng, String h_indateY,String h_indateM,String h_indateD,
			String h_outdateY,String h_outdateM,String h_outdateD, String h_roompeo) {
		
		System.out.println(city_eng); //매개변수 넘어오는지 확인 uk
		 
	    SqlSession ret_dbconn = dbconnect.openSession();
	  //리턴타입 확인 후 객체화- openSession = 데이터베이스 명령문을 그대로 집어넣는게 아닌 클래스를 이용하기위해
	   
	    H_getset sch_list2 = new H_getset(); //매개변수 전달위해서
	    sch_list2.setCountry_ko(country_eng);
	    sch_list2.setCity_ko(city_eng);
	    sch_list2.setH_indateY(h_indateY);
	    sch_list2.setH_indateM(h_indateM);
	    sch_list2.setH_indateD(h_indateD);
	    sch_list2.setH_outdateY(h_outdateY);
	    sch_list2.setH_outdateM(h_outdateM);
	    sch_list2.setH_outdateD(h_outdateD);
	    sch_list2.setH_roompeo(h_roompeo);
	    
	    
	    List<H_getset> ukAll_list = ret_dbconn.selectList("select_main_search",sch_list2); 
	    //selectList 스페이스 울러서 확인 한 값
	  //statement 안에 데이터베이스 명령문 작성해야함 selectList= 파일을 만들어서 연결 할 것(select문에 mapper의 해당문장 id를 받아와야함다 /
	    for (H_getset item : ukAll_list) {//값이 잘 넘어오는지 확인 - ok
            System.out.println(item.getH_name_eng());
	    }
	    
	    ret_dbconn.close();//open을 했으면 닫아줘야함
	    return ukAll_list;
	  //호출한 앞페이지로 리턴값 전달
	}
}
   
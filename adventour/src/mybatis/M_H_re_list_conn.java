package mybatis;

import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.H_getset;

public class M_H_re_list_conn {

	static M_H_re_list_conn  tomypage_in = new M_H_re_list_conn();
	// 아래 매소드에서 실제 명령문이 적혀이는 xml에서  받아온 값을 가지고 다른파일에 가지위해서 싱글톤형식으로 객체화
	public static M_H_re_list_conn instance() {
		return tomypage_in;
	}

	SqlSessionFactory dbconnect = DB_conn.getSqlSession(); 
	//데이터베이스를 연결하는 파일을 연결해서 받아온다 = 싱글톤 페턴으로 객체화
	
	public List<H_getset> mypage_hotel(String h_m_id) {
	    try {
	        System.out.println("2번확인" + h_m_id);

	        SqlSession ret_dbconn = dbconnect.openSession();
	        H_getset h_m_list2 = new H_getset();
	        h_m_list2.setH_m_id(h_m_id);

	        List<H_getset> h_m_list = ret_dbconn.selectList("tomypageh_select", h_m_list2);
	        System.out.println("마지막 출력확인1122");
	        for (H_getset item : h_m_list) {
//	            System.out.println("마지막 출력확인");
//	            System.out.println("마지막 출력확인" + item.getH_name_eng());
//	            System.out.println("마지막 출력확인" + item.getH_name_ko());
	            System.out.println("마지막 출력확인" + item.getH_tinum());
	        }

	        ret_dbconn.close();
	        return h_m_list;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외가 발생한 경우 빈 리스트 반환
	        return Collections.emptyList();
	    }
	}
  
}
 
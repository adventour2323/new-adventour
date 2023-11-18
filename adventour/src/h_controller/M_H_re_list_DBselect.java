package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_Top10_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;
import mybatis.M_H_re_list_conn;

public class M_H_re_list_DBselect implements h_conn_interface { //데이터베이스
    static M_H_re_list_DBselect tomy_interface = new M_H_re_list_DBselect();

    public static M_H_re_list_DBselect im_inter() {
        return tomy_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	M_H_re_list_conn sin_interface = M_H_re_list_conn.instance();
    	
    	String h_m_id = re.getParameter("customer"); 
   	    System.out.println("1번확인"+h_m_id); //ok
    	 
    	
        List <H_getset> h_m_list = sin_interface.mypage_hotel(h_m_id);  //select 결과 가져오기 위해 작성
        for (H_getset item : h_m_list) {//값이 잘 넘어오는지 확인 - ok
        	
        System.out.println("마지막 출력확인2");
          System.out.println("마지막 출력확인2"+item.getH_name_eng());

	    }
        re.setAttribute("h_m_list", h_m_list);         
        return null;
    }       

}
   
package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_Top10_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_MainTop10_DBselect implements h_conn_interface { //데이터베이스
    static H_MainTop10_DBselect h10_interface = new H_MainTop10_DBselect();

    public static H_MainTop10_DBselect im_inter() {
        return h10_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	H_Select_Top10_conn sin_interface = H_Select_Top10_conn.instance();
    	
    	String top10_info = re.getParameter("uname"); 
   	    System.out.println(top10_info); //ok
    	 
    	
        List <H_getset> top_list = sin_interface.h_top1010(top10_info);  //select 결과 가져오기 위해 작성
//        for (H_getset item : top_list) {//값이 잘 넘어오는지 확인 - ok
//          System.out.println(item.getH_name_eng());
//
//	    }
        re.setAttribute("top_list", top_list);         
        return null;
    }       

}

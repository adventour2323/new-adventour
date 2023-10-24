package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_infosch_conn;
import mybatis.H_Select_mainsch_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_InfoSch_DBselect implements h_conn_interface { //데이터베이스
    static H_InfoSch_DBselect h_interface = new H_InfoSch_DBselect();

    public static H_InfoSch_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	H_Select_infosch_conn sin_interface = H_Select_infosch_conn.instance();
    	
    	String contry_list = re.getParameter("uname"); 
         	System.out.println(contry_list); //uk
    	   String h_name_eng = re.getParameter("h_name_eng");
           String h_indate = re.getParameter("h_indate");
           String h_outdate = re.getParameter("h_outdate");
           String h_roompeo = re.getParameter("h_peo");
          
           System.out.println(h_name_eng);
           System.out.println( h_indate);
           System.out.println(h_outdate);
           System.out.println(h_roompeo);
    	 
    	
        List <H_getset> infoshc_list = sin_interface.h_infoschselect(h_name_eng,h_roompeo, h_indate, h_outdate );  //select 결과 가져오기 위해 작성
//        for (H_getset item : ukAll_list) {//값이 잘 넘어오는지 확인 - ok
//            System.out.println(item.getH_name_eng());
//            System.out.println(item.getH_name_ko());
//	    }
        re.setAttribute("infoshc_list", infoshc_list);         
        return null;
    }       

}
   
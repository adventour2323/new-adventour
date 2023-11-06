package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_infosch_conn;
import mybatis.H_Select_mainsch_conn;
import mybatis.H_Select_toreserv_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_Toreserv_DBselect implements h_conn_interface { //데이터베이스
    static H_Toreserv_DBselect h_interface = new H_Toreserv_DBselect();

    public static H_Toreserv_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	H_Select_toreserv_conn sin_interface = H_Select_toreserv_conn.instance();
    	
	  String h_name_eng = re.getParameter("h_info_search_nameeng");
	  String h_indate = re.getParameter("sch_indate");
	  String h_outdate = re.getParameter("sch_outdate");
	  String night_time = re.getParameter("night_time");
	  String h_peo = re.getParameter("sch_peo");
	  String h_roomnum = re.getParameter("h_room_num");

	    System.out.println("확인 2");
	    System.out.println("h_name_eng: " + h_name_eng);
	    System.out.println("h_indate: " + h_indate);
	    System.out.println("h_outdate: " + h_outdate);
	    System.out.println("night_time: " + night_time);
	    System.out.println("h_peo: " + h_peo);
	    System.out.println(h_roomnum);
	    System.out.println("확인 2 끝");

    	
        List <H_getset> infoshc_list = sin_interface.h_toreserv(h_name_eng,h_roomnum );  //select 결과 가져오기 위해 작성
        for (H_getset item :  infoshc_list) {//값이 잘 넘어오는지 확인 - ok
            System.out.println(item.getH_name_eng());
            System.out.println(item.getH_name_ko());
	    }
        re.setAttribute("infoshc_list", infoshc_list);         
        return null;
    }       

}
   
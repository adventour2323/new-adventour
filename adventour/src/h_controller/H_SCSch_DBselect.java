package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_SCsch_conn;
import mybatis.H_Select_mainsch_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_SCSch_DBselect implements h_conn_interface { //데이터베이스
    static H_SCSch_DBselect h_interface = new H_SCSch_DBselect();

    public static H_SCSch_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	H_Select_SCsch_conn sin_interface = H_Select_SCsch_conn.instance();
    	
    	String scsearch = re.getParameter("uname"); 
 //    	System.out.println(contry_list); //uk
    	   String country_ko = re.getParameter("sch_country");
           String city_ko = re.getParameter("sch_city");
           String h_indate = re.getParameter("sch_indate");
           String h_outdate = re.getParameter("sch_outdate");
           String h_roompeo = re.getParameter("sch_adult");
           String sch_minpri = re.getParameter("sch_minpri");
           String sch_maxpri = re.getParameter("sch_maxpri");
           String h_twin = re.getParameter("h_twin");
           String h_double = re.getParameter("h_double");
           String h_queen = re.getParameter("h_queen");
          
           System.out.println(country_ko);
           System.out.println(city_ko);
           System.out.println(h_indate);
           System.out.println(h_outdate);
           System.out.println(h_roompeo);
           System.out.println(sch_minpri);
           System.out.println(sch_maxpri);
           System.out.println(h_double);
           System.out.println(h_twin);
           System.out.println(h_queen);
           
    	 
    	
        List <H_getset> ukAll_list = sin_interface.h_scsch(country_ko, city_ko, h_indate,  h_outdate, h_roompeo,sch_minpri,sch_maxpri,h_double,h_twin,h_queen  );  //select 결과 가져오기 위해 작성
//        for (H_getset item : ukAll_list) {//값이 잘 넘어오는지 확인 - ok
//            System.out.println(item.getH_name_eng());
//            System.out.println(item.getH_name_ko());
//	    }
        re.setAttribute("ukAll_list", ukAll_list);         
        return null;
    }       

}
   
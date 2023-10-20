package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_CityAll_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_CityAll_DBselect implements h_conn_interface { //데이터베이스
    static H_CityAll_DBselect h_interface = new H_CityAll_DBselect();

    public static H_CityAll_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	
    	H_Select_CityAll_conn sin_interface =H_Select_CityAll_conn.instance();
    	
    	String contry_list = re.getParameter("city"); 
   	System.out.println(contry_list); //uk
    	 
    	
        List <H_getset> ukAll_list = sin_interface. h_cityselect(contry_list);  //select 결과 가져오기 위해 작성
        for (H_getset item : ukAll_list) {//값이 잘 넘어오는지 확인 - ok
           System.out.println(item.getH_name_eng());
           System.out.println(item.getH_name_ko());
	    }
        re.setAttribute("ukAll_list", ukAll_list);         
        return null;
    }       

}
   
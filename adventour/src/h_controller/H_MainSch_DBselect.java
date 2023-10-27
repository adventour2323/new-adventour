package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_mainsch_conn;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_MainSch_DBselect implements h_conn_interface { 
    static H_MainSch_DBselect h_interface = new H_MainSch_DBselect();
    public static H_MainSch_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) 
    		throws Exception {
   	H_Select_mainsch_conn sin_interface = H_Select_mainsch_conn.instance();
    	   String country_eng = re.getParameter("h_mainde");
           String city_eng = re.getParameter("h_maincity");
           String h_indateY = re.getParameter("h_indateY");
           String h_indateM = re.getParameter("h_indateM");
           String h_indateD = re.getParameter("h_indateD");
           String h_outdateY = re.getParameter("h_outdateY");
           String h_outdateM = re.getParameter("h_outdateM");
           String h_outdateD = re.getParameter("h_outdateD");
           String h_roompeo = re.getParameter("h_mainpeo");

        List <H_getset> ukAll_list = sin_interface.h_schselect
        		(country_eng, city_eng, h_indateY,  h_indateM,  h_indateD ,
        		h_outdateY, h_outdateM, h_outdateD, h_roompeo);  

        re.setAttribute("ukAll_list", ukAll_list);         
        return null;
    }       
}
   

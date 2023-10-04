package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_ukAll_conn;
import mybatis.H_mainSelect_conn;

public class H_MainukAll_DBselect implements h_conn_interface { //데이터베이스
    static H_MainukAll_DBselect h_interface = new H_MainukAll_DBselect();

    public static H_MainukAll_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	H_Select_ukAll_conn sin_interface = H_Select_ukAll_conn.instance();
        List <H_getset> ukAll_list = sin_interface.h_ukAllselect();         
        re.setAttribute("ukAll_list", ukAll_list);         
        return null;
    }       

}

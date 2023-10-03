package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_package_conn;
import mybatis.H_mainSelect_conn;

public class H_MainPackage_DBselect implements h_conn_interface { //데이터베이스
    static H_MainPackage_DBselect h_interface = new H_MainPackage_DBselect();

    public static H_MainPackage_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	H_Select_package_conn sin_interface = H_Select_package_conn.instance();
        List <H_getset> p_list = sin_interface.h_P_select();         
        re.setAttribute("p_list", p_list);         
        return null;
    }       

}

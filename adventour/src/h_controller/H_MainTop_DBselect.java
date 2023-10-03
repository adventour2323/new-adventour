package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_mainSelect_conn;

public class H_MainTop_DBselect implements h_conn_interface { //데이터베이스
    static H_MainTop_DBselect h_interface = new H_MainTop_DBselect();

    public static H_MainTop_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	H_mainSelect_conn sin_interface = H_mainSelect_conn.instance();
        List <H_getset> list = sin_interface.h_select();         
        re.setAttribute("list", list);         
        return null;
    }       

}

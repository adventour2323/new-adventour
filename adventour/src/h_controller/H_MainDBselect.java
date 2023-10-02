package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_mainSelect_conn;

public class H_MainDBselect implements h_conn_interface { //데이터베이스
    static H_MainDBselect h_interface = new H_MainDBselect();

    public static H_MainDBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	H_mainSelect_conn sin_interface = H_mainSelect_conn.instance();
        List <H_getset> list = sin_interface.c_select();         
        re.setAttribute("list", list);         
        return null;
    }       

}

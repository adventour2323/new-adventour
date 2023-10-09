package s_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.S_getset;
import mybatis.H_mainSelect_conn;
import mybatis.S_mainSelect_conn;

public class S_MainDBselect implements S_conn_interface { //데이터베이스
    static S_MainDBselect h_interface = new S_MainDBselect();

    public static S_MainDBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
    	S_mainSelect_conn sin_interface = S_mainSelect_conn.instance();
        List <S_getset> list = sin_interface.h_select();         
        re.setAttribute("list", list);         
        return null;
    }       

}

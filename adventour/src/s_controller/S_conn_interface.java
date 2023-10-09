package s_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface S_conn_interface {
	//기능이 없고 형태만 있는 매소드들을 포함하는 인터페이스
 	
		 String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception; 
		//기능이 없고 형태만 있는 매소드 
}

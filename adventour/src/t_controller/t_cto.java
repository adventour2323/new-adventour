package t_controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t_mybatis.h_t_sel_con;
import getset.tourlist_gs;


public class t_cto extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest rq, HttpServletResponse rs) 
			throws ServletException, IOException {
		
		t_con_interface inter = null;
		String tour  = rq.getParameter("tour");
		String t_id = rq.getParameter("");
		String home = rq.getParameter("home");
				
		try {
			
			if(tour.equals("main") ) {
				inter = t_g_db_sel.g_select();
				String g = inter.t_interf(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("tour_jsp.jsp");
				dispatcher.forward(rq, rs);
				
			} else if(tour.equals("tourlist")) {
				inter = t_t_db_sel.t_select();
				String tl = inter.t_interf(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("t_list.jsp");
				dispatcher.forward(rq, rs);
			} else if(tour.equals("tourinformation")) {
				inter = t_t_db_sel.t_select();
				String ti = inter.t_interf(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("");
			} else if(tour.equals("home")) {
			    t_con_interface hinter = (t_con_interface) h_t_sel_con.instance(); // 변경된 부분
			    String aa = hinter.t_interf(rq, rs);
			    RequestDispatcher dispatcher = rq.getRequestDispatcher("index_login_ing.jsp");
			    dispatcher.forward(rq, rs);
			}


			
		}  catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	

}

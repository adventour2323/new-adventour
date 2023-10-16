package t_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class t_cto extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest rq, HttpServletResponse rs) 
			throws ServletException, IOException {
		
		t_con_interface inter = null;
		String tour  = rq.getParameter("tour");
		String t_id = rq.getParameter("");
				
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
			}
			
		}  catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	

}

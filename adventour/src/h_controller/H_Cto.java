package h_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;


public class H_Cto extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String uName ="";
    	uName = request.getParameter("uname");
        h_conn_interface inter = H_MainDBselect.im_inter();
        h_conn_interface p_inter = H_MainPackage_DBselect.im_Pinter();
        
//        System.out.println(uName); //파라미터 값이 잘 넘어오는지 확인 - 확인 ok

        try {         
        	if (uName.equals("hmain")) {
                    String n = inter.showdata(request, response);  
                    String m = p_inter.showdata(request, response); 
                
                    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
                    dispatcher.forward(request, response);
                    
//        	}else if(uName.equals("???")){
//        		String n = inter.showdata(request, response);
//                RequestDispatcher dispatcher = request.getRequestDispatcher("h_top_out.jsp");
//                dispatcher.forward(request, response);
        	}
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
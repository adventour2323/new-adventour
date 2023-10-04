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
        h_conn_interface ukinter = H_MainukAll_DBselect.im_inter();
  
        
//        System.out.println(uName); //파라미터 값이 잘 넘어오는지 확인 - 확인 ok

        try {         
        	if (uName.equals("hmain")) {
                    String n = inter.showdata(request, response);                
                    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
                    dispatcher.forward(request, response);                
        	}else if(uName.equals("ukAll")){
        		String uk = ukinter.showdata(request, response); 
               RequestDispatcher dispatcher = request.getRequestDispatcher("hotel_sc.jsp");
               dispatcher.forward(request, response);
        	}           
             
             
        	
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
package h_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class H_Cto extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        h_conn_interface inter = H_MainDBselect.im_inter();

        try {         
             
                    String n = inter.showdata(request, response);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
                    dispatcher.forward(request, response);
//               
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
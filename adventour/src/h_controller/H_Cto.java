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
        h_conn_interface htop10inter = H_MainTop10_DBselect.im_inter();
        String top10N = "";
        top10N =request.getParameter("bbb");
        
        
        		
        //System.out.println(uName); //파라미터 값이 잘 넘어오는지 확인 - 확인 ok

        try {         
        	if (uName.equals("hmain")) { //호텔 메인에  top10이 보이게 하는
                    String n = inter.showdata(request, response);                
                    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
                    dispatcher.forward(request, response);    
                    
        	}else if(uName.equals("uk") || uName.equals("italy")  || uName.equals("france") || uName.equals("spain")){ 
        		//국기모양 나라별 조회
        		String contry_list = request.getParameter("uname"); //매개변수 전달 위해 작성
             	//System.out.println(contry_list);  //파라미터 값이 잘 넘어오는지 확인 - 확인 ok
        	   String uk = ukinter.showdata(request, response); //select문을 하기위해 작성
               RequestDispatcher dispatcher = request.getRequestDispatcher("hotel_sc.jsp");
               dispatcher.forward(request, response);
               
        	} else if (uName.equals("top10N")) {
        	    // 호텔 메인에 조회해서 나온 top10 중 하나를 누르면 해당 호텔 상세페이지로 

        	    String top10_info = request.getParameter("uname"); // 매개변수 전달 위해 작성
        	    System.out.println(top10_info); // 파라미터 값이 잘 넘어오는지 확인 - 확인 ok

        	    String htop10 = htop10inter.showdata(request, response); // select문을 하기 위해 작성
        	    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel_info.jsp");
        	    dispatcher.forward(request, response);
        	} 
             
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
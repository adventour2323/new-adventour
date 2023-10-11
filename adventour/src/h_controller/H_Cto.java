package h_controller;

import java.io.IOException;
import java.util.List;

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
        h_conn_interface htop10inter1 =  H_MainSch_DBselect.im_inter();
        
        

       System.out.println(uName); //파라미터 값이 잘 넘어오는지 확인 -ok

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
        	
        	}else if(uName.equals("hotelSearch")) { // 호텔 메인에 셀렉박스 검색창
        		 
                 String country_eng = request.getParameter("h_mainde");
                 String city_eng = request.getParameter("h_maincity");
                 String h_indateY = request.getParameter("h_indateY");
                 String h_indateM = request.getParameter("h_indateM");
                 String h_indateD = request.getParameter("h_indateD");
                 String h_outdateY = request.getParameter("h_outdateY");
                 String h_outdateM = request.getParameter("h_outdateM");
                 String h_outdateD = request.getParameter("h_outdateD");
                 String h_mainpeo = request.getParameter("h_mainpeo");
                 int h_roompeo =Integer.valueOf(h_mainpeo);
                 
                 System.out.println(country_eng);
                 System.out.println(city_eng);
                 System.out.println(h_indateY);
                 System.out.println(h_indateM);
                 System.out.println(h_indateD);
                 System.out.println(h_outdateY);
                 System.out.println(h_outdateM);
                 System.out.println(h_outdateD);
                 System.out.println( h_mainpeo);
                 System.out.println(h_roompeo);
                 
        	    String hmsearch = htop10inter1.showdata(request, response);  
        	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("hotel_sc.jsp");
        	    dispatcher2.forward(request, response);
        	}else if (uName.equals(uName)) {
        	    // 호텔 메인에 조회해서 나온 top10 중 하나를 누르면 해당 호텔 상세페이지로 

        	    String top10_info = request.getParameter("uname"); // 매개변수 전달 위해 작성
      	       // System.out.println(top10_info); // 파라미터 값이 잘 넘어오는지 확인  -ok
 
        	    String htop10 = htop10inter.showdata(request, response);  
        	    RequestDispatcher dispatcher1 = request.getRequestDispatcher("hotel_info.jsp");
        	    dispatcher1.forward(request, response);
        	}
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }  
} 
package adventour;

import java.io.IOException;

import javax.servlet.ServletException; //컨트롤 시프트 o = 자동으로 import 해줌
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/C_listmenu")
public class C_listmenu extends HttpServlet { 
	private static final long serialVersionUID = 1L;
       


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	request.setCharacterEncoding("UTF-8"); //넘어온 값을 인코팅
//	response.setContentType("text/html;characterset=UTF-8");
//	String country = request.getParameter("country");
//	response.getWriter().write(getJson(country));
//	}
//
//	public String getJSON(String country) { // 인덱스에서 받은 요청의 결과는 JSON 형태의 값으로 돌아온다 -응답
//		  
//		if(country == null) country = "";
//		StringBuffer result = new StringBuffer("");
//		result.append("{\result\":["); 
//		C_dbsave C_dbsave = new C_dbsave(); //전에 만들어 놓은 데이터 베이스를 연결하는 매소드를 사용
//		ArrayList<country> countryList = C_dbsave.c_listshow(country); //매개변수로 넘어 온 값을 가지고 함수 사용
//		 for (int i = 0; i<countryList.size(); i++) {
//			 result.append("[{\"value\":"" + countryList(i).getCountry() + "\"},");
//			 result.append("{\"value\":"" + countryList(i).getCountry() + "\"},");
//			 result.append("{\"value\":"" + countryList(i).getCountry() + "\"},");
//			 result.append("{\"value\":"" + countryList(i).getCountry() + "\"},");
//			 result.append("{\"value\":"" + countryList(i).getCountry() + "\"},");
//			 result.append("{\"value\":"" + countryList(i).getCountry() + "\"}],");
//		 }
//		
//		 result.append("]}");
//		 return result.toString();
//	}
	
}

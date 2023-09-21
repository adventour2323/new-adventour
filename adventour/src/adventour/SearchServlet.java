package adventour;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException; 
import java.util.ArrayList;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트로부터 검색어를 받아옴
        String searchKeyword = request.getParameter("keyword");

        // 검색 로직 수행 (위에서 수정한 메서드를 호출)
        ArrayList<C_getset> searchResults = null;
        try {
            C_dbsave dbHelper = new C_dbsave(); // 데이터베이스 연결 도우미 클래스
            searchResults = dbHelper.searchByKeyword(searchKeyword);
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 처리
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        // JSON 형식으로 검색 결과를 응답으로 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonResponse = objectMapper.writeValueAsString(searchResults);
        response.getWriter().write(jsonResponse);
    }
}
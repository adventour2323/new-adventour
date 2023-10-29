<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>

<%
    // 파일 업로드 경로 설정
    String uploadPath = request.getRealPath("/c_upload"); 
    // 웹 애플리케이션 내에서 업로드 폴더를 얻어옵니다.

    // 업로드 파일 크기 제한 (약 10MB)
    int size = 10 * 1024 * 1024;

    // 변수 초기화
    String m_id = ""; 
    String country = ""; 
    String city = ""; 
    String c_title = ""; 
    String c_cont = ""; 
    String c_pho1 = ""; // 첨부파일
    String c_pho2 = "";
    String c_pho3 = "";
    String c_pho4 = "";
    String c_pho5 = "";
    String origfilename1 = "";
    String origfilename2 = "";
    String origfilename3 = "";
    String origfilename4 = "";
    String origfilename5 = "";
    
    try { 
        // MultipartRequest를 사용하여 파일 업로드 처리
        MultipartRequest multi = new MultipartRequest(request,
            uploadPath, // 업로드 경로
            size,  // 파일 크기 제한
            "UTF-8", // 인코딩 타입
            new DefaultFileRenamePolicy());

        // 폼 데이터에서 필요한 정보를 가져옵니다.
        m_id = multi.getParameter("c_writer");
        country = multi.getParameter("c_country");
        city = multi.getParameter("c_city");
        c_title = multi.getParameter("c_title");
        c_cont = multi.getParameter("c_con");
        
        System.out.println("아이디1"+ m_id);
        System.out.println("나라1" + country);
        System.out.println("도시1"+ city);
        System.out.println("제목1"+ c_title);
        System.out.println("내용1"+ c_cont);
       
        
        // 업로드 파일 처리
        Enumeration files = multi.getFileNames();
        
        String file1 = (String) files.nextElement();
        c_pho1 = multi.getFilesystemName(file1);
        origfilename1 = multi.getOriginalFileName(file1);
        System.out.println("사진11"+c_pho1);
        System.out.println("사진오리지널1"+origfilename1);
       
        String file2 = (String) files.nextElement();
        c_pho2 = multi.getFilesystemName(file2);
        origfilename2 = multi.getOriginalFileName(file2);
        
        String file3 = (String) files.nextElement();
        c_pho3 = multi.getFilesystemName(file3);
        origfilename3 = multi.getOriginalFileName(file3);
        
        String file4 = (String) files.nextElement();
        c_pho4 = multi.getFilesystemName(file4);
        origfilename4 = multi.getOriginalFileName(file4);
        
        String file5 = (String) files.nextElement();
        c_pho5 = multi.getFilesystemName(file5);
        origfilename5 = multi.getOriginalFileName(file5);
       
        // 파일 및 폼 데이터를 request attribute로 설정
        request.setAttribute("c_writer", m_id);
        request.setAttribute("c_country", country);
        request.setAttribute("c_city", city);
        request.setAttribute("c_title", c_title);
        request.setAttribute("c_con", c_cont);
        request.setAttribute("c_pho1", c_pho1);
        request.setAttribute("c_pho2", c_pho2);
        request.setAttribute("c_pho3", c_pho3);
        request.setAttribute("c_pho4", c_pho4);
        request.setAttribute("c_pho5", c_pho5);
        request.setAttribute("origfilename1", origfilename1);
        request.setAttribute("origfilename2", origfilename2);
        request.setAttribute("origfilename3", origfilename3);
        request.setAttribute("origfilename4", origfilename4);
        request.setAttribute("origfilename5", origfilename5);
      
        // c_database.jsp로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("c_database.jsp");
        dispatcher.forward(request, response);   


    } catch (Exception e) {
        e.printStackTrace();
    }
    
  

%>
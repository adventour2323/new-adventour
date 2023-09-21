<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "adventour.g_list_print" %>
<%@ page import = "adventour.g_getset" %>
<%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>
<style>

body {
  margin-top: 0px;
  margin-right: 0px;
  margin-left: 0px;
  margin-bottom: 0px;
  width: 1903px;
  height: 1650px;

}

* {
  margin: 0;
  padding: 0;
} 

.content{
    width: 1300px;
    /* height: 2150px; */
    margin-bottom: 40px;
    /* border-style: dashed; */
    
    margin-top: 50px;
    margin-left: 300px;
}

table {
    width: 100%;
    
    border-collapse: collapse;
  }
   

  .container{
	  text-align: center;
  }

.container a{
  display: block; /* 영역적용위해 사용 */
  width: 100%; height: 100%;

  overflow: hidden;

  position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 */
}

.container figcaption{
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.7);

  position: absolute; /* 이미지와 겹치게 처리 */
  top: 0; left: 0;

  color: #fff; text-align: center;
  line-height: 200px;

  opacity: 0; /* 처음엔 안보이고 */

  transition: 0.3s;
}

.container a:hover figcaption, .container a:focus figcaption{
  /* 마우스를 올리면 보이게 처리 */
  opacity: 1;
}

  /*  */
  a {
    text-decoration-line: none;
  }
  a:link {
    color : black;
  }
  a:visited {
    color : black;
  }
  a:hover {
    color : red;
  }
  a:active {
    color : green;
  }


</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>



<body>

<h1>test</h1>

<jsp:useBean id="id" class="adventour.g_list_print">

<%

ArrayList<g_getset> a1 = id.g1();


%>
		
    
    <div class="content" style="padding: 100px;  border: solid; " >
        
		
		<div style="display: flex;">
		<% 
		for ( int i = 0; i < 4; i++ ) {
			g_getset g = a1.get(i);
		%>
		  <div class="container" style=" margin-left: 5px; ">
	  <table style="width: 100px; ">
		  <thead>
			  <tr>
				  <th style="cursor: pointer;" >
					   <a href="g_info.jsp?g_id=<%=g.getG_id()%>">
					  <figure>
					  <%
					  out.println("<img src='"+g.getImg()+"' width='200px' alt='img'>");
					  %>
					  <figcaption>자세히보기</figcaption>
					  </figure>
					   </a>
				  </th>
			  </tr>
		  </thead>
        <tbody >
            <tr>
                <td><%=g.getName()%></td>
            </tr>
        </tbody>
    </table>
	  
  </div>
  
  <% } %>
  </div>
</div>
</jsp:useBean>


</body>
</html>
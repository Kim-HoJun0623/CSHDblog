<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %> 
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="Board.BoardVO" %>
  <%@ page import="Board.BoardDAO" %>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>STORY</title>
    <link rel="stylesheet" href="../Css/story-style.css">
</head>
<body>

<%
	
	/* 	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		} */
		int pageNumber = 1;//기본은1페이지 전달
		//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
		//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
			
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
    <header class="header">
        <div class="header_top">
            <a href="../html/Login.jsp">LOGIN</a>
            <a href="../html/Sign.jsp">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../html/Mainpage.jsp">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
        <div class="header_gnb">
            <ul>
                <li><a href="../html/Gallery.jsp">GALLERY</a></li>
                <li><a href="../html/Story.jsp">STORY</a></li>
            </ul>
        </div>
    </header>
    <div class="tit">
        <h2>STORE</h2>
        <button> <a href="../html/Write.jsp">글쓰기</a></button>
    </div>

    <section class="cont">
     <div class="part">
    	<%
					BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
					for(int i=0; i<list.size(); i++){
		%>
       
            <div class="box">
            <a href="view.jsp?bId=<%=list.get(i).getbId()%>">
                <div class="img-box"><img src="../upload/<%=list.get(i).getbimage()%>" alt=""></div>
                <div class="text-box">
                <p><%= list.get(i).getbContent() %></p>
                </div>
              </a>
            </div>
      
        <%
			}
		%>
          </div>
       <!--  <div class="part">
            <div class="box">
                <div class="img-box"><img src="../Img/bird-5.PNG" alt=""></div>
                <div class="text-box">
                <p>아닌데요  >_<</p>
                </div>
            </div>
            <div class="box">
                <div class="img-box"><img src="../Img/rock.PNG" alt=""></div>
                <div class="text-box">
                <p>아닌데
                
                </p>
            </div>
            </div>
        </div> -->
        
    </section>
    	<!-- 페이지 처리 영억 -->
      <%
 		 if(pageNumber != 1){
    	%>
    	<a href="Story.jsp?pageNumber=<%= pageNumber - 1 %>">이전</a>
    	<%
    	}if(boardDAO.nextPage(pageNumber+1)){
    	%>
    		<a href="Story.jsp?pageNumber=<%= pageNumber + 1 %>">다음</a>
		<%
    	}
		%>
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %> 
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %>
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
		//메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			 userId = (String)session.getAttribute("userId"); 
			/* userId="김호준"; */
		}
	%>
    <header class="header">
        <a href="Mainpage.jsp" class="logo">
            <img src="../Img/logo.jpg" alt="logo">
        </a>
        <span class="menu">
            <a href="../html/Gallery.jsp">GALLERY</a>
            <a href="../html/Story.jsp">STORY</a>
        </span>
        <div class="search">
            <input type="text">
            <button>검색</button>
        </div>
		<%if(userId==null){ %>
        <span class="sign"> 
            <a href="../html/Sign.jsp">sign</a>
            <a href="../html/Login.jsp">login</a>
        </span>
        <%}else{ %>
        <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
        <%} %>
        
    </header>
    <div class="tit">
        <h2>STORE</h2>
    </div>
    <%
		
	int pageNumber = 1;//기본은1페이지 전달
	//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
	//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
		
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
    %>
	
	<!-- 마이페이지-내가올린 게시글만 보기 -->
    <section class="cont">
        <ul class="part">
         	<%
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
					if(userId.equals(list.get(i).getuserId())){
						
		%>
       
            <li class="box">
                <a href="../html/Posting.jsp?bId=<%=list.get(i).getbId()%>">
                <dt class="img-box"><img src="../upload/<%=list.get(i).getbimage()%>" alt="">
                </dt>
                <dt class="text-box">
                <p><%= list.get(i).getbContent() %></p>
                </dt>
            </a>
            </li>
             <%
			}else {}
		}
		%>
        </ul>
    </section>
    <div class="num">
    	<%
    		for(int i=0; i<boardDAO.PageList(userId);i++){
    			if(i==0){
    				
    			}else{
    	%>
        <a href="Story.jsp?pageNumber=<%=i%>"><%=i %></a>
        <%
    			}
    			} %>
    </div>
<%--     	<!-- 페이지 처리 영억 -->
      <%
 		 if(pageNumber != 1){
    	%>
    	<a href="Story.jsp?pageNumber=<%= pageNumber - 1 %>">이전</a>
    	<%
    	}%>
      <a><%=pageNumber %></a>
      <%
      if(boardDAO.nextPage(pageNumber+1)){
    	%>
    	<a href="Story.jsp?pageNumber=<%= pageNumber + 1 %>">다음</a>
		<%
    	}
		%> --%>
		

</body>
</html>
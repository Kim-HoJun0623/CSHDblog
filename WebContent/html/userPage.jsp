<%@page import="board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
		
		
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UserPage</title>
    <link rel="stylesheet" href="../Css/userpage.css">
</head>
<body>
    <header>
        <a href="../html/Mainpage.jsp" class="logo">
            <img src="../Img/logo.jpg" alt="logo">
        </a>
        <div class="search">
        <form action="SearchBoard.jsp">
                <div class="search-icon"></div>
                <input class="real-search" type="text" name="searchText" placeholder="이미지, 주제 검색">
                <span class="dropdown">
                    <select name="searchField">
                        <option value="0">모든</option>
                        <option value="bTitle">제목</option>
                        <option value="userId">작성자</option>
                    </select>
                    <span class="dropdown-icon"><img src="../Img/chevron-down-solid.svg" alt=""></span>
                </span>
            </form>
    </div>
        <%if(userId==null){ //로그인 안 되어 있을때%>
        <span class="sign">
            <a href="../html/Sign.jsp">sign</a>
            <a href="../html/Login.jsp">login</a>
        </span>
        <%}else{ %>
        <span class="sign">
        <a href="../html/userPage.jsp"><%=userId %>님</a>
        <a href="../html/logoutAction.jsp">Logout</a>
        </span>
        <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
        <%} %>
        
    </header>
    <section class="profile">
        <div class="main-img">
            <img src="../Img/big-user.png" alt="main-img">
            <div class="profile-contbox">
            <div class="profile-cont">
                <h2><%=userId  %></h2>
                <div class="usericon">
                    icon
                </div>
            </div> 
        </div>   
        </div>
    </section>
    
    <%
		
	int pageNumber = 1;//기본은1페이지 전달
	//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
	//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
		
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
    %>
	
	<!-- 마이페이지-내가올린 게시글만 보기 -->
    <section class="img-box">
        <div class="img-cont">
         	<%
         	
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.getList(pageNumber,userId);
				if(userId==null){}else{
				for(int i=0; i<list.size(); i++){
		%>
       

            <div class="box">
					           <a href="../html/Posting.jsp?bId=<%=list.get(i).getbId() %>" > <!-- 클릭시 -->
                  <img class="rounded" src="../upload/<%=list.get(i).getbimage()%>" /> <!-- 작은사진 -->
                </a>
			</div>

             <%
				}
		}
		%>
       	</div>
    </section>

    <%--<div class="num">

    	<%
    		for(int i=1; i<=boardDAO.PageList(userId);i++){
    		 if(i%4==1){
    	%>
        <a href="Story.jsp?pageNumber=<%=i/4+1%>"><%=i/4+1 %></a>
        <%
    			}
    			} %>

    </div>
     --%>

   
</body>
</html>
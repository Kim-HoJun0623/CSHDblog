<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

          <%@ page import="java.io.PrintWriter" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %>
  <%@ page import="java.util.ArrayList" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Main Page Layout</title>
<link rel="stylesheet" href="../Css/reset.css">
<link rel="stylesheet" href="../Css/font.css">
<link rel="stylesheet" href="../Css/newmain.css">
</head>

<body style="overflow-x:hidden">


	<%
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId"); 
				//로그인 세션 확인 되어있으면 값이 들어가고 아니면 null
	}
	String bcategory = "ALL";
	if(request.getParameter("bcategory")!=null){
		bcategory=request.getParameter("bcategory");
	}
%>

  <div id="wrap">
    <header class="header">
      <a href="../html/Mainpage.jsp" class="logo">
        <img src="../Img/logo.jpg" alt="logo">
    </a>
    

    <%
	if(userId == null){
		//로그인 안되어 있을 때
	
%>
		<span class="sign">
        <a href="../html/Sign.jsp">sign</a>
        <a href="../html/Login.jsp">login</a>
        </span>
        <%}else { %>
	<span class="sign">
	<a href="../html/userPage.jsp"><%=userId %>님</a>
    <a href="../html/logoutAction.jsp">Logout</a>
    </span>
    <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
    <%} %>
    

  </header>

<section class="cont">
      <div class="main-img">
          <img src="../Img/dogbig.PNG" alt="main-img">
          <div class="search">
              <h2>검색어를 입력하세요</h2>
              <p>자신의 이미지를 공유하고 원하는 이미지를 다운 받아보세요</p>
              <form action="SearchBoard.jsp">
                <div class="search-icon">icon</div>
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
      </div>
  </section>

	<section class="cont">
          <div class="car-box">
              <a href="Mainpage.jsp?bcategory=CUTE"><span>CUTE</span></a>
              <a href="Mainpage.jsp?bcategory=SEXY"><span>SEXY</span></a>
              <a href="Mainpage.jsp?bcategory=HANSUME"><span>HANDSOME</span></a>
          </div>
    
      </section>

  <section class="cont img-cont">
      <div class="box">

            	<%
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.GalleryList(bcategory);
				for(int i=0; i<list.size(); i++){
		%>
		<a href="../html/Posting.jsp?bId=<%=list.get(i).getbId() %>" 
                  > <!-- 클릭시 -->
                  <img class="rounded" src="../upload/<%=list.get(i).getbimage()%>" /> <!-- 작은사진 -->
                </a>
            
                  <%
			}
		%>

      </div>

  </section>
   


  <!-- Footer -->
  <footer>
    <div class="footer-cont">
      <div class="footer-logo"><img src="../Img/big-log_png.png" alt="logo"></div>
      <div class="team">
        <span><p>Team Member</p>
          <p>Cute HYUK</p>
          <p>Sexy KYU / Handsome JUNE</p>
        </span>
      </div>
      
    </div>
  </footer>
</div>
	
</body>
</html>

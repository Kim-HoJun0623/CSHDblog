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
	

	 	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		} 
		int pageNumber = 1;//기본은1페이지 전달
		//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
		//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
			
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>
    <header class="header">
        <a href="../html/Mainpage.jsp" class="logo">
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
        <span class="sign">
            <a href="../html/Sign.jsp">sign</a>
            <a href="../html/Login.jsp">login</a>
        </span>
        <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
        
    </header>
    <div class="tit">
        <h2>STORY</h2>

        <a href="../html/Write.jsp"><button> 글쓰기</button></a>
    </div>

    

    </div>

    <section class="cont">
        <ul class="part">
            <li class="box">
                <a href="../html/Post.jsp">
                <dt class="img-box"><img src="../Img/mouse-1.PNG" alt=""></dt>
                <dt class="text-box">
                <p>멧밭쥐는 한반도에서 흔한 들쥐류로 한국 전역에 서식한다.<br>
                    이들은 논이나 풀밭에서 둥지를 만들고 새끼를 5~6마리를 낳는다.</p>
                </dt>
            </a>
            </li>
            <li class="box">
                <a href="../html/Post.jsp">
                <div class="img-box"><img src="../Img/om-3.PNG" alt=""></div>
                <div class="text-box">
                <p>옴팡이는 애소 작가가 그린 카카오톡 이모티콘이며 너무너무 귀엽다<br>
                    머머리 중 최강 귀요미일듯 하다.... !!!</p>
                </div>
            </a>
        </li>
            <li class="box">
                <a href="../html/Post.jsp">
                <div class="img-box"><img src="../Img/bird-5.PNG" alt=""></div>
                <div class="text-box">
                <p>뱁새는 평균적으로 몸길이가 14cm, 꼬리길이가 8cm이며 <br>
                    그 작은 몸으로 날개짓하는게 너무 귀여워서 나 죽엉 >_<</p>
                </div>
                </a>
            </li>
            <li class="box">
                <a href="../html/Post.jsp">
                <div class="img-box"><img src="../Img/mouse-4.PNG" alt=""></div>
                <div class="text-box">
                <p>니나노오
                </p>
                </div>
                </a>
            </li>
        </ul>
    </section>
    <div class="num">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
    </div>

        <%

	 	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		
        %>

        <button> <a href="../html/Write.jsp">글쓰기</a></button>
		<%
		}
		%>
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
     
    </section>
    	<!-- 페이지 처리 영억 -->
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
		%>
		

</body>
</html>
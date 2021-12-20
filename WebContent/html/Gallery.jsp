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
    <title>Gallery</title>
    <link rel="stylesheet" href="../Css/Gallery-style.css">
    <link rel="stylesheet" href="../Css/fancybox.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../Css/jquery.fancybox.min.css">
    <script src="../js/jquery.fancybox.min.js"></script> <script src="../js/jquery.js"></script>
</head>
<body>
<%
	
		int pageNumber = 1;//기본은1페이지 전달
		//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
		//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
			
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>

    <header>
    	  <%
//메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
	%>
        <a href="Mainpage.jsp" class="logo">
            <img src="../Img/logo.jpg" alt="logo">
        </a>
        <div class="search">
            <input type="text">
            <button>검색</button>
        </div>
         <% if(userId==null){%>
        <div class="sign">
        
            <a href="Sign.jsp">sign</a>
            <a href="Login.jsp">login</a>
           
        </div>
         <%}else{ %>
        <button class="head-btn">글쓰기</button>
        <%} %>
    </header>
        <div class="cont-head">
            <h5>GALLERY</h5>
            <div>
            <span class="dropdown">
                <button class="dropdown-btn">추천</button>
                <div class="dropdown-cont">
                    <a href="#">인기</a>
                    <a href="#">최신</a>
                    <a href="#">추천</a>
                </div>
            </span>
            <span class="dropdown">
                <button class="dropdown-btn">카테고리</button>
                <div class="dropdown-cont">
                    <a href="#">CUTE</a>
                    <a href="#">SEXY</a>
                    <a href="#">HAND</a>
                    <a href="#">DEL</a>
                </div>
            </span>
            </div>
        </div>
        <!-- 갤러리 분류별 정렬 -->
    <section class="cont">
        <div class="flex flex-wrap gap-5 justify-center max-w-5xl mx-auto px-6 box">
         	<%
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.GalleryList(pageNumber);
				for(int i=0; i<list.size(); i++){
		%>
		<a
                  data-caption="Vestibulum lobortis ultricies ipsum, a maximus ligula dignissim in. Sed consectetur tellus egestas, consequat dolor at, tempus augue. "
                  data-fancybox="gallery"
                  href="../upload/<%=list.get(i).getbimage()%>" 
                  > <!-- 클릭시 -->
                  <img class="rounded" src="../upload/<%=list.get(i).getbimage()%>" /> <!-- 작은사진 -->
                </a>
            
                  <%
			}
		%>
       </div>
    </section>
    <script>
            Fancybox.bind('[data-fancybox="gallery"]', {
                Thumbs: false,
                Toolbar: false,
      
            Image: {
              zoom: false,
              click: false,
              wheel: "slide",
            },
          });
          </script>
</body>
</html>
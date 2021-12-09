<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %>
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Posting</title>
    <link rel="stylesheet" href="../Css/posting-style.css">
</head>
<body>
<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
	%>
	
	<%	
	//bId 를 초기화시키고
	//bId라는 데이터가 넘어온 것이 존재하면 캐스팅하여 변수담기
	int bId = 0;
	if(request.getParameter("bId") !=  null){
		bId=Integer.parseInt(request.getParameter("bId"));
	}
	
	//만약 넘어온 데이터 없을경우
	if(false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	
	// 유요한 글이라면 구체적인 정보를 bo라는 인스턴스에 담기
	BoardVO bo = new BoardDAO().getBoardVO(bId);
	//BoardVO bcount = new BaordDAO().getCount(bId);
	%>

    <header>
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
    <section>
        <div class="title">
            <h2><%= bo.getbTitle().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></h2>
        </div>
        <div class="sup">
            <span class="sup-block">
                <span class="sup-name">작성자 :</span>
                <span class="sup-name name"><%= bo.getuserId().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></span>
            </span>
            <span class="sup-block">
                <span class="sup-name">작성일 :  </span>
                <span class="sup-name date"><%= bo.getbDate().substring(0,11)+bo.getbDate().substring(11,13)+"시"
										+ bo.getbDate().substring(14,16)+"분" %></span>
            </span>
            <span class="sup-block">
                <span class="sup-name">조회수 : </span>
                <span class="sup-name count"><%=bo.getBcount()+1%></span>
            </span>
        </div>
        <div class="img">
           <%if(bo.getbimage()==null){ //이미지가 없음때%> 
									
				<%}else { //이미지가 있을때 %>
			      	<img src="../upload/<%=bo.getbimage() %>">
			<%} %> 	
        </div>
        <div class="word">
            <p><%=bo.getbContent().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></p>
        </div>
        	<%
						if(userId != null && userId.equals(bo.getuserId())){
						
					%> 
        <div class="fix">
           <a href="update.jsp?bId=<%= bId %>"><button>수정</button></a>
           <a  href="deleteAction.jsp?bId=<%= bId %>"><button>삭제</button></a>
        </div>
        	<%
					} 
					%> 
    </section>
    <aside>
        <div class="b-img">광고칸</div>
        <div class="abtn">
            <button>사진 다운로드</button>
        </div>
        <div class="s-img">광고칸</div>
    </aside>
</body>
</html>
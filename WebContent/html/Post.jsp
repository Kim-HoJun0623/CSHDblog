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
    <title>Post</title>
    <link rel="stylesheet" href="../Css/post-style.css">
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
	if(bId==0){
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
    </header>
    <section>
        <div class="cont">
                <h2>제목</h2>
            <div class="tit">
                <span>작성자 : </span>
                <span>작성일 : </span>
            </div>
            <div class="img">
                
            </div>
            <div class="text-box">
                <p>아 진짜 너무 할거 많앙.</p>
            </div>
            <div class="chage">
                <a href="#">삭제</a>
                <a href="#">수정</a>
            </div>
        </div>
    </section>

    
</body>
</html>

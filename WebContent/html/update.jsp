<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %>
 <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="../Css/write-style.css">
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
		if(userId == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
		script.println("alert('로그인하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
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
	if(!userId.equals(bo.getuserId())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
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
    </header>
	<!--게시판 글쓰기 양식 영역시작-->
<section class="story">
        <div>
            <h2>STORY</h2>				
				<form method="post" action="updateAction.jsp?bId=<%= bId%>" enctype="multipart/form-data">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<div class="title">
                    		<input type="text" name="bTitle" class="tit-box" maxlength="80" placeholder="제목" value=<%=bo.getbTitle() %>>
                		</div>
						 <div class="cont">
                    		<textarea name="bContent" id="cont" class="cont-box" cols="30" rows="10" placeholder="글 내용!! XD"><%=bo.getbContent() %></textarea>
               			 </div>	
               			 
					<div class="sub">
                	    <div class="cho">
                        	<input type="file" name="image">
                   	 	</div>
                    <div class="div-box">
                        <div>분류</div>
                        <select name="category" id="category">
                            <option value="CUTE">CUTE</option>
                            <option value="SEXY">SEXY</option>
                            <option value="HANSUME">HANSUME</option>
                        </select>
                    </div>
					</table>
						<!-- 수정하기 버튼 생성 -->
						<input type="submit"  value="수정하기">
				</form>
	
	        </div>
    </section>

</body>
</html>
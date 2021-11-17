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
</head>
<body>
<%-- 	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
		script.println("alert('로그인하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		}
	%> --%>
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
/* 	if(!userID.equals(bo.getLoginid())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	} */
	%>
	<!--게시판 글쓰기 양식 영역시작-->
	<div >
			<div>
									
				<form method="post" action="updateAction.jsp?bId=<%= bId%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color:#eeeeee;text-align:center;">
										게시판 글쓰기 양식
									</th>
								</tr>
							</thead>
							<tbody>
								<tr> 
									<td>
										<input type="text" placeholder="글 제목" name="bTitle" maxlength="80" value="<%=bo.getbTitle() %>" >
									</td>
								</tr>
								<tr>
									<td><textarea placeholder="글 내용" name="bContent" maxlength="2048" style="text-align:left;"><%=bo.getbContent() %>
									</textarea></td>
								</tr>
							</tbody>
					</table>
						<!-- 수정하기 버튼 생성 -->
						<input type="submit"  value="수정하기">
				</form>
			</div>
	</div>

</body>
</html>
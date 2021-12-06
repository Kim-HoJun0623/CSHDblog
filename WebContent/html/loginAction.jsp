<%@page import ="java.io.PrintWriter" %>
<%@page import ="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="login" class="user.UserVO" scope="page" />
<jsp:setProperty name="login" property="userId" />
<jsp:setProperty name="login" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){//로그인 확인
			userId = (String) session.getAttribute("userId");
		}
		if(userId != null){ //이미 로그인 했으면 다시 로그인 할 필요 없게
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 성공')");
			script.println("location.href='Mainpage.jsp'");
			script.println("</script>");
		}
		
		userId = request.getParameter("userId");
		UserDAO dao = new UserDAO();
		int result = dao.login(login.getUserId(), login.getUserPassword());
		if(result == 1){
			session.setAttribute("userId", login.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='Mainpage.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
	
	<!-- 카카오 로그인 부분 -->
</body>
</html>
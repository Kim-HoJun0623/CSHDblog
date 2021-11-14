<%@page import="user.UserDAO"%>
<%@page import="user.UserVO"%>
<%@page import ="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="join" class="user.UserVO" scope="page" />
<jsp:setProperty name="join" property="userId" />
<jsp:setProperty name="join" property="userPassword" />
<jsp:setProperty name="join" property="userName" />
<jsp:setProperty name="join" property="userGender" />
<jsp:setProperty name="join" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		
		String userId = null;
		if(session.getAttribute("userId") != null){//로그인 확인
			userId = (String) session.getAttribute("userId");
		}
		if(userId != null){//이미 로그인 했으면 회원가입 안되게
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 성공')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}
	
		UserDAO dao = new UserDAO();
		int result = dao.join(join);
		System.out.print(result);
		if(result == 1){
			session.setAttribute("userId", join.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		
		
	%>
</body>
</html>
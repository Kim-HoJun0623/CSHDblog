<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오로그인</title>
<%
	String userId = null;
	if(session.getAttribute("userId") != null){
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인 성공')");
	script.println("location.href='Mainpage.jsp'");
	script.println("</script>");
	
	} else{ //카카오 로그인
		String kakaoid = request.getParameter("kakaoemail");
		String kakaoName = request.getParameter("kakaoname");
		session.setAttribute("userId", kakaoid);
		//일반 로그인 세션 값이랑 맞춰주기 위해 userId 로 키값 설정
		session.setAttribute("kakaoName", kakaoName);
		
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('카카오 로그인 성공')");
		script.println("location.href='Mainpage.jsp'");
		script.println("</script>");
	}
	if(userId != null){ //이미 로그인 했으면 다시 로그인 할 필요 없게
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 성공')");
		script.println("location.href='Mainpage.jsp'");
		script.println("</script>");
	}
%>
</head>
<body>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="board.CommentVO" %>
 <%@ page import="board.CommentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../Css/posting-style.css"> 
</head>
<body>
<%
	int cId=0;
	int bId=0;
	String userId = null;
	if(request.getParameter("cId")!=null){
		cId=Integer.parseInt(request.getParameter("cId"));
	}
	if(request.getParameter("bId")!=null){
		bId=Integer.parseInt(request.getParameter("bId"));
	}
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	CommentVO cvo = new CommentDAO().getComment(cId);
	
%> 

<h2><%= userId %></h2><!-- 유저아이디 -->
<div class="comment-info">
	<form method="post" action="cmUpdateAction.jsp?bId=<%=bId %>&cId=<%= cId%>">
		<div class="comment-text">
                	
                    <input class="comment-input" type="text" name="cmContent" value="<%=cvo.getCmContent()%>">
                    
                    <button class="submit">등록</button>
                 
                </div>
		
	</form>
	</div>
</body>
</html>
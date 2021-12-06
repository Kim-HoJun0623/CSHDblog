<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="board.CommentVO" %>
 <%@ page import="board.CommentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int cId=0;
	int bId=1;
	if(request.getParameter("cId")!=null){
		cId=Integer.parseInt(request.getParameter("cId"));
	}
	CommentVO cvo = new CommentDAO().getComment(cId);	
%>
	<form method="post" action="cmUpdateAction.jsp?bId=<%=bId %>&cId=<%= cId%>">
		<table>
			<tbody>
				<tr>
					<td align="left">
					<%-- <%= userID %> --%>
					kk123
					</td>
				</tr>
					<td><input type="text" placeholder="댓글 쓰기" name="cmContent" maxlength="300" value="<%=cvo.getCmContent() %>">
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="댓글수정">
	</form>
</body>
</html>
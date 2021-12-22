<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.CommentDAO" %>
<%@ page import="board.CommentVO" %>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="left">댓글</td>
		</tr>
		<tr>
			<%
				int bId=1;
				CommentDAO cDAO = new CommentDAO();
				ArrayList<CommentVO> list = cDAO.getList(bId);
				for (int i = 0; i < list.size(); i++) {
			%>
			<table>
				<tbody>
					<tr>
						<td align="left">
							<%= list.get(i).getUserId() %>
						</td>
						<td align="left">
							<%= list.get(i).getcDate().substring(0,11)+list.get(i).getcDate().substring(11,13)
							+"시"+list.get(i).getcDate().substring(14,16)+ "분"	%>
						</td>
					</tr>
					<tr>
						<td align="left"><%=list.get(i).getCmContent() %></td>
						<td align="right"><a
							href="commentUpdate.jsp?bId=<%=bId %>&cId=<%=list.get(i).getcId() %>">수정</a>
							<a
							onclick="retrun confirm('정말 삭제하시겠습니까?')"
							href="cmDeleteAction.jsp?bId=<%=bId%>&cId=<%= list.get(i).getcId()%>">
							삭제</a>
						</td>
					</tr>
				</tbody>
			
			</table>
			<%
				}
			%>
		</tr>
	</table>
	<br>
	<form method="post" action="deatAction.jsp?bId=<%=bId %>">
		<table>
			<tbody>
				<tr>
					<td align="left">
					<%= userID %>
					kk123
					</td>
				</tr>
					<td><input type="text" placeholder="댓글 쓰기" name="cmContent" maxlength="300">
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="댓글쓰기">
	</form>
	
</body>
</html> --%>
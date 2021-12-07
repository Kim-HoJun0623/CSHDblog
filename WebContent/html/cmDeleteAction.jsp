<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.io.PrintWriter" %>
<%@ page import="board.CommentDAO" %>
<%@ page import="board.CommentVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int bId=1;
	int cId=0;
	if(request.getParameter("cId")!=null){
		cId=Integer.parseInt(request.getParameter("cId"));
	}
	CommentVO cvo = new CommentDAO().getComment(cId);
	/*if(!userID.equals(comment.getUserID())){
	 		PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>"); */
	//}else{
	CommentDAO cDAO = new CommentDAO();
	System.out.println(cId);
	int result=cDAO.delete(cId);
	if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 삭제에성공하셨습니다.')");
		script.println("location.href='deat.jsp'");
		script.println("</script>");
	}
	//}
%>

</body>
</html>
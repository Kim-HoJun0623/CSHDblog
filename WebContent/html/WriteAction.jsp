<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Board.BoardDAO" %>
 <jsp:useBean id="Board" class="Board.BoardVO" scope="page"/>
 <jsp:setProperty name="Board" property="bTitle"/>
 <jsp:setProperty name="Board" property="bContent"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			// ���� ���� ���¸� üũ�Ѵ�.
			/* String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			// �α����� �� ����� ���� �� �� �ֵ��� �ڵ带 �����Ѵ�.
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�α����� �ϼ���')");
				script.println("location.href='#'");
				script.println("</script>");
			}else{ */
				
				// �Է��� �� �� �κ��� �ִ��� üũ�Ѵ�
				if(Board.getbTitle() == null || Board.getbContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					// ���������� �Է��� �Ǿ��ٸ� �۾��� ������ �����Ѵ�
					BoardDAO boardDAO = new BoardDAO();
				
					int result = boardDAO.write(Board.getbTitle(), "��ȣ��", Board.getbContent());
					// �����ͺ��̽� ������ ���
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('�۾��⿡ �����߽��ϴ�')");
						script.println("history.back()");
						script.println("</script>");
					// �۾��Ⱑ ���������� ����Ǹ� �˸�â�� ���� �Խ��� �������� �̵��Ѵ�
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('�۾��� ����')");
						script.println("location.href='board.jsp'");
						script.println("</script>");
					}
				}
			/* } */
		
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>


<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

 <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%



int bId = 0;
System.out.println(request.getParameter("bId")); 
if(request.getParameter("bId") != null){
	bId = Integer.parseInt(request.getParameter("bId"));
}


			// 현재 세션 상태를 체크한다.
			MultipartRequest multi = new MultipartRequest(
					request,
					 request.getServletContext().getRealPath("upload"),
					 10000*1024*1024,
					 "utf-8",
					 new DefaultFileRenamePolicy());

			 String userId = null;
			if(session.getAttribute("userId") != null){
				userId = (String)session.getAttribute("userId");
			}
			
			 File file = multi.getFile("image");//이미지 저장

			 String filename;
			 BoardVO filebo = new BoardDAO().getBoardVO(bId);
			 if(file==null){
				filename = filebo.getbimage();
			 }else{
				 filename = multi.getFilesystemName("image");//자료들 String변수들에 저장 
			 }
			
			String bTitle = multi.getParameter("bTitle");
			String bContent = multi.getParameter("bContent");
			
			
			
			// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다.
			if(userId == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요')");
				script.println("location.href='#'");
				script.println("</script>");
			} 
				
		
			if(bId == 0){
				System.out.println(bId);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다')");
				script.println("location.href='Story.jsp'");
				script.println("</script>");
			}
			//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
			BoardVO bo = new BoardDAO().getBoardVO(bId);
			 if(!userId.equals(bo.getuserId())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다')");
				script.println("location.href='Stroy.jsp'");
				script.println("</script>");
			} else{ 
				// 입력이 안 됐거나 빈 값이 있는지 체크한다
				if(bTitle == null || bContent == null
					|| bTitle.equals("") || bContent.equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					// 정상적으로 입력이 되었다면 글 수정 로직을 수행한다
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.update(bId, bTitle, bContent, filename);
					// 데이터베이스 오류인 경우
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정하기에 실패했습니다')");
						script.println("history.back()");
						script.println("</script>");
					// 글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정하기 성공')");
						script.println("location.href='Story.jsp'");
						script.println("</script>");
					}
				}
			
			}
			 
		
	%>
</body>
</html>
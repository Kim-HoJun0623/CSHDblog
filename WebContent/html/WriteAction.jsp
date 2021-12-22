<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="java.util.Enumeration"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>

<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

 <jsp:useBean id="board" class="board.BoardVO" scope="page"/>
 <jsp:setProperty name="board" property="bTitle"/>
 <jsp:setProperty name="board" property="bContent"/>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	
	//System.out.println(request.getServletContext().getRealPath("upload"));
	
	 MultipartRequest multi = new MultipartRequest(
			 request,
			 request.getServletContext().getRealPath("upload"),
			 10000*1024*1024,
			 "utf-8",
			 new DefaultFileRenamePolicy()
			 );//업로드한 file기본 설정
	File file = multi.getFile("image");//앞에서 업로드하여 올라온파일을 file에저장
	System.out.println(file);
	
    
    String filename = multi.getFilesystemName("image");
    //System.out.println("filename:"+filename);
   
	

	// 현재 세션 상태를 체크한다.
			 String userId = null;
			if(session.getAttribute("userId") != null){
				userId = (String)session.getAttribute("userId");
			}
			// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다.
			if(userId == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요')");
				script.println("location.href='#'");
				script.println("</script>");
				
				
				
			}else{ 
				
				// 입력이 안 된 부분이 있는지 체크한다
				
				
				String bTitle = multi.getParameter("bTitle");
				String bContent = multi.getParameter("bContent");
				String category[] = multi.getParameterValues("category");
				String categorystg=null;
				
				for(String stg:category){
					categorystg=stg;
					//System.out.println(threest+""); 카테고리 값 
				}
			
			
				
				//System.out.println(bTitle);
				
				//System.out.println(board.getbTitle());
				//System.out.println(board.getbContent());
				
				if(bTitle == null || bContent == null){
					System.out.println(board.getbTitle());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
					BoardDAO BoardDAO = new BoardDAO();
				
					int result = BoardDAO.write(bTitle, userId, bContent,filename,categorystg);
					// 데이터베이스 오류인 경우
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다')");
						script.println("history.back()");
						script.println("</script>");
					// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기 성공')");
						script.println("location.href='Main.jsp'");
						script.println("</script>");
					}
				}
			 } 
	
			
	%>
		
</body>
</html>
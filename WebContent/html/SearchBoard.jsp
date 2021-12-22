<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %> 
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %>
  <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= request.getParameter("searchText") %>검색 결과</title>
    <link rel="stylesheet" href="../Css/SearchBoard.css">

</head>
<body>
        <%
		//메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			 userId = (String)session.getAttribute("userId"); 
			/* userId="김호준"; */
		}
	%>
    <header class="header">
        <a href="../html/Mainpage.jsp" class="logo">
            <img src="../Img/logo.jpg" alt="logo">
        </a>
        <div class="search">
            <form action="SearchBoard.jsp">
                <div class="search-icon"></div>
                <input class="real-search" type="text" name="searchText" placeholder="이미지, 주제 검색">
                <span class="dropdown">
                    <select name="searchField">
                        <option value="0">모든</option>
                        <option value="bTitle">제목</option>
                        <option value="userId">작성자</option>
                    </select>
                    <span class="dropdown-icon"><img src="../Img/chevron-down-solid.svg" alt=""></span>
                </span>
            </form>
        </div>
		<%if(userId==null){ %>
        <span class="sign"> 
            <a href="../html/Sign.jsp">sign</a>
            <a href="../html/Login.jsp">login</a>
        </span>
        <%}else{ %>
        <span class="sign"> 
        <a href="../html/#"><%=userId %>님</a>
        <a href="../html/logoutAction.jsp">Logout</a>
        </span>
        <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
        <%} %>
        
    </header>
    <div class="tit">
        <h2><%= request.getParameter("searchText") %>  검색 결과</h2>
    </div>
    <%
		
	int pageNumber = 1;//기본은1페이지 전달
	//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
	//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
		
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
    %>
	<tbody>
					<%
					System.out.println("f" + request.getParameter("searchField"));
					System.out.println("T" + request.getParameter("searchText"));
						BoardDAO dao = new BoardDAO();
						ArrayList<BoardVO> list = dao.getSearach(request.getParameter("searchField"),
								request.getParameter("searchText"));
						if (list.size() == 0) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('검색결과가 없습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						for(int i=0; i<list.size(); i++){
							%>
					       
					            <li class="box">
					                <a href="../html/Posting.jsp?bId=<%=list.get(i).getbId()%>">
					                <dt class="img-box"><img src="../upload/<%=list.get(i).getbimage()%>" alt="">
					                </dt>
					                <dt class="text-box">
					                <p><%= list.get(i).getbContent() %></p>
					                </dt>
					            </a>
					            </li>
					             <%
									}
					%>
				</tbody>
		

</body>
</html>
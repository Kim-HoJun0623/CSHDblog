<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %>
  <%@ page import="java.io.*" %>
  <%@ page import="board.BoardVO" %>
  <%@ page import="board.BoardDAO" %> 
 <%@ page import="board.CommentDAO" %>
<%@ page import="board.CommentVO" %>
  <%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Posting</title>
    <link rel="stylesheet" href="../Css/posting-style.css">
</head>
<body>
<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
		
		
	%>
	
	<%	
	//bId 를 초기화시키고
	//bId라는 데이터가 넘어온 것이 존재하면 캐스팅하여 변수담기
	int bId = 0;
	if(request.getParameter("bId") !=  null){
		bId=Integer.parseInt(request.getParameter("bId"));
	}
	
	//만약 넘어온 데이터 없을경우
	/* if(false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	} */
	
	// 유요한 글이라면 구체적인 정보를 bo라는 인스턴스에 담기
	BoardVO bo = new BoardDAO().getBoardVO(bId);
	String imageprint = new BoardDAO().imageprint(bId);
	//BoardVO bcount = new BaordDAO().getCount(bId);
	%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Posting</title>
        <link rel="stylesheet" href="../Css/posting-style.css">
    </head>
    <body>
        <header>
            <a href="../html/Mainpage.jsp" class="logo">
                <img src="../Img/logo.jpg" alt="logo">
            </a>
             <div class="search">
             <%-- 검색창 --%>
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
        <%if(userId==null){ //로그인 안 되어 있을때%>
        <span class="sign">
            <a href="../html/Sign.jsp">sign</a>
            <a href="../html/Login.jsp">login</a>
        </span>
        <%}else{ %>
        <span class="sign">
        <a href="../html/userPage.jsp"><%=userId %>님</a>
        <a href="../html/logoutAction.jsp">Logout</a>
        </span>
        <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
        <%} %>
    </header>

        <div class="cont">
            <section>
                <div class="img-box">
                     <%if(bo.getbimage()==null){ //이미지가 없음때%> 
									
				<%}else { //이미지가 있을때 %>
			      	<img src="../upload/<%=bo.getbimage() %>">
			<%} %> 	
                </div>
            </section>
            <aside>
                <div class="aside-box">
                    <div class="user">
                        <a href="#">
                            <div class="user-icon">
                                icon
                            </div>
                        </a>
                        <div class="user-cont">
                            <a href="#">
                                <div class="name"><%= bo.getuserId().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></div>
                            </a>
                            <div class="date"><%= bo.getbDate().substring(0,11)+bo.getbDate().substring(11,13)+"시"
										+ bo.getbDate().substring(14,16)+"분" %></div>
                        </div>
                    </div>
                    <div class="cont-box">
                        <h2><%= bo.getbTitle().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></h2>
                        <p><%=bo.getbContent().replaceAll("","&nbsp;").replaceAll("<","&lt").replaceAll(">", "&gt").replaceAll("\n","<br>") %></p>
                    </div>
                   <a href="filedown.jsp?bId=<%= bId%>">
                    <button class="down">  
                        <div class="down-icon">
                            icon
                        </div>
                        무료 다운로드
                    </button> </a>
                    <div class="free-box">
                        <p>이미지들은 무료입니다.</p>
                        <p>상업적으로 사용 가능합니다.</p>
                        <p>출저 안 밝혀도 됩니다.</p>
                    </div>
                        <table class="a-table">
                            <tbody>
                                <tr>
                                    <th>유형</th>
                                    <td><%=imageprint %></td>
                                </tr>
                                <tr>
                                    <th>카테고리</th>
                                    <td><a href="Gallery.jsp?bcategory=<%=bo.getBcategory() %>"><%=bo.getBcategory() %></a></td>
                                </tr>
                                <tr>
                                    <th>조회수</th>
                                    <td><%=bo.getBcount()+1%></td>
                                </tr>
                              <!--   <tr>
                                    <th>다운로드</th>
                                    <td>1004</td>
                                </tr> -->
                            </tbody>
                        </table>

                        <!-- 글 수정 삭제-->
                        <%if(userId.equals(bo.getuserId())){ //로그인 안 되어 있을때%>
      			   <div class="aside-btn">
                        <a href="update.jsp?bId=<%=bId %>">수정</a>
                        <a href="deleteAction.jsp?bId=<%=bId %>">삭제</a>
                    </div>
        <% }%>
        
                    

                </div>
            </aside>
            <!-- 댓글창 -->
            <% CommentDAO cDAO = new CommentDAO();
			ArrayList<CommentVO> list = cDAO.getList(bId); %>
            <div class="comment-info">
                <div class="comment-count">댓글 <span class="count"><%=list.size() %></span></div>
               	<form method="post" action="deatAction.jsp?bId=<%=bId %>">
                <div class="comment-text">
                	
                    <input class="comment-input" type="text" placeholder="댓글을 입력하세요" name="cmContent" >
                    <button class="submit">등록</button>
                 
                </div>
                   </form>
                     <%
               
				for (int i = 0; i < list.size(); i++) {
                %>
                <div class="comment">
              
                    <h2><%= list.get(i).getUserId() %></h2> <!-- 댓글작성자 -->
                    <p class="comment-cont"><%=list.get(i).getCmContent() %></p>
                    <p class="date"><%= list.get(i).getcDate().substring(0,11)+list.get(i).getcDate().substring(11,13)
							+"시"+list.get(i).getcDate().substring(14,16)+ "분"	%></p><!-- 댓글작성일 -->
                    <% if(userId.equals(list.get(i).getUserId())){%>
                    <div class="comment-btn">
                        <a href="commentUpdate.jsp?bId=<%=bId %>&cId=<%=list.get(i).getcId() %>"><button>수정</button></a>
                       <a onclick="retrun confirm('정말 삭제하시겠습니까?')" href="cmDeleteAction.jsp?bId=<%=bId%>&cId=<%= list.get(i).getcId()%>"><button>삭제</button></a>
                    </div>
                    
                   
                </div>
                 <%}
                    } %>
    
            </div>
    
        </div>


</body>

</html>


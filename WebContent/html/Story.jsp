<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ page import="java.io.PrintWriter" %>
  <%@ page import="Board.BoardVO" %>
  <%@ page import="Board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>STORY</title>
    <link rel="stylesheet" href="../Css/story-style.css">
</head>
<body>
<%-- 	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%> --%>
	
	<%	
	//bId 를 초기화시키고
	//bId라는 데이터가 넘어온 것이 존재하면 캐스팅하여 변수담기
	int bId = 0;
	if(request.getParameter("bId") !=  null){
		bId=Integer.parseInt(request.getParameter("bId"));
	}
	
	//만약 넘어온 데이터 없을경우
	if(bId==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	
	// 유요한 글이라면 구체적인 정보를 bo라는 인스턴스에 담기
	BoardVO bo = new BoardDAO().getBoardVO(bId);
	%>

    <header class="header">
        <div class="header_top">
            <a href="../html/Login.html">LOGIN</a>
            <a href="../html/Sign.html">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../html/Mainpage.html">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
        <div class="header_gnb">
            <ul>
                <li><a href="../html/Gallery.html">GALLERY</a></li>
                <li><a href="../html/Story.html">STORY</a></li>
            </ul>
        </div>
    </header>
    <div class="tit">
        <h2>STORE</h2>
        <button> <a href="../html/Write.html">글쓰기</a></button>
    </div>

    <section class="cont">
        <div class="part">
            <div class="box">
                <div class="img-box"><img src="../Img/mouse-1.PNG" alt=""></div>
                <div class="text-box">
                <p>ë©§ë°­ì¥ë íë°ëìì íí ë¤ì¥ë¥ë¡ íêµ­ ì ì­ì ììíë¤.<br>
                    ì´ë¤ì ë¼ì´ë íë°­ìì ë¥ì§ë¥¼ ë§ë¤ê³  ìë¼ë¥¼ 5~6ë§ë¦¬ë¥¼ ë³ëë¤.</p>
                </div>
            </div>
            <div class="box">
                <div class="img-box"><img src="../Img/om-3.PNG" alt=""></div>
                <div class="text-box">
                <p>ì´í¡ì´ë ì ì ìê°ê° ê·¸ë¦° ì¹´ì¹´ì¤í¡ ì´ëª¨í°ì½ì´ë©° ëë¬´ëë¬´ ê·ì½ë¤<br>
                    ë¨¸ë¨¸ë¦¬ ì¤ ìµê° ê·ìë¯¸ì¼ë¯ íë¤.... !!!</p>
                </div>
            </div>
        </div>
        <div class="part">
            <div class="box">
                <div class="img-box"><img src="../Img/bird-5.PNG" alt=""></div>
                <div class="text-box">
                <p>ë±ìë íê· ì ì¼ë¡ ëª¸ê¸¸ì´ê° 14cm, ê¼¬ë¦¬ê¸¸ì´ê° 8cmì´ë©° <br>
                    ê·¸ ìì ëª¸ì¼ë¡ ë ê°ì§íëê² ëë¬´ ê·ì¬ìì ë ì£½ì >_<</p>
                </div>
            </div>
            <div class="box">
                <div class="img-box"><img src="../Img/rock.PNG" alt=""></div>
                <div class="text-box">
                <p>ì. ìì ëª¨ ëª¨ê¸°ë¼ì ìì ì ìëª¨.ëª¨ê¸°ëì. ì. ëª¨ê¸°. ìì ì ëª¨. ëª¨ê¸°. ì ë¼ì
                    ìì. ëª¨ê¸° ë¼ì ììì..ììììììã±
                </p>
            </div>
            </div>
        </div>
    </section>
</body>
</html>
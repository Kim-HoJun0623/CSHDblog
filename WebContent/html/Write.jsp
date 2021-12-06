<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>STORY-write</title>
    <link rel="stylesheet" href="../Css/write-style.css">
</head>
<body>

    <header class="header">
        <div class="header_top">
            <a href="../html/Login.jsp">LOGIN</a>
            <a href="../html/Sign.jsp">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../html/Mainpage.jsp">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
    </header>

    <section class="story">
        <div>
            <h2>STORY</h2>
             <form action="WriteAction.jsp" method="post" enctype="multipart/form-data"  >
                <div class="title">
                    <input type="text" name="bTitle" class="tit-box" maxlength="80" placeholder="제목">
                </div>
                <div class="cont">
                    <textarea name="bContent" id="cont" class="cont-box" cols="30" rows="10" placeholder="글 내용!! XD"></textarea>
                </div>
                <div class="sub">
                    <div class="cho">
                        <input type="file" name="image">
                    </div>
                    <div class="div-box">
                        <div>분류</div>
                        <select name="three">
                            <option value="cute">CUTE</option>
                            <option value="sexy">SEXY</option>
                            <option value="hansume">HANDSOME</option>
                        </select>
                    </div>

                 <input type="submit" class="btn" value="글쓰기">

                    <button class="btn">
                        <a href="../html/Story.jsp">ìì±</a>
                    </button>

                </div>
             </form>

        </div>
    </section>
    
</body>
</html>
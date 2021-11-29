<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Posting</title>
    <link rel="stylesheet" href="../Css/posting-style.css">
</head>
<body>
    <header>
        <a href="../html/Mainpage.html" class="logo">
            <img src="../Img/logo.jpg" alt="logo">
        </a>
        <span class="menu">
            <a href="../html/Gallery.html">GALLERY</a>
            <a href="../html/Story.html">STORY</a>
        </span>
        <div class="search">
            <input type="text">
            <button>검색</button>
        </div>
        <span class="sign">
            <a href="../html/Sign.html">sign</a>
            <a href="../html/Login.html">login</a>
        </span>
        <a href="../html/Write.html"><button class="head-btn">글쓰기</button></a>
        
    </header>
    <section>
        <div class="title">
            <h2>제목</h2>
        </div>
        <div class="sup">
            <span class="sup-block">
                <span class="sup-name">작성자 : </span>
                <span class="sup-name name">@@@</span>
            </span>
            <span class="sup-block">
                <span class="sup-name">작성일 : </span>
                <span class="sup-name date">@@@</span>
            </span>
            <span class="sup-block">
                <span class="sup-name">조회수 : </span>
                <span class="sup-name count">@@@</span>
            </span>
        </div>
        <div class="img">
            <img src="../Img/bird-5.PNG" alt="img">
        </div>
        <div class="word">
            <p>어쩌구 저쩌구 쏼라쏼라 두비두밥</p>
        </div>
        <div class="fix">
            <button>수정</button>
            <button>삭제</button>
        </div>
    </section>
    <aside>
        <div class="b-img">광고칸</div>
        <div class="abtn">
            <button>사진 다운로드</button>
        </div>
        <div class="s-img">광고칸</div>
    </aside>
</body>
</html>
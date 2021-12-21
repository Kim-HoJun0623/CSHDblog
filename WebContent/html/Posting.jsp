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
            <a href="../html/Main.jsp" class="logo">
                <img src="../Img/logo.jpg" alt="logo">
            </a>
            <div class="search">
            <form action="get">
                <div class="search-icon">icon</div>
                <input class="real-search" type="text" placeholder="이미지, 주제 검색">
                <span class="dropdown">
                    <button class="dropdown-btn">
                        <div class="dropdown-p">카테고리</div>
                        <span class="dropdown-icon">ico</span>
                    </button>
                    <div class="dropdown-cont">
                        <a href="#">CUTE</a>
                        <a href="#">SEXY</a>
                        <a href="#">HAND</a>
                        <a href="#">DEL</a>
                    </div>
                </span>
            </form>
        </div>
            <span class="sign">
                <a href="../html/Sign.jsp">sign</a>
                <a href="../html/Login.jsp">login</a>
            </span>
            <a href="../html/Write.jsp"><button class="head-btn">글쓰기</button></a>
            
        </header>
        <div class="cont">
            <section>
                <div class="img-box">
                    <img src="../Img/bird-3.PNG" alt="img">
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
                                <div class="name">lim0202jh</div>
                            </a>
                            <div class="date">2021.12.21</div>
                        </div>
                    </div>
                    <div class="cont-box">
                        <h2>제목</h2>
                        <p>내용들 입니다</p>
                    </div>
                    <button class="down">
                        <div class="down-icon">
                            icon
                        </div>
                        무료 다운로드
                    </button>
                    <div class="free-box">
                        <p>이미지들은 무료입니다.</p>
                        <p>상업적으로 사용 가능합니다.</p>
                        <p>출저 안 밝혀도 됩니다.</p>
                    </div>
                        <table class="a-table">
                            <tbody>
                                <tr>
                                    <th>유형</th>
                                    <td>jpg</td>
                                </tr>
                                <tr>
                                    <th>카테고리</th>
                                    <td><a href="#">cute</a></td>
                                </tr>
                                <tr>
                                    <th>조회수</th>
                                    <td>1004</td>
                                </tr>
                                <tr>
                                    <th>다운로드</th>
                                    <td>1004</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </aside>
            <div class="comment-info">
                <div class="comment-count">댓글 <span class="count">0</span></div>
                <div class="comment-text">
                    <input class="comment-input" type="text" placeholder="댓글을 입력하세요">
                    <button class="submit">등록</button>
                </div>
                <div class="comment">
                    <h2>작성자 lim0202jh</h2>
                    <p class="comment-cont">내용 나는 몰라요 이게 맞는지 몰라요</p>
                    <p class="date">작성일 2021.12.22</p>
                    <div class="comment-btn">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                    
                </div>
    
            </div>
    
        </div>
    </body>
    </html>
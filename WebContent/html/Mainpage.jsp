<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Main Page Layout</title>
<link rel="stylesheet" href="../Css/reset.css">
<link rel="stylesheet" href="../Css/font.css">
<link rel="stylesheet" href="../Css/main-style.css">
<link rel="stylesheet" href="../Css/jd-slider.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css"
          integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css"
          integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
<script src="../js/jquery.js"></script> 
<script src="../js/jquery.jdSlider-latest.min.js"></script> 

<!-- Fancy Box -->
<link rel="stylesheet" type="text/css" href="../Css/jquery.fancybox.min.css">
<script type="text/javascript" src="../js/jquery.fancybox.min.js"></script>
</head>

<body>
<%
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId"); 
				//로그인 세션 확인 되어있으면 값이 들어가고 아니면 null
	}
%>
<%
	if(userId == null){
		//로그인 안되어 있을 때
	
%>
<div id="wrap">
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
    <div class="header_gnb">
        <ul>
            <li><a href="../html/Gallery.jsp">GALLERY</a></li>
            <li><a href="../html/Story.jsp">STORY</a></li>
        </ul>
    </div>
</header>
  <div class="content main"> 
    
    <section class="jd-slider main-slider main-visual">
      <div class="slide-inner">
          <ul class="slide-area">
              <li>
                  <a href="#"><img src="../Img/om-big1.PNG" alt="image01"></a>
              </li>
              <li>
                <a href="#"><img src="../Img/dogbig.PNG" alt="image02"></a>
              </li>
              <li>
                <a href="#"><img src="../IMG/catbig.PNG" alt="image03"></a>
              </li>
          </ul>
          <a class="prev" href="#">
              <i class="fas fa-angle-left fa-2x"></i>
          </a>
          <a class="next" href="#">
              <i class="fas fa-angle-right fa-2x"></i>
          </a>
      </div>
      <div class="controller">
          <a class="auto" href="#">
              <i class="fas fa-play fa-xs"></i>
              <i class="fas fa-pause fa-xs"></i>
          </a>
          <div class="indicate-area"></div>
      </div>
  </section>

  <!-- best tap -->
    <section class="sec-cont">
      <div class="best-tap">
        <div class="best-tit">
          <a href="../html/Gallery.jsp">
            <h3 class="tit">BEST GALLERY</h3>
          </a>
        </div>
        <ul>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
        </ul>
      </div>
    </section>


  <!-- story tap -->
	<section class="story-tap">
    <div class="story-tit">
      <a href="../html/Story.jsp">
      <h3 class="tit">STORY</h3>
    </div>
    
  </a>
    <ul>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/mouse-1.PNG" alt=""></div>
          <p>ë©§ë°­ì¥ë íë°ëìì íí ë¤ì¥ë¥ë¡ íêµ­ ì ì­ì ììíë¤.<br>
            ì´ë¤ì ë¼ì´ë íë°­ìì ë¥ì§ë¥¼ ë§ë¤ê³  ìë¼ë¥¼ 5~6ë§ë¦¬ë¥¼ ë³ëë¤.</p>
        </div> 
      </li>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/om-3.PNG" alt=""></div>
          <p>ì´í¡ì´ë ì ì ìê°ê° ê·¸ë¦° ì¹´ì¹´ì¤í¡ ì´ëª¨í°ì½ì´ë©° ëë¬´ëë¬´ ê·ì½ë¤<br>
          ë¨¸ë¨¸ë¦¬ ì¤ ìµê° ê·ìë¯¸ì¼ë¯ íë¤.... !!!</p>
        </div>
      </li>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/bird-5.PNG" alt=""></div>
          <p>ë±ìë íê· ì ì¼ë¡ ëª¸ê¸¸ì´ê° 14cm, ê¼¬ë¦¬ê¸¸ì´ê° 8cmì´ë©° <br>
          ê·¸ ìì ëª¸ì¼ë¡ ë ê°ì§íëê² ëë¬´ ê·ì¬ìì ë ì£½ì >_<</p>
        </div>
      </li>
    </ul>
  </section>

</div>


  <!-- Footer -->
  <footer>
    <div class="footer-cont">
      <div class="footer-logo"><h2>C.S.H.D</h2></div>
      <div class="team">
        <span><p>Team Member</p>
          <p>Cute HYUK</p>
          <p>Sexy KYU / Handsome JUNE</p>
        </span>
      </div>
      
    </div>
  </footer>
</div>
<%
	} else{
		//로그인 되어있을 때
	
%>
	<div id="wrap">
  <header class="header">
    <div class="header_top">
        <a href="../html/logoutAction.jsp">LOGOUT</a>
    </div>
    <div class="header_logo">
        <a href="../html/Mainpage.jsp">
            <h1>CSHD</h1>
            <p>blog</p>
        </a>
    </div>
    <div class="header_gnb">
        <ul>
            <li><a href="../html/Gallery.jsp">GALLERY</a></li>
            <li><a href="../html/Story.jsp">STORY</a></li>
        </ul>
    </div>
</header>
  <div class="content main"> 
    
    <section class="jd-slider main-slider main-visual">
      <div class="slide-inner">
          <ul class="slide-area">
              <li>
                  <a href="#"><img src="../Img/om-big1.PNG" alt="image01"></a>
              </li>
              <li>
                <a href="#"><img src="../Img/dogbig.PNG" alt="image02"></a>
              </li>
              <li>
                <a href="#"><img src="../IMG/catbig.PNG" alt="image03"></a>
              </li>
          </ul>
          <a class="prev" href="#">
              <i class="fas fa-angle-left fa-2x"></i>
          </a>
          <a class="next" href="#">
              <i class="fas fa-angle-right fa-2x"></i>
          </a>
      </div>
      <div class="controller">
          <a class="auto" href="#">
              <i class="fas fa-play fa-xs"></i>
              <i class="fas fa-pause fa-xs"></i>
          </a>
          <div class="indicate-area"></div>
      </div>
  </section>

  <!-- best tap -->
    <section class="sec-cont">
      <div class="best-tap">
        <div class="best-tit">
          <a href="../html/Gallery.jsp">
            <h3 class="tit">BEST GALLERY</h3>
          </a>
        </div>
        <ul>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
        </ul>
      </div>
    </section>


  <!-- story tap -->
	<section class="story-tap">
    <div class="story-tit">
      <a href="../html/Story.jsp">
      <h3 class="tit">STORY</h3>
    </div>
    
  </a>
    <ul>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/mouse-1.PNG" alt=""></div>
          <p>ë©§ë°­ì¥ë íë°ëìì íí ë¤ì¥ë¥ë¡ íêµ­ ì ì­ì ììíë¤.<br>
            ì´ë¤ì ë¼ì´ë íë°­ìì ë¥ì§ë¥¼ ë§ë¤ê³  ìë¼ë¥¼ 5~6ë§ë¦¬ë¥¼ ë³ëë¤.</p>
        </div> 
      </li>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/om-3.PNG" alt=""></div>
          <p>ì´í¡ì´ë ì ì ìê°ê° ê·¸ë¦° ì¹´ì¹´ì¤í¡ ì´ëª¨í°ì½ì´ë©° ëë¬´ëë¬´ ê·ì½ë¤<br>
          ë¨¸ë¨¸ë¦¬ ì¤ ìµê° ê·ìë¯¸ì¼ë¯ íë¤.... !!!</p>
        </div>
      </li>
      <li>
        <div class="story-box">
          <div class="story-img"><img src="../Img/bird-5.PNG" alt=""></div>
          <p>ë±ìë íê· ì ì¼ë¡ ëª¸ê¸¸ì´ê° 14cm, ê¼¬ë¦¬ê¸¸ì´ê° 8cmì´ë©° <br>
          ê·¸ ìì ëª¸ì¼ë¡ ë ê°ì§íëê² ëë¬´ ê·ì¬ìì ë ì£½ì >_<</p>
        </div>
      </li>
    </ul>
  </section>

</div>


  <!-- Footer -->
  <footer>
    <div class="footer-cont">
      <div class="footer-logo"><h2>C.S.H.D</h2></div>
      <div class="team">
        <span><p>Team Member</p>
          <p>Cute HYUK</p>
          <p>Sexy KYU / Handsome JUNE</p>
        </span>
      </div>
      
    </div>
  </footer>
</div>
<%
	}
%>
<!-- Slider Script -->
<script>
        window.onload = function () {
          $('.main-slider').jdSlider({
                wrap: '.slide-inner',
                isAuto: true,
                isLoop: true
            });
            $('.slider').jdSlider({
                wrap: '.slide-inner',
                slideShow: 4,
                slideToScroll: 1,
                isLoop: true,
                responsive: [{
                    viewSize: 768,
                    settings: {
                        slideShow: 1
                    }
                }]
            });
        };
    </script>
</body>
</html>

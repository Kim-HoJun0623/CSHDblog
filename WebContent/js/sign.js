
/* 변수 선언 */

var id = document.querySelector('#id');

var pw = document.querySelector('#password');
var pwMsg = document.querySelector('#alerTxt');
var pwImg = document.querySelector('#pswd_img');
var check = document.querySelector('#check');
var checkImg = document.querySelector('#check_img');
var pwMsgArea = document.querySelector('.password');

var userName = document.querySelector('#name');

var email = document.querySelector('#email');

var error = document.querySelectorAll('.error_next_box');



/* 이벤트 핸들러 연결 */ 
id.addEventListener("focusout", checkId);
pw.addEventListener("focusout", checkPw);
check.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
email.addEventListener("focusout", isEmailCorrect);




function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === ""){
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)){
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_), (-)만 사용가능합니다.";
        error[0].style.display = "block";
    } else{
        error[0].innerHTML = "멋진 아이디네요"
        error[0].style.color = "#08A600";
        error[0].style.display = "block";
    }
}

function checkPw(){
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw.value === ""){
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw.value)){
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        error[1].style.display = "block";

        pwMsg.style.display = "block";
        pwImg.src = "../Img/compass-solid.svg";
    } else{
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg.src = "../Img/unlock-solid.svg";
    }
}

function comparePw(){
    if(check.value === pw.value && check.value != "") {
        checkImg.src = "../Img/lock-open-solid.svg";
        error[2].style.display = "none";
    } else if(check.value !== pw.value) {
        checkImg.src = "../Img/compass-solid.svg";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    }

    if(check.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}

function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[6].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[6].style.display = "block";
    } else {
        error[6].style.display = "none"; 
    }

}


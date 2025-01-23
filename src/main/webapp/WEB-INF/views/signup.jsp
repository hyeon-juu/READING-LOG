<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<style>
body {
	background: #283618;
}
#signInTitle {
	font-family: "Platypi", serif;
	font-weight: bold;
}
.container {
	margin-top: 5em;
	text-align: center;
	position: relative;
}
input {
	font-size: 17px;
	border-radius: 10px;
	margin: 3px;
	border: 2px solid #fefae0;
}
.idpw input, #name, #phone, #signin, #email {
	width: 400px;
	height: 40px;
}
.idpw, .other {
	font-size: 15px;
}
#birth {
	width: 294px;
	height: 40px;
}

#signin {
	background-color: #606c38;
	color: #fefae0;
	font-size: 20px;
	border-radius: 10px;
	margin: 5px;
	border: 2px solid #fefae0;
	height: 50px;
}
.form_radio_btn {
	width: 50px;
	height: 40px;
	display: inline-block;
	margin: -2px;
}
.form_radio_btn input[type=radio] {
	display: none;
}
.form_radio_btn label {
	display: block;
	width: 45px;
	margin: 0 auto;
	text-align: center;
	line-height: 40px;
	font-size: 15px;
	border-radius: 10px;
}
/* Checked */
.form_radio_btn input[type=radio]:checked+label {
	background: #606c38;
	color: white;
	border: 2px solid #fefae0;
}
/* Hover */
.form_radio_btn label:hover {
	color: #666;
}
/* Disabled */
.form_radio_btn input[type=radio]+label {
	background: white;
	color: #666;
}
</style>
<script src="/jquery-3.7.1.min.js"></script>

<body th:classappend="${error} ? 'has-error' : ''">
    <form id="newMember" action="/" method="post" th:action="@{/}">
        <div class="container">
            <div class="idpw">
                <h1 style="color: #fefae0" id="signInTitle">READING LOG</h1>
                <br>
                <input type="text" id="id" name="memId" placeholder="아이디" th:value="${memId}" required>
                <br>
                <input type="password" id="pw" name="memPw" placeholder="비밀번호" th:value="${memPw}" required>
                <br>
                <div id="checkIdPw" th:text="${error}" style="color: #fefae0"></div>
                <br>
            </div>
            <div class="other">
                <input type="text" id="name" name="memName" placeholder="이름" th:value="${memName}" required>
                <br>
                <input type="text" id="birth" name="memBirth" placeholder="생년월일 8자리" th:value="${memBirth}" required>
                <div class="form_radio_btn radio_male">
                    <input id="radio-1" type="radio" name="memGender" value="남" th:checked="${memGender == '남' or memGender == null}">
                    <label for="radio-1">남성</label>
                </div>
                <div class="form_radio_btn">
                    <input id="radio-2" type="radio" name="memGender" value="여" th:checked="${memGender == '여'}">
                    <label for="radio-2">여성</label>
                </div>
                <br>
                <input type="text" id="email" name="memEmail" placeholder="이메일주소" th:value="${memEmail}" required>
                <br>
                <input type="text" id="phone" name="memPhone" placeholder="휴대전화번호" th:value="${memPhone}" required>
                <br>
                <div id="checkOther" style="color: #fefae0"></div>
                <br> <br> <br>
            </div>
            <button type="submit" id="signin">회원가입</button>
        </div>
    </form>
    <script>
        let id = document.getElementById("id");
        let pw = document.getElementById("pw");
        let name = document.getElementById("name");
        let birth = document.getElementById("birth");
        let email = document.getElementById("email");
        let phone = document.getElementById("phone");

        const regId = /^[0-9a-z]{4,20}$/;
        const regPw = /^[0-9a-zA-Z!@#\$%]{4,16}$/;
        const regName = /^[a-zA-Z가-힣]{2,10}$/;
        const regBirth = /^[1|2]{1}[8|9|0]{1}\d{2}[0|1]{1}\d{1}[0-3]{1}\d{1}$/;
        const regPhone = /^010\d{7,8}$/;
        const regEmail = /^[0-9A-Za-z]{1,}@[0-9A-Za-z]{1,8}(.com|.net|.ac.kr)$/;

        id.onblur = function(e) {
            if (!regId.test(id.value)) {
                document.getElementById("checkIdPw").innerHTML = "아이디는 4~20자의 영문 소문자, 숫자만 사용 가능합니다.";
                id.focus();
            }
        }
        id.onchange = function(e) {
            if (regId.test(id.value)) {
                document.getElementById("checkIdPw").innerHTML = "";
            }
        }
        pw.onblur = function(e) {
            if (!regPw.test(pw.value)) {
                document.getElementById("checkIdPw").innerHTML = "비밀번호는 4~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.";
                pw.focus();
            }
        }
        pw.onchange = function(e) {
            if (regPw.test(pw.value)) {
                document.getElementById("checkIdPw").innerHTML = "";
            }
        }
        name.onblur = function(e) {
            if (!regName.test(name.value)) {
                document.getElementById("checkOther").innerHTML = "이름은 2~10자의 한글, 영문만 사용 가능합니다.";
                name.focus();
            }
        }
        name.onchange = function(e) {
            if (regName.test(name.value)) {
                document.getElementById("checkOther").innerHTML = "";
            }
        }
        birth.onblur = function(e) {
            if (!regBirth.test(birth.value)) {
                document.getElementById("checkOther").innerHTML = "생년월일 8자리를 입력하세요.";
                birth.focus();
            }
        }
        birth.onchange = function(e) {
            if (regBirth.test(birth.value)) {
                document.getElementById("checkOther").innerHTML = "";
            }
        }
        email.onblur = function(e) {
            if (!regEmail.test(email.value)) {
                document.getElementById("checkOther").innerHTML = "이메일 주소가 정확한지 확인해 주세요.";
                email.focus();
            }
        }
        email.onchange = function(e) {
            if (regEmail.test(email.value)) {
                document.getElementById("checkOther").innerHTML = "";
            }
        }
        phone.onblur = function(e) {
            if (!regPhone.test(phone.value)) {
                document.getElementById("checkOther").innerHTML = "휴대폰번호를 다시 확인해주세요.";
                phone.focus();
            }
        }
        phone.onchange = function(e) {
            if (regPhone.test(phone.value)) {
                document.getElementById("checkOther").innerHTML = "";
            }
        }

        const newMember = document.querySelector("#newMember");
        newMember.addEventListener('submit', function(e) {
            if (!regId.test(document.getElementById("id").value) ||
                !regPw.test(document.getElementById("pw").value) ||
                !regName.test(document.getElementById("name").value) ||
                !regBirth.test(document.getElementById("birth").value) ||
                !regPhone.test(document.getElementById("phone").value) ||
                !regEmail.test(document.getElementById("email").value)) {
                e.preventDefault();
                return;
            }
        });

        window.onload = function() {
            const errorMessage = document.querySelector("#checkIdPw").textContent;
            if (errorMessage) {
                document.getElementById("checkIdPw").innerHTML = errorMessage;
                id.value = '';
                id.focus();
            }
        }
    </script>
</body>
</html>
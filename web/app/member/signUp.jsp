<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 여기는 처음 회원가입을 클릭하면 보여주는 창-->
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 회원가입</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/mainPage/event.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/member/sign.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
</head>
<body>
<!-- header시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header끝 -->
<!-- 회원가입 시작 -->
<div class="signup_container">
    <div class="signup_wrapper">
        <div class="signup_contnent">
            <img class="welcomeHands" src="/img/member/hands.png" alt="welcome hand">
            <p class="welcomeTitle">반갑습니다!</p>
            <p class="welcomeSubTitle">여행의 모든 것, 마이리얼트립</p>
            <div class="kakaoOauthBtn_wrapper">
                <button type="button" class="kakao_button">
                    <div class="button_container" onclick="kakaoLogin()">
                        <img class="kakao_img" src="/img/member/kakao_log.svg" alt="kakao">
                        <span>카카오로 바로 시작</span>
                    </div>
                </button>
            </div>
            <div class="oauthList_container">
                <div class="oauth_container">
                    <div class="icon-wrapper" id="gSignUpBtn">
                        <img class="iconImg" src="<c:url value="/img/member/google_log.png"/>" alt="구글">
                        <img class="iconImgHover" src="<c:url value="/img/member/google_log_on.svg"/>" alt="구글">
                        <input type="hidden" value="구글">
                        <span>구글</span>
                    </div>
                    <span class="oauthList_line"></span>
                    <div class="icon-wrapper" >
                        <img class="iconImg" src="<c:url value="/img/member/naver_log.svg"/>" alt="네이버">
                        <img class="iconImgHover" src="<c:url value="/img/member/naver_log_on.svg"/>" alt="네이버">
                        <input type="hidden" value="네이버">
                        <span>네이버</span>
                    </div>
                    <span class="oauthList_line"></span>
                    <div class="icon-wrapper" >
                        <img class="iconImg" src="<c:url value="/img/member/email_log.svg"/>" alt="이메일">
                        <img class="iconImgHover" src="<c:url value="/img/member/email_log_on.svg"/>" alt="이메일">
                        <input type="hidden" value="이메일 회원가입">
                        <span>이메일</span>
                    </div>
                </div>
            </div>
            <div class="sign_in_move_container">
                <span>이미 아이디가 있으신가요?</span>
                <!-- 로그인 요청 정보 -->
                <a class="sign_in_move" href="${cp}/member/signIn.us">로그인</a>
            </div>
        </div>
    </div>
</div>
<!-- 회원가입 끝 -->
<!-- footer 시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../global/footer.jsp" %>
    </footer>
</div>
<!-- footer 끝 -->
</body>
<!-- 카카오 SDK 추가 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 SDK 추가 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<!-- 구글 SDK 추가 -->
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
    let googleUser = {};
    function startApp() {
        gapi.load('auth2', function(){
            // Retrieve the singleton for the GoogleAuth library and set up the client.
            auth2 = gapi.auth2.init({
                client_id: '18601984993-624t084a7sc52aomfm1kfso276hbimg0.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin'
                // Request scopes in addition to 'profile' and 'email'
                //scope: 'additional_scope'
            });
            auth2.attachClickHandler(document.getElementById('gSignUpBtn'), {},
                function(googleUser) {
                    googleUser.getBasicProfile().getName();
                }, function(error) {
                    alert(JSON.stringify(error, undefined, 2));
                });
        });
    };
    startApp();
</script>

<script src="../../js/chatbot.js"></script>
<script src="../../js/designForInput.js"></script>
<script src="../../js/loginEffect.js"></script>
<script src="../../js/myInfo.js"></script>
<script src="../../js/search.js"></script>
</html>
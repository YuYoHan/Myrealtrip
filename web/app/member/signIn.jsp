<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 로그인</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../app/img/favicon.ico">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/pointContainer.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/user/sign.css">
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
            <img class="welcomeHands" src="${cp}/img/hands.png" alt="welcome hand">
            <p class="welcomeTitle">반갑습니다!</p>
            <p class="welcomeSubTitle">여행의 모든 것, 마이리얼트립</p>
            <div class="kakaoOauthBtn_wrapper">
                <button type="button" class="kakao_button">
                    <div class="button_container" onclick="kakaoLogin();">
                        <img class="kakao_img" src="<c:url value="/img/kakao_log.svg"/>" alt="kakao">
                        <span>카카오로 계속하기</span>
                    </div>
                </button>
            </div>
            <div class="oauthList_container">
                <div class="oauth_container">
                    <div class="icon-wrapper">
                        <img class="iconImg" src="<c:url value="/img/facebook_log.svg"/>" alt="페이스북">
                        <img class="iconImgHover" src="<c:url value="/img/facebook_log_on.svg"/>" alt="페이스북">
                        <input type="hidden" value="페이스북">
                        <span>페이스북</span>
                    </div>
                    <span class="oauthList_line"></span>
                    <div class="icon-wrapper">
                        <img class="iconImg" src="<c:url value="/img/naver_log.svg"/>" alt="네이버">
                        <img class="iconImgHover" src="<c:url value="/img/naver_log_on.svg"/>" alt="네이버">
                        <input type="hidden" value="네이버">
                        <span>네이버</span>
                    </div>
                    <span class="oauthList_line"></span>
                    <div class="icon-wrapper">
                        <img class="iconImg" src="<c:url value="/img/email_log.svg"/>" alt="이메일">
                        <img class="iconImgHover" src="<c:url value="/img/email_log_on.svg"/>" alt="이메일">
                        <input type="hidden" value="이메일 로그인">
                        <span>이메일</span>
                    </div>
                </div>
            </div>
            <div class="sign_in_move_container">
                <span>아직 회원이 아니신가요?</span>
                <!-- 로그인 요청 정보 -->
                <a class="sign_in_move" href="${cp}/member/signUp.us">회원가입</a>
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
<!-- 카카오 SDK 추-->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 SDK 추가 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<!-- 페이스북 SDK 추가 -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
<script src="../../js/chatbot.js"></script>
<script src="../../js/designForInput.js"></script>
<script src="../../js/loginEffect.js"></script>
<script src="../../js/myInfo.js"></script>
<script>
    // Kakao.init('edfb9bf86c6edc300b3431b379972fda'); //발급받은 키 중 javascript키를 사용해준다.
    // function kakaoLogin() {
    //     Kakao.Auth.login({
    //         success: function (response) {
    //             Kakao.API.request({
    //                 url: '/v2/user/me',
    //                 success: function (response) {
    //                     location.href = "http://localhost:8080/myrealtrip/index.jsp?loginUser=" + response.kakao_account.email + "&username=" + response.properties.nickname;
    //                 },
    //                 fail: function (error) {
    //                     console.log(error)
    //                 },
    //             })
    //         },
    //         fail: function (error) {
    //             console.log(error)
    //         },
    //     })
    // }

    // <!-- 네이버 로그인-->
    // let naverLogin = new naver.LoginWithNaverId({
    //     clientId: "N3BcmuWcCOcY7s8q0KUa",
    //     callbackUrl: "http://localhost:8080/myrealtrip/index.jsp",
    //     isPopup: false, // 팝업 형태로 띄울 것인지 설정
    //     loginButton: {color: "green", type: 3, height: 60} // 로그인 버튼의 스타일 설정
    // });
    // naverLogin.init();
    //
    // function naverLogin() {
    //     naverLogin.getLoginStatus(function (status) {
    //         if (status) {
    //             let email = naverLogin.user.getEmail();
    //             let name = naverLogin.user.getName();
    //             // 로그인 성공 시 필요한 동작 수행
    //             location.href = "http://localhost:8080/myrealtrip/index.jsp?loginUser=" + email + "&username=" + name;
    //         } else {
    //             console.log("로그인 실패");
    //         }
    //     });
    // }
</script>
</html>
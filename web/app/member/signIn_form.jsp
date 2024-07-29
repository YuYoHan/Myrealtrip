<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 로그인</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/mainPage/event.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/member/signIn.css">
</head>
<body>
<!-- header시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header끝 -->
<!-- main 시작 -->
<form role="form" action="${cp}/member/signInOk.us" accept-charset="UTF-8" method="post">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" value="7NWPaKhilXR39qqX15XjYlJEMRGUBOQTtRfbAJ4J50hfJRUeeLmESCWddXB6Oir5KxUtvEMwhawGFPLfFIynIw==">
    <div class="EmailSignIn_component">
        <div class="EmailSignIn_container">
            <div class="SignInForm_container">
                <div class="SignInForm_row">
                    <label class="EmailText_label" for="userEmail">
                        <p>이메일 *</p>
                        <div class>
                            <input type="email" class="EmailText_input EmailText_medium" id="userEmail" name="userEmail" placeholder="ID@example.com" onfocus = "this.placeholder=''" onblur = "this.placeholder='ID@example.com'" value>
                        </div>
                        <span class="emailCheck hidden"></span>
                    </label>
                </div>
                <div class="SignInForm_row">
                    <label class="EmailText_label" for="userEmail">
                        <p>비밀번호 *</p>
                        <div class>
                            <input type="password" class="EmailText_input EmailText_medium" id="userPassword" name="userPassword" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" onfocus = "this.placeholder=''" onblur = "this.placeholder='영문, 숫자, 특수문자 2가지 조합 6~15자'">
                        </div>
                        <span class="pwCheck hidden"></span>
                    </label>
                </div>
                <div class="SignInForm_row">
                    <div class="UserKeepSession_container">
                        <label class="Checkbox_label Checkbox_medium" for="keep_session">
                            <input type="checkbox" id="keep_session" class="Checkbox_input Checkbox_medium" name="keep_session" value="true">
                            로그인 상태 유지
                        </label>
                        <a href="${cp}/member/pwSearch.us" class="UserPasswordSession_link">비밀번호 찾기</a>
                    </div>
                </div>
                <div class="SignInForm_row">
                    <button type="submit" class="Button_button Button_primary Button_large Button_block undefind" name ="buttons">이메일 로그인</button>
                </div>
            </div>
            <div class="SignInJoinLink_container">
                <span class="SignJoinLink_description">아직 회원이 아니신가요?</span>
                <a href="${cp}/member/signUp.us" class="SignInJoinLink_link">회원가입</a>
            </div>
        </div>
    </div>
</form>
<!-- main 끝 -->
<!-- footer 시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../global/footer.jsp" %>
    </footer>
</div>
<!-- footer 끝 -->
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src = "../../js/user.js"></script>
<script src ="../../js/sign_in_form.js"></script>
<script src="../../js/search.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/member/changePw.css">
</head>
<body>
<!-- header jsp 가져옴-->
<%@ include file="../global/header.jsp" %>

<!-- main 시작-->
<div class="container">
    <div class="content">
        <h1 class="pwChange-title">변경하실 비밀번호를 작성해주세요.</h1>
        <form role="form" action="${cp}/member/changePwOk.us" accept-charset="UTF-8" method="post">
            <div class="EmailSignUpInfo_row">
                <label class="EmailTextField_label" for="userPassword">
                    <p>비밀번호</p>
                    <div class>
                        <input type="password" class="EmailTextField_input EmailTextfiled_medium gr" id="userPassword" name="userPassword" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" onfocus = "this.placeholder=''" onblur = "this.placeholder='영문, 숫자, 특수문자 2가지 조합 6~15자'">
                    </div>
                    <span class="pwCheck hidden"></span>
                </label>
            </div>
            <div class ="EmailSignUpInfo_row">
                <label class="EmailTextField_label" for="userPasswordConfirm">
                    <p>비밀번호 확인</p>
                    <div class>
                        <input type="password" class="EmailTextField_input EmailTextfiled_medium gr" id="userPasswordConfirm" name="user[password_confirmation]" placeholder="비밀번호를 한번 더 입력해주세요." onfocus = "this.placeholder=''" onblur = "this.placeholder='비밀번호를 한번 더 입력해주세요.'">
                    </div>
                    <span class="pwChecked hidden"></span>
                </label>
            </div>
            <button class="changePw-btn" type="submit" disabled="disabled">변경하기</button>
        </form>
    </div>
</div>
<!-- footer 시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../global/footer.jsp" %>
    </footer>
</div>
<!-- footer 끝 -->
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="../../js/changePw.js"></script>
</html>
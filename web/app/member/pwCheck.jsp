<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/member/pwCheck.css">
</head>
<body>
<!-- header시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header끝 -->
<!-- main 시작 -->
<main class="member">
    <div class="container-fluid content-wrap with-panel-title">
        <div class="panel-title-wrapper">
            <div class="member-title">비밀번호 찾기</div>
        </div>
        <div class="member-panel">
            <div class="panel-body">
                <div class="member-title verify">
                    마이리얼트립 가입 시 사용한 이메일 주소를 입력해주시면 비밀번호를 재설정 할 수 있는 페이지로 이동시켜드립니다.
                </div>
                <form role="form" action="${cp}/pwSearchOk.us" class="fv-form fv-form-bootstrap">
                    <button type="submit" class="fv-hidden-submit"
                            style="display: none; width: 0; height: 0;"></button>
                    <div class="form-wrapper">
                        <div class="content-wrapper">
                            <div class="form-group">
                                <div class="content-title-box">
                                    <div class="sub-title">이메일</div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <input class="form-control" id="userEmail" name="userEmail"
                                               placeholder="example@mail.com" type="email">
                                        <span class="emailCheck hidden"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-wrap">
                            <button class="btn-new btn--type-primary btn--width-100" type="submit">비밀번호 재설정 하러가기
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

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
<script src="../../js/pwCheck.js"></script>
</html>
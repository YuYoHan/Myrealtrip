<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.mainPage.MainDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이리얼트립 :: 나다운 진짜 여행 </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/mainPage/event.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/mainPage/aboutTravel.css">
    <link rel="stylesheet" href="../../css/mainPage/mainInfo.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/mainPage/custom.css"> <!-- 새로운 CSS 파일 추가 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
<c:if test="${param.datefilter != null}">
    <script>
        alert("예약이 완료되었습니다.");
    </script>
</c:if>
<!-- header 시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header 끝 -->
<!-- main 시작 -->
<main>
    <!-- 첫 번째 travelCard 섹션 -->
    <section class="mainHeader">
        <div class="mainHeader_container">
            <div class="headlineWrapper"></div>
        </div>
        <%@ include file="../mainPage/mainHeader.jsp" %>
    </section>

    <section class="mainBanner">
        <%@ include file="../mainPage/mainBanner.jsp" %>
    </section>


    <section class="mainProduct">
        <%@ include file="rePlace.jsp" %>
    </section>

    <div class="pointContainer">
        <%@ include file="../mainPage/event.jsp" %>
    </div>
    <section class="mainInfo">
        <%@ include file="../mainPage/mainInfo.jsp" %>
    </section>
</main>

<!-- main 끝 -->
<!-- footer 시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <jsp:include page="../global/footer.jsp"/>
    </footer>
</div>
<!-- footer 끝 -->
<script src="../../js/swiper_container.js"></script>
<script src="../../js/chatbot.js"></script>
<script src="../../js/designForInput.js"></script>
<script src="../../js/myInfo.js"></script>
</body>
</html>

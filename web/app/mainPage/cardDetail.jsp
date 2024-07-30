<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.mainPage.MainDAO"%>
<%@ page import="dto.mainPage.CardDetailDTO"%>

<%
    String cardTitle = request.getParameter("cardTitle");
    CardDetailDTO cardDetail = MainDAO.cardDetail(cardTitle);

    if (cardDetail == null) {
        response.sendRedirect("errorPage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= cardDetail.getCardTitle() %> :: 마이리얼트립</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/mainPage/event.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/mainPage/aboutTravel.css">
    <link rel="stylesheet" href="../../css/mainPage/mainInfo.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/mainPage/replace.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
<!-- header 시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header 끝 -->
<!-- main 시작 -->
<main>
    <!-- 카드 상세 정보 섹션 -->
    <section class="cardDetail">
        <h1><%= cardDetail.getCardTitle() %></h1>
        <img src="<%= cardDetail.getCardImage1() %>" alt="<%= cardDetail.getCardTitle() %>">
        <img src="<%= cardDetail.getCardImage2() %>" alt="<%= cardDetail.getCardTitle() %>">
        <img src="<%= cardDetail.getCardImage3() %>" alt="<%= cardDetail.getCardTitle() %>">
        <img src="<%= cardDetail.getCardImage4() %>" alt="<%= cardDetail.getCardTitle() %>">
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
<script src="../../js/search.js"></script>
</body>
</html>

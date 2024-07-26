<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 숙소</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="${cp}/css/hotel/hotelDetail.css">
</head>
<body>
<!-- header시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header끝 -->

<div class="hotel-detail-container">
    <c:forEach var="detail" items="${hotelDetails}">
        <div class="hotel-detail">
            <h2>${detail.hotelName}</h2>
            <img src="${detail.hotelImgURL}" alt="${detail.hotelName}">
            <p>${detail.hotelLocation}</p>
            <p>${detail.hotelInfo}</p>

            <div class="room-detail">
                <h3>${detail.roomName}</h3>
                <img src="${detail.roomImgURL}" alt="${detail.roomName}">
                <p>방 개수: ${detail.roomCount}</p>
                <p>가격: ${detail.roomPrice}원/박</p>
                <p>기타 옵션: ${detail.optionOthers}</p>
            </div>
        </div>
    </c:forEach>
</div>

<!-- footer시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="/app/global/footer.jsp" %>
    </footer>
</div>
<!-- footer끝 -->
</body>

<script src="${cp}/js/designForInput.js"></script>
<script src="${cp}/js/chatbot.js"></script>
</html>

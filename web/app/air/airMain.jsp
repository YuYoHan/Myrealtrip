<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/air/airReserve.css">
    <link rel="stylesheet" href="../../css/air/air.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/air/airticket.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <title>마이리얼트립 :: 항공권</title>
</head>
<body>
<%@ include file="../global/header.jsp" %>
<%@ include file="air.jsp" %>
<main style="height: 110vh;">
    <section class="airMain">
        <div class="main-notice">
            <h2>항공권 공지사항</h2>
            <div class="notice-more">
                <!-- 영흔님 이부분 구현 해주세요
                     공지상황 게시글 보는 페이지-->
                <a class="notice-more-btn" href="#">더보기</a>
            </div>
            <table class="air-board">
                <tbody class="rowlength">
                <tr>
                    <td class="air-tal">
						<span class="air-board-contents">
						[공지] 2022년 6월 1일 부 유류할증료 인상 예정 안내
						</span>
                    </td>
                    <td class="time">2022-05-27</td>
                </tr>
                <tr>
                    <td class="air-tal">
						<span class="air-board-contents">
						[공지] 티웨이항공(TW) 비즈니스 좌석 판매 안내
						</span>
                    </td>
                    <td class="time">2022-05-27</td>
                </tr>
                <tr>
                    <td class="air-tal">
						<span class="air-board-contents">
						[공지] 거리두기 격상에 따른 국내선 항공권 환불 요청 방법
						</span>
                    </td>
                    <td class="time">2022-05-27</td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
    <section class="airBanner">
        <%@ include file="../air/airBanner.jsp" %>
    </section>
</main>
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../../app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="../../js/swiper_ReserveContainer.js"></script>
<script src="../../js/chatbot.js"></script>
<script src="../../js/air.js"></script>
<script src="../../js/designForInput.js"></script>
</html>
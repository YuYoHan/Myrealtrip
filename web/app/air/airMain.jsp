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
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/global/header_sub.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/mainPage/mainInfo.css">
    <link rel="stylesheet" href="../../css/air/air.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/air/airticket.css">
    <!-- jQuery 라이브러리 포함 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- 외부 캘린더 사용-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
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
                <a class="notice-more-btn" href="${cp}/air/airNoticeList.ar">더보기</a>
            </div>
            <table class="air-board">
                <tbody class="rowlength">
                <c:choose>
                    <c:when test="${not empty AirNoticesList}">
                        <c:forEach var="notice" items="${AirNoticesList}" begin="0" end="6">
                            <tr>
                                <td class="air-tal">
                                    <span class="air-board-contents">
                                        <a style="color: #495056;"
                                           href="${cp}/air/airNoticeDetail.ar?airNoticeId=${notice.airNoticeId}">[공지] &nbsp;${notice.airNoticeTitle}</a>
                                    </span>
                                </td>
                                <td class="time">>${notice.airNoticeRegTime}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="2" class="air-tal">
                                <span class="air-board-contents">현재 공지사항이 없습니다.</span>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>

        </div>
    </section>
<%--    <section class="airBanner">--%>
<%--        <%@ include file="../air/airBanner.jsp" %>--%>
<%--    </section>--%>
</main>
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../../app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script src="../../js/swiper_ReserveContainer.js"></script>
<script src="../../js/chatbot.js"></script>
<script src="../../js/air.js"></script>
<script src="../../js/designForInput.js"></script>
</html>
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
    <title>마이리얼트립 :: 항공권 공지사항</title>
</head>
<body>
<%@ include file="../global/header.jsp" %>
<main style="height: 110vh;">
    <section class="airMain">
        <div class="main-notice">
            <h2>항공권 공지사항</h2>
<%--            <div class="notice-more">--%>
<%--                <a class="notice-more-btn" href="#">더보기</a>--%>
<%--            </div>--%>
            <table class="air-board">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>등록일</th>
<%--                    <th>액션</th>--%>
                </tr>
                </thead>
                <tbody class="rowlength">
                <c:choose>
                    <c:when test="${not empty AirNoticesList}">
                        <c:forEach var="notice" items="${AirNoticesList}">
                            <tr>
                                <td class="air-tal">
                                    <span class="air-board-contents"><a style="color: #495056;"   href="${cp}/air/airNoticeDetail.ar?airNoticeId=${notice.airNoticeId}">[공지] &nbsp;${notice.airNoticeTitle}</a></span>
                                </td>
                                <td class="time">${notice.airNoticeRegTime}</td>
<%--                                <td>--%>
<%--                                    <a href="viewNotice.jsp?noticeId=${notice.airNoticeId}">상세보기</a> |--%>
<%--                                    <a href="editNotice.jsp?noticeId=${notice.airNoticeId}">수정하기</a> |--%>
<%--                                    <a href="deleteNotice.jsp?noticeId=${notice.airNoticeId}">삭제하기</a>--%>
<%--                                </td>--%>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" class="air-tal">
                                <span class="air-board-contents">현재 공지사항이 없습니다.</span>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div class="actions">
            <a style="color: #495056;"  href="${cp}/air/airMain.ar">목록으로</a>
        </div>
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

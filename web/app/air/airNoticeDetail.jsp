<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="../../css/air/airReserve.css">
    <link rel="stylesheet" href="../../css/air/air.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/air/airticket.css">
    <link rel="stylesheet" href="../../css/index.css">
</head>
<body>
<%@ include file="../global/header.jsp" %>
<main>
    <h2>공지사항 상세보기</h2>
    <div class="notice-details">
        <h3>${airNotice.airNoticeTitle}</h3>
        <p>${airNotice.airNoticeDetails}</p>
        <p>등록일: ${airNotice.airNoticeRegTime}</p>
        <p>수정일: ${airNotice.airNoticeUpdateTime}</p>
    </div>
    <div class="actions">
        <a  style="color: #495056;"  href="${cp}/air/airMain.ar">목록으로</a>
    </div>
</main>
<%@ include file="../../app/global/footer.jsp" %>
</body>
</html>

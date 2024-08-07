<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.mainPage.MainDAO" %>
<%@ page import="dto.mainPage.MainDetailDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<%
    int a = Integer.parseInt(request.getParameter("placeId"));
    // 모든 상품 목록을 조회
    MainDetailDTO detail = MainDAO.mainDetail(a);
    request.setAttribute("detail", detail);

    // 상세 정보를 표시할 상품 ID를 URL 파라미터로 받음
    String idParam = request.getParameter("id");


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 정보</title>
    <link rel="stylesheet" href="${cp}/css/global/common.css">
    <link rel="stylesheet" href="${cp}/css/mainPage/mainDetail.css">
    <link rel="stylesheet" href="${cp}/css/global/footer.css"> <!-- 추가된 부분 -->
</head>
<body>
<%@ include file="../global/header.jsp" %>

<main>
    <section class="mainProduct">
        <div class="detail ${detail != null ? 'active product-detail' : ''}">
            <c:if test="${detail != null}">
                <h1>${detail.mainDetailTitle}</h1><br>
                <div class="product-info">
                    <p> o ${detail.mainDetailPrice}</p>
                    <p> o ${detail.mainDetailOption}</p>
                </div>

                <img src="${detail.contentImage}" alt="${detail.mainDetailTitle}">
                <div class="guide-text">
                    <p>${detail.content}</p>

                </div>
                <a href="${cp}/rePlace.jsp">목록으로 돌아가기</a>
            </c:if>
        </div>
    </section>
</main>

<%@ include file="../global/footer.jsp" %> <!-- footer.jsp 포함 -->
</body>
</html>

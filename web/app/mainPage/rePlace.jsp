<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Bootstrap CSS 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- rePlace.css 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rePlace.css">
</head>
<body>
<div class="container">
    <div class="rePlace_container">
        <div class="headlineWrapper">
            <h2 class="headline">회원님을 위한 추천상품</h2>
        </div>

        <div class="row">
            <c:forEach items="${replaceList}" var="replace" varStatus="status">
            <div class="col-md-3">
                <div class="productCard">
<%--                    <a href="${replace.placeDetailurl }">--%>
                    <img class="img-fluid productImage" src="${replace.placeImage}" alt="${replace.placeTitle}">
<%--                    </a>--%>
<%--                        <div class="productContent">--%>
<%--                        <div class="productTitle">--%>
                            <span>${replace.placeTitle}</span>
                        </div>
                        <span class="productDescription">${replace.placeContents}</span>
                    </div>
                </div>
            </div>
            <!-- 4개씩 한 줄에 출력하기 위해서 row div를 닫고 새로 시작 -->
            <c:if test="${status.count % 4 == 0}">
        </div><div class="row">
        </c:if>
        </c:forEach>
    </div>
    </div>
</div>
<!-- Bootstrap JS, Popper.js, and jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

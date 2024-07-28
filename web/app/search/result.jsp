<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>마이리얼트립 :: 검색 결과</title>
    <link rel="stylesheet" href="../../css/search/result.css">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/global/header.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
</head>
<body>
    <%@ include file="../global/header.jsp" %>
    <div id="search-keyword">${param.word}</div>
        <div id="result-Wrapper">
            <c:forEach var="item" items="">
                <div id="result-content">
                    <img src="${item.hotel_img_url}" alt="${item.hotel_id}" id="result-image">
                    <div>
                        <h5>${item.hotel_name}</h5>
                    </div>
                </div>
            </c:forEach>
        </div>
    <div class="default-components" id="footer-components">
        <footer id="footer" class="footer-container">
            <%@ include file="../../app/global/footer.jsp" %>
        </footer>
    </div>
</body>
</html>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.air.AirDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../../css/air/airBanner.css">
<link rel="stylesheet" href="../../css/global/common.css">
<%--<link rel="stylesheet" href="../../css/mainPage/event.css">--%>
<%--<link rel="stylesheet" href="../../css/index.css">--%>
<%--<link rel="stylesheet" href="../../css/mainPage/aboutTravel.css">--%>
<%--<link rel="stylesheet" href="../../css/mainPage/mainInfo.css">--%>
<%--<link rel="stylesheet" href="../../css/mainPage/replace.css">--%>
<%--<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>--%>

<!-- 전체 배너 슬라이드 섹션을 포함하는 div.-->
<div class="recent_slide promo">
    <!-- mainBanner_container, mainBanner_row, swiper: 슬라이드의 구조를 정의하는 div들-->
    <div class="mainBanner_container">
        <div class="mainBanner_row">
            <div class="swiper">
                <div style="width: 3900px;" class="swiper-wrapper">
                    <!-- 슬라이드 내용 -->
                    <c:forEach items="${bannerList}" var="ben">
                        <div class="swiper-slide image-slide">
                            <a href="#"><img class="bannerImage" src="${ben.imageUrl}"></a>
<%--                            <div class="cardEffect"></div>--%>
<%--                            <div class="cardContent">--%>
<%--                                <div class="cardTitle">--%>
<%--                                    <span class="cardTit">${card.title}</span>--%>
<%--                                </div>--%>

<%--                                    &lt;%&ndash;                                <span class="cardDescribe">${card.contents}여러개의 여행 상품</span>&ndash;%&gt;--%>
<%--                                <a class="cardBtn" href="#">둘러보기</a>--%>
<%--                            </div>--%>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="mainbanner-pagination"></div>
    <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
    <div class="mainbanner-button-prev"></div>
    <div class="mainbanner-button-next mainBannerBtn"></div>
</div>

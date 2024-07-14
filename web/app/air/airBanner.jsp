<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.air.AirDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../../css/air/airBanner.css">

<!-- 전체 배너 슬라이드 섹션을 포함하는 div.-->
<div class="recent_slide promo">
    <!-- mainBanner_container, mainBanner_row, swiper: 슬라이드의 구조를 정의하는 div들-->
    <div class="mainBanner_container">
        <div class="mainBanner_row">
            <div class="swiper">
                <div class="swiper-wrapper mianBanner_wrapper">
                    <!-- 슬라이드 내용 -->
                    <c:forEach items="${bannerList}" var="ben">
                        <a class="swiper-slide mainBannerItem" href="${ben.bannerURL}">
                            <div class="image_container">
                                <img class="bannerImage" src="${ben.bannerImage}">
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="mainbanner-pagination"></div>
    <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
    <div class="mainbanner-button-prev "></div>
    <div class="mainbanner-button-next mainBannerBtn"></div>
</div>
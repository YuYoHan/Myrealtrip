<%--
  User: 유요한
  Date: 24. 7. 11.
  Time: 오후 1:28
  메인 페이지 베너 부분
--%>
<%@page import="java.util.Map" %>
<%@page import="java.util.List" %>
<%@page import="dao.main.MainDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="mainBanner_container">
    <div class="mainBanner_row">
        <div class="banner_container">
            <div class="swiper">
                <div class="swiper-wrapper mianBanner_wrapper">
                    <!-- 슬라이드 내용 -->
                    <jsp:useBean id="bannerList" scope="request" type="java.util.List"/>
                    <c:forEach items="${bannerList}" var="ben">
                        <a class="swiper-slide mainBannerItem" href="${ben.bannerURL}">
                            <div class="image_container">
                                <img class="bannerImage" src="${ben.bannerImage}">
                            </div>
                        </a>
                    </c:forEach>
                </div>
                <div class="mainbanner-pagination"></div>
                <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
                <button class="mainbanner-button-prev mainBannerBtn">
                    <img src="../../img/mainPage/white_arrow_prev.svg" alt="arrow">
                </button>
                <button class="mainbanner-button-next mainBannerBtn">
                    <img src="../../img/mainPage/white_arrow_next.svg" alt="arrow">
                </button>
            </div>
        </div>
    </div>
</div>

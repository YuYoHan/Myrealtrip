<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.mainPage.MainDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="mainHeader_container">
    <div class="headlineWrapper">
        <h2 class="headline">여행이 돌아왔어요!</h2>
        <button type="button" class="travelLink">
            <span>격리 없는 여행지 </span>
            <img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrow_right_12x12_blue_500.svg" alt="icon">
        </button>
    </div>
</div>
<div class="mainHeader_container">
    <div class="mainHeader_row">
        <div class="card_container">
            <!-- swiper를 초기화하여 스크립트 태그에서 옵션을 설정한다. -->
            <div class="swiper-container">
                <!-- 슬라이드를 감싸는 div태그 -->
                <div style="width: 3900px;" class="swiper-wrapper">
                    <!-- 슬라이드 내용 -->
                    <c:forEach items="${cardList}" var="card">
                        <div class="swiper-slide image-slide">
                            <a href="/mainPage/mainDetail.mi?cardTitle=${card.title}">
                                <img class="headerImage" src="${card.travelImage}" alt="이미지">
                            </a>
                            <div class="cardEffect"></div>
                            <div class="cardContent">
                                <div class="cardTitle">
                                    <span class="cardTit">${card.title}</span>
                                </div>
                                <a class="cardBtn" href="/app/mainPage/cardDetail.jsp?cardTitle=${card.title}">둘러보기</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <button class="main-button-prev mainHeaderBtn">
                    <img src="<c:url value='/img/mainPage/arrow_prev.svg'/>" alt="arrow">
                </button>
                <button class="main-button-next mainHeaderBtn">
                    <img src="<c:url value='/img/mainPage/arrow_next.svg'/>" alt="arrow">
                </button>

            </div>
        </div>
    </div>
</div>

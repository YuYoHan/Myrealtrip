<%--
  Date: 24. 7. 11.
  Time: 오후 12:46
  메인 페이지 헤더 부분
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.main.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                <div style="width: 3240px;" class="swiper-wrapper">
                    <!-- 슬라이드 내용 -->
                    <%--@elvariable id="cardList" type="java.util.List"--%>
                    <c:forEach items="${cardList}" var="card">
                        <div class="swiper-slide image-slide">
                            <img class="headerImage" src="${card.travelpicture}" alt="이미지" >
                            <div class="cardEffect"></div>
                            <div class="cardcontent">
                                <div class="cardtitle">
                                    <span class="cardtit"> ${card.traveltitle}</span>
                                </div>
                                <span class="carddesribe">${card.travelcontent}여러개의 여행 상품</span>
                                <a class="cardbtn" href="#">둘러보기</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
                <button class="main-button-prev mainHeaderBtn">
                    <img src="../../img/mainPage/arrow_prev.svg" alt="arrow">
                </button>
                <button class="main-button-next mainHeaderBtn">
                    <img src="../../img/mainPage/arrow_next.svg" alt="arrow">
                </button>

            </div>
        </div>
    </div>
</div>

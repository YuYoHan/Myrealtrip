<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.main.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<div class="mainHeader_container">
    <div class="headlineWrapper">
        <h2 class="headline" style="font-size:24px; margin-bottom:0; font-weight : 700;">실시간 베스트 상품</h2>
    </div>
</div>
<div class="mainHeader_container">
    <div class="mainHeader_row">
        <div class="card_container">
            <!-- swiper를 초기화하여 스크립트 태그에서 옵션을 설정한다. -->
            <div class="best-swiper">
                <!-- 슬라이드를 감싸는 div태그 -->
                <div style="width: 3240px;" class="swiper-wrapper">
                    <!-- 슬라이드 내용 -->
                    <c:forEach items="${ticketList}" var="tl">
                        <a class="swiper-slide best-container fixedWidth">
                            <div class="thumnail">
                                <div class="cardThumnail">
                                    <div class="imgLoad">
                                        <!-- 썸네일 사진 부분 -->
                                        <img class="thumnailImg" src="${tl.image}" alt="img" >
                                    </div>
                                    <!-- 이벤트 부분 가져오면 무료취소인지 단독특가인지 if문으로 구분함. -->
                                    <c:if test="${tl.ticket_event == '무료취소'}">
                                        <span class="event freeRefund">무료취소</span>
                                    </c:if>
                                    <c:if test="${tl.ticket_event == '단독특가' }">
                                        <span class="event lowestPrice">단독특가</span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="offerVerticalCard">
                                <div class="cardCategory">
                                    <div class="cardCategory_label">
                                        <!-- 티켓패스, 종류 , 장소-->
                                            ${tl.ticket_kind}ㆍ${tl.country}
                                    </div>
                                </div>
                                <h3 class="cardTitle">
                                    <div class="cardTit">
                                        <!-- 상품 명 -->
                                            ${tl.ticket_name}
                                    </div>
                                </h3>
                                <div class="offerInfo">
                                    <div class="offerReview">
                                        <div class="review_container">
                                            <div class="starRating">
                                                <!-- 별 갯수 -->
                                                <c:if test="${tl.replyCount != ''}">
                                                    <c:forEach begin="1" end="${tl.scope}">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12">
                                                            <path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path>
                                                        </svg>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${tl.replyCount == '' }">
                                                    <img class="starRating_img" src="${cp}/img/mainPage/percent.svg">
                                                    <span class="starRating_text">후기 이벤트</span>
                                                </c:if>
                                            </div>
                                            <span class="cardRating_review">
                            	<!-- 리뷰갯수 -->
                            	${tl.replyCount}
                            </span>
                                        </div>
                                    </div>
                                    <div class="offerPrice">
                                        <!-- 오리지날 가격이 있을 경우 아래의 태그를 보여준다. -->
                                        <c:if test="${tl.originalPrice != ''}">
                        		<span class="offerPrice_original">
		                          	<!-- 오리지날 가격이 들어가는 곳 -->
		                          	${tl.originalPrice}원
		                        </span>
                                        </c:if>
                                        <span class="offerPrice_main">
                          	<!-- 메인 가격이 들어가는 곳 -->
                          	${tl.price}
                          <span class="offerPrice_won">원</span>
                          </span>
                                        <span class="offer_standard">
                          	<!-- 기준 명이 들어가는 곳 -->
                          	/ ${tl.standard_num }인
                          </span>
                                    </div>
                                </div>
                            </div>
                            <!-- 좋아요 누르기 버튼, 불리언 타입으로 검사하여 서로 다른 이미지를 보여주도록 하자 -->
                            <c:if test="${tl.heart_like == false}">
                                <div class="wishlist">
                                    <img src="../../img/mainPage/like.svg" alt="">
                                </div>
                            </c:if>
                            <c:if test="${tl.heart_like == true }">
                                <div class="wishlist">
                                    <img src="../../img/mainPage/heart_like_fill.svg" alt="">
                                </div>
                            </c:if>
                        </a>
                    </c:forEach>
                    <!-- 슬라이드 끝  -->
                </div>
                <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
                <button class="main-button-prev">
                    <img src="../../img/mainPage/arrow_prev.svg" alt="arrow">
                </button>
                <button class="main-button-next">
                    <img src="../../img/mainPage/arrow_next.svg" alt="arrow">
                </button>
            </div>
        </div>
    </div>
</div>
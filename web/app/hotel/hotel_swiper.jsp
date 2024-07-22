<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<div class="template-Container">
    <div>
        <h2 class="sectionTitle-title">할인 혜택</h2>
        <div class="CardCarousel-Container Cdn">
            <div class="swiper swiper-pointer-events">
                <div class="swiper-wrapper hotelBanner_wrapper">
                    <!-- 슬라이드 내용 -->
                    <c:forEach items="${hotelbannerList}" var="ben">
                        <a class="swiper-slide hotelBannerItem" href="${ben.bannerURL}">
                            <div class="image_container">
                                <img class="bannerImage" src="${ben.bannerImage}">
                            </div>
                        </a>
                    </c:forEach>
                </div>
                <div class="swiper-pagination-bullets swiper-pagination-horizontal swiper-pagination swiper-pagination-bullet-active"></div>
            </div>
        </div>
    </div>
    <div style="height:342px;">
        <h2 class="sectionTitle-title">급상승 숙소</h2>
        <div class="CardCarousel-Container Crd Best">
            <div class="swiper swiper-initialized risingHotel swiper-initializedse swiper-pointer-events">
                <div class="swiper-wrapper">
                    <c:forEach items="${hotelsugsoList}" var="ven">
                        <div class="swiper-slide swiper-slide-active">
                            <a class="ProductCard-Container"
                               href="${cp}/reserve/reserve.rs?dateFilter=${param.datefilter}&hotelNum=${ven.up_sugso_num}&hotelName=${ven.sugso_name}&hotelImg=${ven.img_url}&hotelPrice=${ven.price}">
                                <div class="ProductCard-image">
                                    <img class="css-y5m0bt" src="${ven.img_url}">
                                </div>
                                <div class="ProductCard-Content">
                                    <p class="ProductCard-Category">${ven.category}</p>
                                    <p class="ProductCard-Name">${ven.sugso_name}</p>
                                    <div class="ReviewRatingCount">
                                        <img class="css-labkkb" src="${ven.icon_img}" alt="icon">
                                        <p class="RatingCount-Rating">${ven.rating}</p>
                                        <p class="RatingCount-Count">${ven.count}</p>
                                    </div>
                                    <p class="ProductCard-Price">${ven.price}</p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <button type="button" class="hotelsugsoList-button-prev">
                <img src="${cp}/img/mainPage/arrow_prev.svg">
            </button>
            <button type="button" class="hotelsugsoList-button-next">
                <img src="${cp}/img/mainPage/arrow_next.svg">
            </button>
        </div>
    </div>
    <div style="height:342px;">
        <h2 class="sectionTitle-title">제주도 특가 호텔</h2>
        <div class="CardCarousel-Container Crd special">
            <div class="swiper swiper-initialized risingHotel swiper-initializedse swiper-pointer-events">
                <div class="swiper-wrapper">
                    <c:forEach items="${hotelspecialList}" var="sen">
                    <div class="swiper-slide swiper-slide-active">
                        <a class="ProductCard-Container"
                           href="${cp}/reserve/reserve.rs?dateFilter=${param.datefilter}&hotelNum=${sen.up_sugso_num}&hotelName=${sen.sugso_name}&hotelImg=${sen.img_url}&hotelPrice=${sen.price}">
                            <div class="ProductCard-image">
                                <img class="css-y5m0bt" src="${sen.img_url}">
                            </div>
                            <div class="ProductCard-Content">
                            <p class="ProductCard-Category">${sen.category}</p>
                            <p class="ProductCard-Name">${sen.sugso_name}</p>
                            <div class="ReviewRatingCount">
                                <img class="css-labkkb" src="${sen.icon_img}" alt="icon">
                                <p class="RatingCount-Rating">${sen.rating}</p>
                                <p class="RatingCount-Count">${sen.count}</p>
                            </div>
                            <p class="ProductCard-Price">${sen.price}</p>
                    </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
        <button type="button" class="hotelspecialList-button-prev">
            <img src="${cp}/img/mainPage/arrow_prev.svg">
        </button>
        <button type="button" class="hotelspecialList-button-next">
            <img src="${cp}/img/mainPage/arrow_next.svg">
        </button>
    </div>
</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<div class="template-Container">
    <div>
        <div class="CardCarousel-Container Cdn">
            <div class="swiper swiper-pointer-events">
                <div class="swiper-wrapper hotelBanner_wrapper">
                    <c:forEach items="${hotelbannerList}" var="ben">
                        <a class="swiper-slide hotelBannerItem" href="#">
                            <div class="image_container">
                                <img class="hotelImage" src="${ben.hotelImgURL}">
                            </div>
                        </a>
                    </c:forEach>
                </div>
                <div class="swiper-pagination-bullets swiper-pagination-horizontal swiper-pagination swiper-pagination-bullet-active"></div>
            </div>
        </div>
    </div>
</div>
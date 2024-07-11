<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<header class="main-header">
    <nav class="GNB-Container">
        <div class="GNB-Logo">
            <button type="button" class="GNB-Button">
                <a href="../../index.jsp">
                    <img class="GNB-Logoimg" src="https://dffoxz5he03rp.cloudfront.net/icons/logo_mrt_web.svg">
                </a>
            </button>
        </div>
        <div class="GNB-Search">
            <div class="GNB-SearchContainer">
                <div class="GNB-SearchInput">
                    <div class="Search-IconContainer">
                        <img class="Search-Icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_search_20x20_gray_500.svg">
                    </div>
                    <input placeholder="도시나 상품을 검색해보세요" class="Keyword-Input">
                </div>
            </div>
        </div>
        <div class="NavItems-Container">
            <div class="LoggedItems">
                <div class="NavButton">
                    <button type="button" class="Wishlist-button">위시리스트</button>
                </div>
                <div class="NavButton">
                    <button type="button" class="Wishlist-button" ><a href="${cp}/myTrip/mytrip.mt">내 여행</a></button>
                </div>
                <div class="NavButton">
                    <button type="button" class="Wishlist-button">메시지</button>
                </div>
                <div class="NavButton">
                    <button type="button" class="Wishlist-button" onclick="'#'">알림</button>
                </div>
                <div class="Penguin-Container">
                    <div class="Penguin-Button">
                        <button type="button" class="Penguin-Logo">
                            <img class="Penguin-img" src="https://d2yoing0loi5gh.cloudfront.net/assets/default/user_profile_image-414acc60b27f0a258bec14c82b70dc361fc6768da9289f924f887bec1fc33849.png">
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="headerLnb">
        <nav class="localNavBar">
            <div class="lnbWrapper">
                <div class="localItemWithIcon">
                    <a href="../../index.jsp">
                        <span>홈</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/air/airReserve.ar">
                        <span>항공권</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/tour/tourTicket.tr">
                        <span>투어·티켓</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/hotel.ht">
                        <span>숙소</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/hotel/hotel.ht">
                        <span>호캉스</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="#">
                        <span>렌터카</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="#">
                        <span>패키지</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="#">
                        <span>한인민박</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="#">
                        <span>키즈</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="#">
                        <span>할인혜택</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</header>
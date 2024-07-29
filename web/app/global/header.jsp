<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<header id="mainHeader">
    <div class="headerGnb">
        <nav class="globalNavBar">
            <div class="logo">
                <a href="<c:url value="/"/>"><img src="<c:url value="/img/global/logo.png"/>" alt="logo"></a>
            </div>
            <div class="searchBar">
                <div id="searchContainer" class="searchContainer">
                    <div class="searchImg">
                        <img src="<c:url value="/img/global/search.svg"/>" alt="search">
                    </div>
                    <input id="searchInput" class="searchInput" type="text" placeholder="상품을 검색해보세요" onkeyup="enterkey()">
                </div>
            </div>
            <!-- 로그인 정보 있을 경우  -->
            <c:choose>
                <c:when test="${loginUser == null}">
                    <div class="globalItems">
                        <div class="globalItem">
                            <a href="${cp}/member/signIn.us">
                                로그인
                            </a>
                        </div>
                        <div class="globalItem signInItem">
                            <a href="${cp}/member/signUp.us">
                                회원가입
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- globalItems는 세션에 로그인 정보가 있어야 창을 보여줌 -->
                    <div class="globalItems">
                        <div class="globalItem">
                            <a href="#">위시리스트</a>
                        </div>
                        <div class="globalItem">
                            <a href="${cp}/myTrip/myTrip.mt">내 여행</a>
                        </div>
                        <div class="globalItem">
                            <a href="#">메시지</a>
                        </div>
                        <div class="globalItem">
                            <button onclick="location.href='#'">알림</button>
                        </div>
                        <div class="profileItem">
                            <div class="profileCard">
                                <button onclick="myInfo()">
                                    <img src="../../img/global/bird.png" alt="bird">
                                </button>
                            </div>
                            <div class="myinfoContainer">
                                <span class="smallArrow"></span>
                                <div class="ProfilePopup-InfoSection">
                                    <div class="ProfileCardButton-Container">
                                        <div class="ProfileCardButton">
                                            <img src="http://d2yoing0loi5gh.cloudfront.net/assets/default/user_profile_image-414acc60b27f0a258bec14c82b70dc361fc6768da9289f924f887bec1fc33849.png">
                                        </div>
                                        <div class="DetailContainer">
                                            <span>${loginUser.userName}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="myinfo">
                                    <a href="${cp}/member/logOut.us">
                                        <span class="ProfilePopupLink">로그아웃</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
    <div class="headerLnb">
        <nav class="localNavBar">
            <div class="lnbWrapper">
                <div class="localItemWithIcon">
                    <a href="${cp}/air/airMain.ar">
                        <img src="../../img/global/plane.png" alt="plane">
                        <span>항공권</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/hotel/hotel.ht">
                        <img src="../../img/global/pool.png" alt="pool">
                        <span>숙소</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/hotel/hotel.ht">
                        <img src="../../img/global/domestichotel.png" alt="flag">
                        <span>국내호텔</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/hotel/hotel.ht">
                        <img src="../../img/global/trip.png" alt="trip">
                        <span>해외호텔</span>
                    </a>
                </div>
                <div class="localItemWithIcon">
                    <a href="${cp}/insurance/insurance.ns">
                        <img src="../../img/global/insurance.png" alt="car">
                        <span>여행자보험</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</header>

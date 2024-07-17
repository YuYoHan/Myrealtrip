<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 내 여행</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="${cp}/img/favicon.ico">
    <link rel="stylesheet" href="${cp}/css/air/airlist.css">
    <link rel="stylesheet" href="${cp}/css/common.css">
    <link rel="stylesheet" href="${cp}/css/header_sub.css">
    <link rel="stylesheet" href="${cp}/css/mytrip/mytrip.css">
    <link rel="stylesheet" href="${cp}/css/footer.css">
</head>
<body>
<c:if test="${loginUser == null}">
    <script>
        alert("로그인 후 이용해 주세요!");
        location.href = "${cp}/user/sign_in.us";
    </script>
</c:if>
<div style="position: relative" class="defult-com">
    <%@include file="/app/global/header_sub.jsp" %>
</div>
<!-- 메인시작 -->
<div id="ReservationHistoryList">
    <div class="mytrip-container">
        <div class="mytrip-row">
            <main class="main-container">
                <h1 class="main-title">내 여행</h1>
                <div class="main-wrapper">
                    <div class="mytrip-sidebar">
                        <div class="mytrip-sidebarItem active">
                            <span class="sidebarTxt">항공권 및 숙박</span>
                        </div>
                    </div>

                    <ul class="flight_list">
                        <c:if test="${mytripRoomList != null and mytripRoomList.size() > 0 }">
                            <!-- 숙박 -->
                            <c:forEach items="${mytripRoomList}" var="rlist">
                                <li class="flight_items">
							<span class="airline_ico">
								<img src="${rlist.hotelImg}">
							</span>
                                    <span class="airline_name">
								<em>${rlist.hotelname}</em>
								<em class="airline_num">제주 감성 호텔 ♥</em>
							</span>
                                    <span class="airline_time">
								<span class="dep_time time">
									<em class="rlistTime">${rlist.datefilter}</em>
								</span>
							</span>
                                    <strong class="airline_price rlistPrice">${rlist.hotelPrice}</strong>
                                    <div class="arrow">
                                        <a href="${cp}/mytrip/deleteHotelTicket.mt?&userEmail=${loginUser.useremail}&hotelName=${rlist.hotelname}">
                                            <img class="arrowImg" src="${cp}/img/etc/close.png">
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:choose>
                            <c:when test="${mytripAirList != null and mytripAirList.size()>0}">
                                <c:forEach items="${mytripAirList}" var="list">
                                    <li class="flight_items">
							<span class="airline_ico">
								<c:if test="${list.airline eq '에어서울'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/RS.png">
                                </c:if>
								<c:if test="${list.airline eq '아시아나항공'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/OZ.png">
                                </c:if>
								<c:if test="${list.airline eq '제주항공'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/7C.png">
                                </c:if>
								<c:if test="${list.airline eq '진에어'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/LJ.png">
                                </c:if>
								<c:if test="${list.airline eq '대한항공'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/KE.png">
                                </c:if>
								<c:if test="${list.airline eq '티웨이항공'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/TW.png">
                                </c:if>
								<c:if test="${list.airline eq '에어부산'}">
                                    <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/BX.png">
                                </c:if>

							</span>
                                        <span class="airline_name">
								<em>${list.airline}</em>
								<em class="airline_num">${list.airnum}</em>
							</span>
                                        <span class="airline_time">
								<span class="dep_time time">
								<em>
								${list.dep}
								<span class="mrt_tootip_wrap ">
									<span class="txt_wrap">
										<span class="txt">INCH</span>
									</span>
								</span>
								</em>
								</span>
								<span class="from_to">
									<span class="fromTo_ico"> </span>
									<em class="from_to_time time">1시간 10분</em>
								</span>
								<span class="arr_time time">
									<!-- 이동시간이 경과된 시간 -->
									<em>${list.arr}</em>
								</span>
							</span>
                                        <strong class="airline_price">${list.price}</strong>
                                        <div class="arrow">
                                            <a href="${cp}/mytrip/deleteAirTicket.mt?&userEmail=${loginUser.useremail}&airNum=${list.airnum}">
                                                <img class="arrowImg" src="${cp}/img/etc/close.png">
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        <c:if test="${mytripRoomList.size() == 0 and mytripAirList.size() == 0 }">
                            <div class="mytrip-contents">
                                <div class="emptyWrapper">
                                    <img class="empty-style"
                                         src="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/empty/ic_reservation@2x-f58be91d7ddc8d59fc7fa82cab221b17e4eeef83501e56ff8c759a0684816643.png">
                                    <div class="empty-msg-wrapper">
                                        <p class="empty-msg-title">예정된 여행이 없습니다.</p>
                                        <div class="empty-msg-desc">
                                            <p>어디로 떠날지 고민 중이신가요?</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </ul>
                </div>
            </main>
        </div>
    </div>
</div>


<!-- 메인끝 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="/app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script src="${cp}/js/myInfo.js"></script>
</html>
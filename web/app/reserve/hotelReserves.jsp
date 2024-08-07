<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="${cp}/img/favicon.ico">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/reserve/reserves.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <title>마이리얼트립 :: 숙소 예약</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
<!-- 해더 시작 -->
<%--<c:if test="${loginUser == null}">--%>
<%--    <script>--%>
<%--        alert("로그인 후 이용해 주세요!");--%>
<%--        location.href = "/member/signIn.us";--%>
<%--    </script>--%>
<%--</c:if>--%>
    <%@include file="/app/global/header.jsp" %>
<!-- 해더 끝 -->
<div>
    <main class="Order-style-container">
        <form class="Order-style-formWrapper">
            <h1 class="OrderForm-style-title">예약하기</h1>
            <div class="OrderForm-style-content">
                <div class="OrderForm-style-commonPurchaseContainer">
                    <div class="SectionContainer-style-container">
                        <div class="SectionContainerHeader-style-wrapper">
                            <div class="SectionContainerHeader-style-box">
                                <h2 class="SectionContainerHeader-style-title">상품 정보</h2>
                            </div>
                        </div>
                        <hr class="SectionContainer-style-divider">
                        <div class="SectionContainer-style-body">
                            <div class="ProductInfo-style-container">
                                <div class="ProductInfoSummary-style-titleWrapper">
                                    <div class="ProductInfoSummary-style-imageWrapper">
                                        <!-- 이전 페이지에서 클릭한 상품의 이미지를 가져와야함.  -->
                                        <img class="ProductInfoSummary-style-image" src="${hotelImg}">
                                    </div>
                                    <div class="ProductInfoSummary-style-textWrapper">
                                        <!-- 이전 페이지에서 클릭한 상품의 정보가 아래에 들어가야함 -->
                                        <h3 class="ProductInfoSummary-style-title">${hotelName}</h3>
                                        <div class="ProductInfoSummary-style-schedule">
                                            <time class="ProductInfoSummary-style-startDateTime">${startYear}년 ${startMonth}월 ${startDay}일
                                                (${startweekhangle}) ~
                                            </time>
                                            <time>${endYear}년 ${endMonth}월 ${endDay}일 (${endweekhangle})</time>
                                            <%-- <span>${sleepDay}박</span> --%>
                                        </div>
                                    </div>
                                </div>
                                <ul class="ProductInfoOptions-style-optionWrapper">
                                    <li class="ProductInfoOptions-style-option">
                                        <div class="ProductInfoOptions-style-optionText">
                                            <span class="ProductInfoOptions-style-optionName">[공항 근처 특가★] 슈페리어 트윈(더블+싱글)(객실 only)</span>
                                        </div>
                                        <div class="ProductInfoOptions-style-optionPrice">${hotelPrice}</div>
                                    </li>
                                </ul>
                                <div class="ProductInfoPrice-style-totalPriceWrapper">
                                    <div class="ProductInfoPrice-style-totalPriceText">총 상품 금액</div>
                                    <strong class="ProductInfoPrice-style-totalPriceNumber">${hotelPrice}</strong>
                                </div>
                            </div>
                            <hr class="ProductInfo-style-divider">
                            <div class="CouponApplication-style-container">
                                <h3 class="CouponApplication-style-title">쿠폰 할인</h3>
                                <div class="couponDropdown">
                                    <div class="css-191gl3z">
                                        <div class="CouponApplication-style-hasCouponInfoContainer">
                                            <span class="available-coupon-label">사용 가능 쿠폰 0개 </span>
                                            <span class="coupon-count">&nbsp;/ 보유 0개</span>
                                        </div>
                                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzQ5NTA1NiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiIGQ9Ik02IDRMMTAgOC4wMDIgNi4wMDUgMTIiIHRyYW5zZm9ybT0icm90YXRlKDkwIDggOCkiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="SectionContainer-style-container">
                        <div class="SectionContainerHeader-style-wrapper">
                            <div class="SectionContainerHeader-style-box">
                                <h2 class="SectionContainerHeader-style-title">포인트 사용</h2>
                            </div>
                        </div>
                        <hr class="SectionContainer-style-divider">
                        <div class="SectionContainer-style-body">
                            <div class="Point-style-pointWrapper">
                                <div class="Point-style-labelWrapper">
                                    <span class="Point-style-label">내 포인트</span>
                                    <span class="Point-style-holdingPoint">0원</span>
                                </div>
                                <div class="Point-style-inputWrapper">
                                    <div class="checkout-point-inputbox">
                                        <input class="css-o9jzai" type="text" value="0">
                                        <span class="css-1fwrkpi">원</span>
                                    </div>
                                    <span class="checkout-point-button">
										<button type="button" class="css-1fq9c2a">
											<span class="css-1s4v6ia">모두 사용</span>
										</button>
									</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="SectionContainer-style-container">
                        <div class="SectionContainerHeader-style-wrapper">
                            <div class="SectionContainerHeader-style-box">
                                <h2 class="SectionContainerHeader-style-title">예약자 정보</h2>
                            </div>
                        </div>
                        <hr class="SectionContainer-style-divider">
                        <div class="SectionContainer-style-body">
                            <div class="ReservationPersonInfo-style-container">
                                <div class="ReservationPersonInfo-style-wrapper">
                                    <div class="ReservationPersonInfo-style-summary">
                                        <div class="InfoField-style-field">
                                            <div class="InfoField-style-title">예약자 이름</div>
                                            <div class="InfoField-style-content" id="userName">${sessionScope.userName}</div>
                                        </div>
                                        <div class="InfoField-style-field">
                                            <div class="InfoField-style-title">이메일 주소</div>
                                            <div class="InfoField-style-content" id="userEmail">${loginUser.userEmail}</div>
                                        </div>
                                    </div>
                                    <div class="ReservationPersonInfo-style-option">
										<span class="css-mkihkg">
											<button type="button" class="css-1fq9c2a">
												<span class="css-1s4v6ia">정보변경</span>
											</button>
										</span>
                                    </div>
                                </div>
                                <hr class="ReservationPersonInfo-style-divider">
                                <div class="CompanionSelect-style-container">
                                    <div class="CompanionSelect-style-title">누구와 함께 떠나세요?</div>
                                    <div class="CompanionSelect-style-subtitle">여행자님에게 꼭 맞는 여행 상품을 추천해드릴게요</div>
                                    <div>
                                        <div class="css-5suex">
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">부모님과</div>
                                                </div>
                                            </div>
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">혼자</div>
                                                </div>
                                            </div>
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">배우자와</div>
                                                </div>
                                            </div>
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">친구와</div>
                                                </div>
                                            </div>
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">아이와</div>
                                                </div>
                                            </div>
                                            <div class="mrt-chip-item">
                                                <div class="mrt-chip-item-wrapper">
                                                    <div class="mrt-chip-item-content">연인과</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="SectionContainer-style-container">
                        <div class="SectionContainerHeader-style-wrapper">
                            <div class="SectionContainerHeader-style-box">
                                <h2 class="SectionContainerHeader-style-title">추가 예약 정보</h2>
                                <span class="SectionContainerHeader-style-required">(필수)</span>
                            </div>
                        </div>
                        <hr class="SectionContainer-style-divider">
                        <div class="SectionContainer-style-body">
                            <div class="AdditionalInfoForm-style-container">
                                <div class="AdditionalInfoForm-style-wrapper">
                                    <div class="AdditionalInfoFormTitle-style-wrapper">
                                        <div>
                                            <h3 class="AdditionalInfoFormTitle-style-title">대표 투숙자</h3>
                                            <p class="AdditionalInfoFormTitle-style-helperText">
                                                원활한 예약 확인을 위해 정확하게 입력해주세요.
                                            </p>
                                        </div>
                                        <span class="AdditionalInfoFormTitle-style-checkbox">
											<div class="css-1f7apd6">
												<span class="css-paqlg9">
													<input id="mrt-traveler-info" type="checkbox" class="css-v5mf5a">
												</span>
												<label class="css-an51kc" for="mrt-traveler-info">다른 사람이 투숙해요</label>
											</div>
										</span>
                                    </div>
                                    <div class="Name-style-container">
                                        <div class="css-1vqiqg7">
                                            <label class="css-e89lkq">한글 이름</label>
                                            <input class="css-1e7i9br" type="text" placeholder="${sessionScope.userName}"
                                                   value="${sessionScope.userName}">
                                        </div>
                                    </div>
                                    <div class="Email-style-container">
                                        <div class="css-1vqiqg7">
                                            <label class="css-e89lkq">이메일 주소</label>
                                            <input class="css-1e7i9br" type="email" placeholder="${sessionScope.userName}"
                                                   value="${loginUser.userEmail}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="SectionContainer-style-container">
                        <div class="SectionContainerHeader-style-wrapper">
                            <div class="SectionContainerHeader-style-box">
                                <h2 class="SectionContainerHeader-style-title">결제 방법</h2>
                            </div>
                        </div>
                        <hr class="SectionContainer-style-divider">
                        <div class="SectionContainer-style-body">
                            <div class="PaymentMethods-style-paymentRadiosWrapper">
                                <div class="PaymentMethodRadioButton-style-buttonWrapper">
                                    <div class="css-1cweiyo">
                                                                <span class="css-1u9dzhu">
                                                                    <input id="TOSS" name="payment" type="radio"
                                                                           value="TOSS" class="css-8djd7q" checked>
                                                                </span>
                                        <label class="css-1jvr7pu" for="TOSS">
                                            토스
                                            <img src="${cp}/img/etc/toss.jpg">
                                        </label>
                                        <div class="PaymentMethodRadioButton-style-badge">첫 결제 캐시백</div>
                                    </div>
                                </div>
                                <div class="PaymentMethodRadioButton-style-buttonWrapper">
                                    <div class="css-1cweiyo">
                                                                <span class="css-1u9dzhu">
                                                                    <input id="KAKAO" name="payment" type="radio"
                                                                           value="KAKAO" class="css-8djd7q">
                                                                </span>
                                        <label class="css-1jvr7pu" for="KAKAO">
                                            카카오페이
                                            <img src="${cp}/img/etc/kakaoPay.png">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="/app/reserve/airRerserves_side.jsp" %>
            </div>
        </form>
    </main>
</div>
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="/app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script src="../../js/myInfo.js"></script>
<script src="../../js/payment.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<%
    // JSP에서 파라미터 값을 가져옵니다.
    String outAirline = request.getParameter("outAirline");
    String outTime = request.getParameter("outTime");
    String outArriveTime = request.getParameter("outArriveTime");
    String inAirline = request.getParameter("inAirline");
    String inTime = request.getParameter("inTime");
    String inArriveTime = request.getParameter("inArriveTime");
    String fromAirPort = request.getParameter("fromAirPort");
    String toAirPort = request.getParameter("toAirPort");
    String seat = request.getParameter("seat");
    String price = request.getParameter("price");
    String peopleCount = request.getParameter("peopleCount");
    String depDate = request.getParameter("depDate");
    String retDate = request.getParameter("retDate");

    System.out.println("이것은 무엇일까 될 것 인가????");
    // 파라미터 값을 서버 콘솔에 출력합니다.
    System.out.println("outAirline: " + outAirline);
    System.out.println("outTime: " + outTime);
    System.out.println("outArriveTime: " + outArriveTime);
    System.out.println("inAirline: " + inAirline);
    System.out.println("inTime: " + inTime);
    System.out.println("inArriveTime: " + inArriveTime);
    System.out.println("fromAirPort: " + fromAirPort);
    System.out.println("toAirPort: " + toAirPort);
    System.out.println("seat: " + seat);
    System.out.println("price: " + price);
    System.out.println("peopleCount: " + peopleCount);
    System.out.println("depDate: " + depDate);
    System.out.println("retDate: " + retDate);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
<div class="FloatContainer-container">
    <div class="SectionContainer-container">
        <div class="SectionContainerHeader-wrapper">
            <div class="SectionContainerHeader-box">
                <h2 class="SectionContainerHeader-title">결제 정보</h2>
            </div>
        </div>
        <hr class="SectionContainer-divider">
        <div class="SectionContainerBody-sibedar">
            <div class="PaymentInfo-priceInfo">
                <div class="PaymentInfo-orderPrice">
                    <span class="PaymentInfo-orderPriceText">주문 금액</span>
                    <span class="PaymentInfo-orderPriceText">${price}</span>
                    <span class="PaymentInfo-orderPriceText">인원수</span>
                    <span class="PaymentInfo-orderPriceText">${peopleCount}</span>
                </div>
            </div>
            <div class="PaymentInfo-totalPriceWrapper">
                <span class="PaymentInfo-totalPriceText">총 결제 금액</span>
                <span class="PaymentInfo-totalPriceText">
                    <span class="PaymentInfo-totalPrice">${totalPrice}</span>
                </span>
            </div>
        </div>
    </div>
    <div class="SectionContainer-container">
        <div class="SectionContainerHeader-wrapper">
            <div class="SectionContainerHeader-box">
                <h2 class="SectionContainerHeader-title">약관 안내</h2>
            </div>
        </div>
        <hr class="SectionContainer-divider">
        <div class="SectionContainerBody-sibedar">
            <div class="PolicyFormWrapper-container">
                <div>
                    <div class="form-item">
                        <div class="AllTerms-termContainer">
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm">여행자 약관 동의 (필수)</input>
                                <img class="css-xqn21t" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm">개인정보 제공 동의(필수)</input>
                                <img class="css-xqn21t" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm">개인정보 수집 및 이용 동의(필수)</input>
                                <img class="css-xqn21t" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                        </div>
                        <strong class="Allterms-defaultCheckAllTerm">위 약관을 확인하였으며, 회원 본인은 약관 및 결제에 동의합니다.</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="PurchaseButton-buttonWrapper">
        <span role="button" class="css-w0pi5v">
            <button type="button" class="PurchaseButton-button css-jgs6n" id="paymentButton">
                <span class="css-1s4v6ia" id="payment">${totalPrice} 결제하기</span>
            </button>
        </span>
    </div>
</div>

<!-- 숨겨진 입력 필드를 추가합니다 -->
<input type="hidden" id="outAirline" value="<%= outAirline %>">
<input type="hidden" id="outTime" value="<%= outTime %>">
<input type="hidden" id="outArriveTime" value="<%= outArriveTime %>">
<input type="hidden" id="inAirline" value="<%= inAirline %>">
<input type="hidden" id="inTime" value="<%= inTime %>">
<input type="hidden" id="inArriveTime" value="<%= inArriveTime %>">
<input type="hidden" id="fromAirPort" value="<%= fromAirPort %>">
<input type="hidden" id="toAirPort" value="<%= toAirPort %>">
<input type="hidden" id="seat" value="<%= seat %>">
<input type="hidden" id="price" value="<%= price %>">
<input type="hidden" id="peopleCount" value="<%= peopleCount %>">
<input type="hidden" id="depDate" value="<%= depDate %>">
<input type="hidden" id="retDate" value="<%= retDate %>">


</body>
</html>

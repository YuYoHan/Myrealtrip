<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

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
                </div>
            </div>
            <div class="PaymentInfo-totalPriceWrapper">
                <span class="PaymentInfo-totalPriceText">총 결제 금액</span>
                <span class="PaymentInfo-totalPriceText">
					<span class="PaymentInfo-totalPrice">${price}</span>

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
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm c_h">여행자 약관 동의 (필수)</input>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm c_h">개인정보 제공 동의 (필수)</input>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm c_h">개인정보 수집 및 이용 동의(필수)</input>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <input type="checkbox" aria-hidden="true" class="term-defaultCheckTerm">특가 항공권 및 할인 혜택 안내 동의 (선택)</input>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
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
<%--			<a style="width: 100%;"--%>
<%--               href="${cp}/pay/airPayment.pm?dateFilter=${param.datefilter}&airLine=${param.airline}&airNum=${param.airnum}&dep=${param.dep}&arr=${param.arr}&price=${param.price}&userEmail=${loginUser.useremail}">--%>
<%--			--%>
<%--			</a>--%>
                <button type="button" class="PurchaseButton-button css-jgs6n" id="paymentButton">
   					<span class="css-1s4v6ia" id="payment">${price} 결제하기</span>
   				</button>
		</span>
    </div>
</div>
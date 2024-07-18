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
                                <span aria-hidden="true" class="term-defaultCheckTerm">여행자 약관 동의 (필수)</span>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <span aria-hidden="true" class="term-defaultCheckTerm">개인정보 제공 동의 (필수)</span>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <span aria-hidden="true" class="term-defaultCheckTerm">개인정보 수집 및 이용 동의(필수)</span>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                            <div class="required-term">
                                <span aria-hidden="true" class="term-defaultCheckTerm">특가 항공권 및 할인 혜택 안내 동의 (선택)</span>
                                <img class="css-xqn21t"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg">
                            </div>
                        </div>
                        <strong class="Allterms-defaultCheckAllTerm">위 약관을 확인하였으며, 회원 본인은 약관 및 결제에 동의합니다.</strong>
                    </div>
                </div>
                <div class="PolicyForm-notice">
                    <img class="css-1fc8vz0"
                         src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgyMFYyMEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzQ5NTA1NiIgc3Ryb2tlLXdpZHRoPSIxLjI1IiBkPSJNMTAgLjYyNWMtMi41ODkgMC00LjkzMiAxLjA1LTYuNjMgMi43NDZDMS42NzUgNS4wNjguNjI2IDcuNDExLjYyNiAxMGMwIDIuNTg5IDEuMDUgNC45MzIgMi43NDYgNi42MjkgMS42OTcgMS42OTcgNC4wNCAyLjc0NiA2LjYyOSAyLjc0NiAyLjU4OSAwIDQuOTMyLTEuMDUgNi42My0yLjc0NiAxLjY5Ni0xLjY5NyAyLjc0NS00LjA0IDIuNzQ1LTYuNjI5IDAtMi41ODktMS4wNS00LjkzMi0yLjc0Ni02LjYyOUMxNC45MzIgMS42NzQgMTIuNTkuNjI1IDEwIC42MjV6Ii8+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2Utd2lkdGg9IjEuMjUiIGQ9Ik0xMC40MTcgMTQuNTE1TDEwLjQxNyA4LjQ4MSA4LjI5MSA4LjQ4MU03LjYyNiAxNC45NTlMMTMuMTMzIDE0Ljk1OSIvPgogICAgICAgIDxwYXRoIGZpbGw9IiM0OTUwNTYiIGQ9Ik0xMS4wMyA1LjcxNmMwIC41MTMtLjQxNy45MjgtLjkzNC45MjgtLjUxNiAwLS45MzQtLjQxNS0uOTM0LS45MjggMC0uNTE0LjQxOC0uOTI5LjkzNC0uOTI5LjUxNyAwIC45MzUuNDE1LjkzNS45Mjl6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=">
                    <div class="css-liyoj2o">
                        <div class="css-5sumbj">이런 경우 현장 결제가 필요할 수 있어요.</div>
                        <div class="css-1kx9bws">기준 인원 초과, 바베큐 시설 이용 등은 현장에서 추가 비용이 청구될 수 있습니다.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="PurchaseButton-buttonWrapper">
		<span role="button" class="css-w0pi5v">
			<a style="width: 100%;"
               href="${cp}/pay/airPayment.pm?dateFilter=${param.datefilter}&airLine=${param.airline}&airNum=${param.airnum}&dep=${param.dep}&arr=${param.arr}&price=${param.price}&userEmail=${loginUser.useremail}">
				<button type="button" class="PurchaseButton-button css-jgs6n">
					<span class="css-1s4v6ia">${price} 결제하기</span>
				</button>
			</a>
		</span>
    </div>
</div>
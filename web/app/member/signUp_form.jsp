<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- 이메일 회원가입을 클릭하면 이곳으로 와진다.-->
    <title>마이리얼트립 :: 회원가입</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/pointContainer.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/member/sign.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/member/signUp.css">
</head>
<body>
<!-- header 시작-->
<%@ include file="../global/header.jsp" %>
<!-- main 시작-->
<div class="EmailSignUp-component">
    <div class="EmailSignUp_container">
        <form action="${cp}/member/signUpSuccess.us" method="post" name="joinForm">
            <!-- -->
            <input type="hidden" name="EmailSignUp_token"
                   value="rOJ2G4VWXb1EH6GONbpZM2UIHgOeu7EVHyMgHIZJ6pxpjy+bLKDmZQVtYDx7CcaFZJ4fYF/Kh0EkdVkj8PjMDg==">

            <div class="EmailSignUpInfo_container">
                <div class="EmailSignUpInfo_row">
                    <label class="EmailTextField_label" for="userName">
                        <p>이름 *</p>
                        <div class>
                            <input type="text" class="EmailTextField_input EmailTextfiled_medium gr" id="userName"
                                   name="userName" placeholder="이름을입력해주세요" onfocus="this.placeholder=''"
                                   onblur="this.placeholder='이름을입력해주세요'" value>
                        </div>
                        <span class="nameCheck hidden"></span>
                    </label>
                </div>
                <div class="EmailSignUpInfo_row">
                    <label class="EmailTextField_label" for="userEmail">
                        <p>이메일 *</p>
                        <div class>
                            <input type="text" class="EmailTextField_input EmailTextfiled_medium gr" id="userEmail"
                                   name="userEmail" placeholder="ID@example.com" onfocus="this.placeholder=''"
                                   onblur="this.placeholder='ID@example.com'">
                        </div>
                        <span class="emailCheck hidden"></span>
                    </label>
                </div>
                <div class="EmailSignUpInfo_row">
                    <label class="EmailTextField_label" for="userPassword">
                        <p>비밀번호 *</p>
                        <div class>
                            <input type="password" class="EmailTextField_input EmailTextfiled_medium gr"
                                   id="userPassword" name="userPassword" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자"
                                   onfocus="this.placeholder=''" onblur="this.placeholder='영문, 숫자, 특수문자 2가지 조합 6~15자'">
                        </div>
                        <span class="pwCheck hidden"></span>
                    </label>
                </div>
                <div class="EmailSignUpInfo_row">
                    <label class="EmailTextField_label" for="userPasswordConfirm">
                        <p>비밀번호 확인</p>
                        <div class>
                            <input type="password" class="EmailTextField_input EmailTextfiled_medium gr"
                                   id="userPasswordConfirm" name="user[password_confirmation]"
                                   placeholder="비밀번호를 한번 더 입력해주세요." onfocus="this.placeholder=''"
                                   onblur="this.placeholder='비밀번호를 한번 더 입력해주세요.'">
                        </div>
                        <span class="pwChecked hidden"></span>
                    </label>
                </div>
                <div class="EmailSignUpInfo_row">
                    <label class="EmailTextField_label" for="postCode">
                        <p>주소 *</p>
                    </label>
                    <div>
                        <input type="text" id="postCode" placeholder="우편번호"
                               class="EmailTextField_input EmailTextfiled_medium gr"
                               name="postCode" onfocus="this.placeholder=''" onblur="this.placeholder='우편번호'">
                        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
                    </div>

                    <label class="EmailTextField_label" for="address">
                        <p>주소 *</p>
                    </label>
                    <div>
                        <input type="text" id="address" placeholder="주소"
                               class="EmailTextField_input EmailTextfiled_medium gr"
                               name="address" onfocus="this.placeholder=''" onblur="this.placeholder='주소'">
                    </div>

                    <label class="EmailTextField_label" for="detailAddress">
                        <p>상세주소 *</p>
                    </label>
                    <div>
                        <input type="text" id="detailAddress" placeholder="상세주소"
                               class="EmailTextField_input EmailTextfiled_medium gr"
                               name="detailAddress" onfocus="this.placeholder=''" onblur="this.placeholder='상세주소'">
                    </div>

                    <label class="EmailTextField_label" for="extraAddress">
                        <p>참고항목</p>
                    </label>
                    <div>
                        <input type="text" id="extraAddress" placeholder="참고항목"
                               class="EmailTextField_input EmailTextfiled_medium gr"
                               name="extraAddress" onfocus="this.placeholder=''" onblur="this.placeholder='참고항목'">
                    </div>
                </div>
                <div class="EmailSignUpAgree_container">
                    <label class="Checkbox_label Checkbox_medium" for="agreeAll">
                        <input type="checkbox" id="agreeAll" class="Checkbox_input Checkbox_medium" name="agreeAll"
                               value="true">
                        <strong>전체 약관 동의</strong>
                    </label>
                    <ul class="SignUpAgree_agrees">
                        <li class="SignUpAgree_row">
                            <div class="SignUpAgree_item">
                                <label class="Checkbox_label Checkbox_medium" for="agree_agreement">
                                    <input type="checkbox" id="agree_agreement" name="check1"
                                           class="Checkbox_input Checkbox_medium c_h" for="agree_agreement"
                                           value="true">
                                </label>
                                <div class="SignUpAgree_label">
                                    <div class="TermPopup_wrapper">
                                        <div role="button" tabindex="0">
                                            회원 가입 및 운영약관 동의 (필수)
                                            <img class="TermPopup_arrow"
                                                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
                                                 alt="arrow">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="SignUpAgree_row">
                            <div class="SignUpAgree_item">
                                <label class="Checkbox_label Checkbox_medium" for="agree_privacyUse">
                                    <input type="checkbox" id="agree_privacyUse" name="check2"
                                           class="Checkbox_input Checkbox_medium c_h" name="agree_privacyUse"
                                           value="true">
                                </label>
                                <div class="SignUpAgree_label">
                                    <div class="TermPopup_wrapper">
                                        <div role="button" tabindex="0">
                                            개인정보 수집 및 이용 (필수)
                                            <img class="TermPopup_arrow"
                                                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
                                                 alt="arrow">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="SignUpAgree_row">
                            <div class="SignUpAgree_item">
                                <label class="Checkbox_label Checkbox_medium" for="agree_location">
                                    <input type="checkbox" id="agree_location" name="check3"
                                           class="Checkbox_input Checkbox_medium" name="user[location_data_agree]"
                                           value="true">
                                </label>
                                <div class="SignUpAgree_label">
                                    <div class="TermPopup_wrapper">
                                        <div role="button" tabindex="0">
                                            위치정보 이용약관(선택)
                                            <img class="TermPopup_arrow"
                                                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
                                                 alt="arrow">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="SignUpAgree_row">
                            <div class="SignUpAgree_item">
                                <label class="Checkbox_label Checkbox_medium" for="agree_marketing">
                                    <input type="checkbox" id="agree_marketing" name="check4"
                                           class="Checkbox_input Checkbox_medium" name="agree_marketing" value="true">
                                </label>
                                <div class="SignUpAgree_label">
                                    <div class="TermPopup_wrapper">
                                        <div role="button" tabindex="0">
                                            특가 항공권 및 할인 혜택 안내 동의 (선택)
                                            <img class="TermPopup_arrow"
                                                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
                                                 alt="arrow">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="SignUpAgree_subcription">프로필 > 알림 설정에서 변경 가능</p>
                            <div class="SignUpAgree_subscriptions">
                                <label>
                                    <input type="checkbox" name="user[subscription_settings][email]" value="true">
                                </label>
                                <label>
                                    <input type="checkbox" name="user[subscription_settings][sms]" value="true">
                                </label>
                                <label>
                                    <input type="checkbox" name="user[subscription_settings][push]" value="true">
                                </label>
                            </div>
                        </li>
                    </ul>
                    <ul class="SignUpAgree_notices">
                        <li class="SignUpAgree_notice">*선택 항목을 동의하지 않아도 서비스를 이용하실 수 있습니다.</li>
                        <li class="SignUpAgree_notice">*회원 가입 시 본인이 만 14세 이상임에 동의하게 됩니다.</li>
                    </ul>
                </div>
                <button type="submit" name="buttonCheck"
                        class="Button_button Button_primary Button_large Button_block undefind" disabled>회원가입
                </button>
            </div>
        </form>
    </div>
</div>
<!-- main 끝 -->
<!-- footer 시작 -->
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="../global/footer.jsp" %>
    </footer>
</div>
<!-- footer 끝 -->
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="../../js/sign_up_form.js"></script>
<script src="../../js/user.js"></script>
<script src="../../js/myInfo.js"></script>
</html>

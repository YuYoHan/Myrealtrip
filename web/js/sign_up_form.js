// 이메일 유효성 검사
const userEmail = document.getElementById("userEmail");
const emailReg =  /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const emailCheck = document.getElementsByClassName("emailCheck");
userEmail.oninput = () => {
    //email 유효성 검사는 여기서
    if (emailReg.test(userEmail.value)) {
        // 이메일 주소가 맞다는 표시를 숨김
        emailCheck[0].classList.add("hidden");
        // 입력 필드를 활성화 상태로 변경
        userEmail.classList.remove("disabled");
        // 부모 요소의 스타일을 변경하여 입력이 성공적임을 시각적으로 표시
        $("#userEmail").parent('div').addClass("EmailTextField_success");
        //console.log("성공");
    } else {
        emailCheck[0].classList.remove("hidden");
        emailCheck[0].textContent = "이메일 주소가 맞나요?";
        userEmail.classList.add("disabled");
        $("#userEmail").parent('div').removeClass("EmailTextField_success");
        if (userEmail.value == "") {
            emailCheck[0].textContent = "꼭 필요해요";
            userEmail.classList.add("disabled");
            $("#userEmail").parent('div').removeClass("EmailTextField_success");
        }
    }
};


// 이름 유효성 검사
const userName = document.getElementById("userName");
const nameCheck = document.getElementsByClassName("nameCheck");
userName.oninput = () => {
    if (userName.value.trim().length >= 2 && /^[가-힣]+$/.test(userName.value.trim())) {
        nameCheck[0].classList.add("hidden");
        nameCheck[0].textContent = "";
        userName.classList.remove("disabled");
        $("#userName").parent('div').addClass("EmailTextField_success");
    } else {
        nameCheck[0].classList.remove("hidden");
        nameCheck[0].textContent = "이름은 두 글자 이상 입력해주세요.";
        userName.classList.add("disabled");
        $("#userName").parent('div').removeClass("EmailTextField_success");

        if (document.getElementById("userName").value == "") {
            nameCheck[0].textContent = "이름은 필수입력입니다.";
            userName.classList.add("disabled");
            $("#userName").parent('div').removeClass("EmailTextField_success");
        }
    }
}
//비밀번호 유효성
const userPassword = document.getElementById("userPassword");
const pwCheck = document.getElementsByClassName("pwCheck");
userPassword.oninput = () => {
    // 알파벳 대소문자, 숫자, 특수문자 하나 이상이 포함된 문자열
    let reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
    if (reg.test(userPassword.value)) {
        pwCheck[0].classList.add("hidden");
        pwCheck[0].textContent = "";
        userPassword.classList.remove("disabled");
        $("#userPassword").parent('div').addClass("EmailTextField_success");
    } else {
        pwCheck[0].classList.remove("hidden");
        pwCheck[0].textContent = "비밀번호가 너무 짧습니다.(6자 이상 15자 이하)";
        userPassword.classList.add("disabled");
        $("#userPassword").parent('div').removeClass("EmailTextField_success");
        if (userPassword.value == "") {
            pwCheck[0].textContent = "비밀번호를 입력해주세요.";
            userPassword.classList.add("disabled");
            $("#userPassword").parent('div').removeClass("EmailTextField_success");
        }
    }
}
//비밀번호 체크 유효성
const userPasswordConfirm = document.getElementById("userPasswordConfirm");
const pwChecked = document.getElementsByClassName("pwChecked");
userPasswordConfirm.oninput = () => {
    if (document.getElementById("userPasswordConfirm").value == userPassword.value) {
        pwChecked[0].classList.add("hidden");
        pwChecked[0].textContent = "";
        userPasswordConfirm.classList.remove("disabled");
        $("#userPasswordConfirm").parent('div').addClass("EmailTextField_success");
    } else {
        pwChecked[0].classList.remove("hidden");
        pwChecked[0].textContent = "비밀번호가 일치하지 않습니다.";
        userPasswordConfirm.classList.add("disabled");
        $("#userPasswordConfirm").parent('div').removeClass("EmailTextField_success");
        if (userPasswordConfirm.value == "") {
            pwChecked[0].textContent = "비밀번호를 다시 한번 입력해주세요.";
            userPasswordConfirm.classList.add("disabled");
            $("#userPasswordConfirm").parent('div').removeClass("EmailTextField_success");
        }
    }
}

// 주소
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;

            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}


/*JQuery*/
// 전체 약관 동의
$(document).ready(function () {
    $("#agreeAll").click(function () {
        // #agreeAll 체크 박스를 클릭하면, .Checkbox_input 클래스를 가진 모든 체크 박스의 상태를
        // 전체 선택 버튼의 상태에 따라 활성화 또는 비활성화합니다.
        if ($("#agreeAll").is(":checked")) $(".Checkbox_input").prop("checked", true);
        else $(".Checkbox_input").prop("checked", false);
    });

    // #agreeAll 체크 박스를 클릭하면, .undefind 클래스를 가진 회원가입 버튼의
    // disabled 속성을 전체 선택 버튼의 상태에 따라 활성화 또는 비활성화
    $("#agreeAll").click(function () {
        if ($("#agreeAll").is(":checked")) $(".undefind").prop("disabled", false);
        else $(".undefind").prop("disabled", true);
    });

    // .Checkbox_input 클래스를 가진 개별 체크 박스를 클릭하면, 전체 체크 박스 (#agreeAll)의 상태를 업데이트
    // 모든 .Checkbox_input 체크 박스가 선택된 경우 전체 선택 버튼을 체크 상태로 변경하고, 그렇지 않은 경우 체크 해제 상태로 변경
    $(".Checkbox_input").click(function () {
        const total = $(".Checkbox_input").length;
        const checked = $(".Checkbox_input:checked").length;
        if (total != checked) $("#agreeAll").prop("checked", false);
        else $("#agreeAll").prop("checked", true);
    });

    // .c_h 클래스를 가진 필수 항목 체크 박스를 클릭하면,
    // 모든 필수 항목이 체크된 경우에만 회원가입 버튼을 활성화하고, 그렇지 않은 경우 비활성화
    $(".c_h").click(function () {
        //.c_h의 갯수랑 체크된 항목의 갯수와 같다면 모두 선택한거임. 선택빼고, 필수에는 .c_h 클래스이름 지정.
        const tott = $(".c_h").length;
        const check = $(".c_h:checked").length;
        //undefind는 회원가입 버튼의 클래스. 필수 선택을 다하면 disabled를  false로 하였다.
        if (tott == check) $(".undefind").prop("disabled", false);
        // 그 외는 버튼을 비활성화
        else $(".undefind").prop("disabled", true);
    });
});
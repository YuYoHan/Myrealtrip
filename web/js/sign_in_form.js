const userEmail = document.getElementById("userEmail");
const emailReg =
    /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
const emailCheck = document.getElementsByClassName("emailCheck");
userEmail.oninput = () => {
    //email 유효성 검사는 여기서
    if (emailReg.test(userEmail.value)) {
        emailCheck[0].classList.add("hidden");
        userEmail.classList.remove("disabled");
        $("#userEmail").parent('div').addClass("EmailTextField_sucess");
        //console.log("성공");
    } else {
        emailCheck[0].classList.remove("hidden");
        emailCheck[0].textContent = "이메일 주소가 맞나요?";
        userEmail.classList.add("disabled");
        $("#userEmail").parent('div').removeClass("EmailTextField_sucess");
        if (userEmail.value == "") {
            emailCheck[0].textContent = "꼭 필요해요";
            userEmail.classList.add("disabled");
            $("#userEmail").parent('div').removeClass("EmailTextField_sucess");
        }
    }

};
const userPassword = document.getElementById("userPassword");
const pwCheck = document.getElementsByClassName("pwCheck");
const button = document.getElementsByClassName("Button__button");
userPassword.oninput = () => {
    let reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
    if (reg.test(userPassword.value)) {
        pwCheck[0].classList.add("hidden");
        pwCheck[0].textContent = "";
        userPassword.classList.remove("disabled");
        $("#userPassword").parent('div').addClass("EmailTextField_sucess");
    } else {
        pwCheck[0].classList.remove("hidden");
        pwCheck[0].textContent = "비밀번호가 너무 짧습니다.(6자 이상 15자 이하)";
        userPassword.classList.add("disabled");
        $("#userPassword").parent('div').removeClass("EmailTextField_sucess");
        if (userPassword.value == "") {
            pwCheck[0].textContent = "비밀번호를 입력해주세요.";
            userPassword.classList.add("disabled");
            $("#userPassword").parent('div').removeClass("EmailTextField_sucess");
        }
    }
    if (userPassword.value.length > 0 && userEmail.value.length > 0) {
        button[0].disabled = false;
    }
}









const userEmail = document.getElementById("userEmail");
const emailReg =
    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const emailCheck = document.getElementsByClassName("emailCheck");
userEmail.oninput = () => {
    //email 유효성 검사는 여기서
    if (emailReg.test(userEmail.value)) {
        emailCheck[0].classList.add("hidden");
        userEmail.classList.remove("disabled");
        $("#userEmail").parent('div').addClass("EmailTextField_success");
        //console.log("성공");
    } else {
        emailCheck[0].classList.remove("hidden");
        emailCheck[0].textContent = "이메일이 맞나요?";
        userEmail.classList.add("disabled");
        $("#userEmail").parent('div').removeClass("EmailTextField_success");
        if (userEmail.value == "") {
            emailCheck[0].textContent = "꼭 필요해요";
            userEmail.classList.add("disabled");
            $("#userEmail").parent('div').removeClass("EmailTextField_success");
        }
    }

};
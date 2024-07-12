//비밀번호 유효성
const userPassword = document.getElementById("userPassword");
const pwCheck = document.getElementsByClassName("pwCheck");
const btn = document.getElementsByClassName('changePw-btn')[0];
let pwFlag = false;
let pwCfFlag = false;
	
userPassword.oninput = () =>{
	let reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
	if(reg.test(userPassword.value)){
		pwCheck[0].classList.add("hidden");
		pwCheck[0].textContent = "";
		userPassword.classList.remove("disabled");
		$("#userPassword").parent('div').addClass("EmailTextField_sucess");
		pwFlag = true;
	}
	else{
		pwCheck[0].classList.remove("hidden");
		pwCheck[0].textContent = "비밀번호가 너무 짧습니다.(6자 이상 15자 이하)";
		userPassword.classList.add("disabled");
		$("#userPassword").parent('div').removeClass("EmailTextField_sucess");
		pwFlag = false;
		btn.setAttribute('disabled','disabled')
	if(userPassword.value == ""){
		pwCheck[0].textContent = "비밀번호를 입력해주세요.";
		userPassword.classList.add("disabled");
		$("#userPassword").parent('div').removeClass("EmailTextField_sucess");
		pwFlag = false;
		btn.setAttribute('disabled','disabled')
		}
	}
	if(pwFlag && pwCfFlag){
		btn.removeAttribute('disabled');
	}
}

//비밀번호 체크 유효성
const userPasswordConfirm = document.getElementById("userPasswordConfirm");
const pwChecked = document.getElementsByClassName("pwChecked");
userPasswordConfirm.oninput=()=>{
	if(document.getElementById("userPasswordConfirm").value == userPassword.value){
		pwChecked[0].classList.add("hidden");
		pwChecked[0].textContent = "";
		userPasswordConfirm.classList.remove("disabled");
		$("#userPasswordConfirm").parent('div').addClass("EmailTextField_sucess");
		pwCfFlag = true;
	}
	else{
		pwChecked[0].classList.remove("hidden");
		pwChecked[0].textContent = "비밀번호가 일치하지 않습니다.";
		userPasswordConfirm.classList.add("disabled");
		$("#userPasswordConfirm").parent('div').removeClass("EmailTextField_sucess");
		pwCfFlag = false;
		btn.setAttribute('disabled','disabled')
	if(userPasswordConfirm.value == ""){
		pwChecked[0].textContent = "비밀번호를 다시 한번 입력해주세요.";
		userPasswordConfirm.classList.add("disabled");
		$("#userPasswordConfirm").parent('div').removeClass("EmailTextField_sucess");
		pwCfFlag = false;
		btn.setAttribute('disabled','disabled')
		}
	}
	if(pwFlag && pwCfFlag){
		btn.removeAttribute('disabled');
	}
}


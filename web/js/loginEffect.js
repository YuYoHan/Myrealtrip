// 요소에 마우스를 올리면 첫번째 이미지는 hidden이 되고, 마우스가 벗어나면 두번째 이미지가 hidden이 되어야 한다.
const iconImgWrap = document.getElementsByClassName("icon-wrapper");

// 아이콘 래퍼 순회
for (const icon of iconImgWrap) {
    // 클릭시 logged 함수 출력
    icon.onclick = function (e) {
        // e.currentTarget은 이벤트가 발생한 요소(icon)를 가리킵니다.
        // children[2]는 icon 요소의 세 번째 자식 요소를 가리키며, 그 요소의 value 속성 값을 가져옵니다.
        logged(e.currentTarget.children[2].value);
    };
    // 첫 번째 자식 요소(기본 아이콘 이미지)를, icon.children[1]는 두 번째 자식 요소(호버 시 표시될 아이콘 이미지)를 참조
    const iconImg = icon.children[0];
    const iconImgHover = icon.children[1];
    iconImgHover.classList.add("hidden");
    // mouseenter 이벤트가 발생하면(마우스가 icon 요소 위로 올라가면), 기본 아이콘 이미지를 숨기고 호버 이미지를 표시
    icon.addEventListener("mouseenter", () => {
        iconImg.classList.add("hidden");
        iconImgHover.classList.remove("hidden");
    });
    // mouseleave 이벤트가 발생하면(마우스가 icon 요소에서 벗어나면), 호버 이미지를 숨기고 기본 아이콘 이미지를 다시 표시
    icon.addEventListener("mouseleave", () => {
        iconImgHover.classList.add("hidden");
        iconImg.classList.remove("hidden");
    });
}

const logged = (loginMethod) => {
    //로그인 메소드에 따라 case를 다르게 하여 접근할 것임.
    let url = "";
    let newUrl = "";
    switch (loginMethod) {
        case "이메일 회원가입":
            //이메일 회원가입을 요청하는 url
            url = location.href
            //원본은 그대로, 새로운 문자열을 반환.
            newUrl = url.replace("/member/signUp.us", "/app/member/signUp_form.jsp");
            //console.log(newUrl);
            location.href = newUrl;
            console.log("이메일로 회원가입 합니다.");
            break;
        case "이메일 로그인":
            //이메일 로그인을 요청하는 url
            url = location.href
            //원본은 그대로, 새로운 문자열을 반환.
            newUrl = url.replace("/member/signIn.us", "/app/member/signIn_form.jsp");
            //console.log(newUrl);
            location.href = newUrl;
            break;
        case "페이스북":
            //페이스북 회원가입을 요청하는 url
            console.log("페이스북으로 로그인/회원가입 합니다.");
            fcebookLogin();
            break;
        case "네이버":
            //네이버 회원가입을 요청하는 url
            console.log("네이버로 로그인/회원가입 합니다.");
            naverLogin();
            break;
    }
};

Kakao.init('edfb9bf86c6edc300b3431b379972fda'); //발급받은 키 중 javascript키를 사용해준다.
//console.log(); // sdk초기화여부판단
//카카오로그인
//Kakao.isInitialized();
function kakaoLogin() {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response);

                    //sessionStorage.setItem("loginUser", response.kakao_account.email);
                    location.href = "http://localhost:8080/app/mainPage/mainPage.jsp?loginUser=" + response.kakao_account.email + "&userName=" + response.properties.nickname;
                },
                fail: function (error) {
                    console.log(error)
                },
            })
        },
        fail: function (error) {
            console.log(error)
        },
    })
}

//카카오 로그아웃
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
            },
            fail: function (error) {
                console.log(error)
            },
        })
        Kakao.Auth.setAccessToken(undefined)
    }
}

<!-- 네이버 로그인-->
let naverLogin = new naver.LoginWithNaverId({
    clientId: "N3BcmuWcCOcY7s8q0KUa",
    callbackUrl: "http://localhost:8080/app/mainPage/mainPage.jsp",
    isPopup: false, // 팝업 형태로 띄울 것인지 설정
    loginButton: {color: "green", type: 3, height: 60} // 로그인 버튼의 스타일 설정
});
naverLogin.init();

function naverLogin() {
    naverLogin.getLoginStatus(function (status) {
        if (status) {
            let email = naverLogin.user.getEmail();
            let name = naverLogin.user.getName();
            // 로그인 성공 시 필요한 동작 수행
            location.href = "http://localhost:8080/app/mainPage/mainPage.jsp?loginUser=" + email + "&userName=" + name;
        } else {
            console.log("로그인 실패");
        }
    });
}

<!-- 페이스북 로그인-->
window.fbAsyncInit = function () {
    FB.init({
        appId: 'YOUR_APP_ID',
        cookie: true,
        xfbml: true,
        version: 'v10.0'
    });
};

function fcebookLogin() {
    FB.login(function (response) {
        if (response.authResponse) {
            FB.api('/me', {fields: 'name, email'}, function (response) {
                let email = response.email;
                let name = response.name;
                // 로그인 성공 시 필요한 동작 수행
                location.href = "http://localhost:8080/app/mainPage/mainPage.jsp?loginUser=" + email + "&userName=" + name;
            });
        } else {
            console.log("로그인 실패");
        }
    }, {scope: 'public_profile, email'});
}

function sendSocialInfo(email, name) {

}
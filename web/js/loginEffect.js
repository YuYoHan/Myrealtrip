// 요소에 마우스를 올리면 첫번째 이미지는 hidden이 되고, 마우스가 벗어나면 두번째 이미지가 hidden이 되어야 한다.
const iconImgWrap = document.getElementsByClassName("icon-wrapper");

for (const icon of iconImgWrap) {
    icon.onclick = function (e) {
        //console.log(e.currentTarget.children[2].value);
        logged(e.currentTarget.children[2].value);
    };
    const iconImg = icon.children[0];
    const iconImgHover = icon.children[1];
    iconImgHover.classList.add("hidden");
    icon.addEventListener("mouseenter", () => {
        iconImg.classList.add("hidden");
        iconImgHover.classList.remove("hidden");
    });
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
            url = location.href //http://localhost:8080/myrealtrip/user/signUp.us
            //원본은 그대로, 새로운 문자열을 반환.
            newUrl = url.replace("/signUp.us", "/app/member/signUp_form.jsp");
            //console.log(newUrl);
            location.href = newUrl;
            console.log("이메일로 회원가입 합니다.");
            break;
        case "이메일 로그인":
            //이메일 로그인을 요청하는 url
            url = location.href //http://localhost:8080/myrealtrip/user/signIn.us
            //원본은 그대로, 새로운 문자열을 반환.
            newUrl = url.replace("/signIn.us", "/app/member/signIn_form.jsp");
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
                    location.href = "http://localhost:8080/myrealtrip/index.jsp?loginUser=" + response.kakao_account.email + "&username=" + response.properties.nickname;
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

//console.log(sessionStorage.getItem("loginUser"));
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
    callbackUrl: "http://localhost:8080/myrealtrip/index.jsp",
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
            location.href = "http://localhost:8080/myrealtrip/index.jsp?loginUser=" + email + "&username=" + name;
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
                location.href = "http://localhost:8080/myrealtrip/index.jsp?loginUser=" + email + "&username=" + name;
            });
        } else {
            console.log("로그인 실패");
        }
    }, {scope: 'public_profile, email'});
}


// window.Kakao.init('edfb9bf86c6edc300b3431b379972fda'); // javascript 앱키 적는 곳
//
// function kakaoLogin() {
//     window.Kakao.Auth.login({
//         scope: 'profile_nickname, profile_image, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
//         success: function(response) {
//             console.log(response) // 로그인 성공하면 받아오는 데이터
//             window.Kakao.API.request({ // 사용자 정보 가져오기
//                 url: '/v2/user/me',
//                 success: (res) => {
//                     const kakao_account = res.kakao_account;
//                     console.log(kakao_account)
//                 }
//             });
//             // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
//         },
//         fail: function(error) {
//             console.log(error);
//         }
//     });
// }
//
// //console.log(sessionStorage.getItem("loginUser"));
// //카카오 로그아웃
// function kakaoLogout() {
//     if (Kakao.Auth.getAccessToken()) {
//         Kakao.API.request({
//             url: '/v1/user/unlink',
//             success: function (response) {
//                 console.log(response)
//             },
//             fail: function (error) {
//                 console.log(error)
//             },
//         })
//         Kakao.Auth.setAccessToken(undefined)
//     }
// }

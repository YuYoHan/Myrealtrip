window.onload = function () {
    // 구매자 정보
    let emailElement = document.getElementById('userEmail');
    let nameElement = document.getElementById('userName');
    let payElement = document.getElementById('payment');

    // 이메일 주소 가져오기
    let email = emailElement.innerText || emailElement.textContent;
    console.log(email)

    // 이름 가져오기
    let name = nameElement.innerText || nameElement.textContent;
    console.log(name)

    // 결제 금액 가져오기 (숫자 부분만 추출)
    let payText = payElement.innerText || payElement.textContent;
    let price = parseInt(payText.match(/\d+/)[0], 10);
    console.log(price)

    // 결제 버튼에 이벤트 리스너 추가
    document.getElementById("payment").addEventListener("click", function () {
        kakaoPay(email, name, price);
    });
};

let IMP = window.IMP;

let today = new Date();
let hours = today.getHours(); // 시
let minutes = today.getMinutes(); // 분
let seconds = today.getSeconds(); // 초
let milliseconds = today.getMilliseconds();

let makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;

function kakaoPay(userEmail, userName, pay, makeMerchantUid) {
    if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기

        IMP.init("imp81523768"); // 가맹점 식별코드
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
            pay_method: 'card', // 결제 방식
            merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
            name: '항공권 결제', // 제품명
            amount: pay, // 가격
            //구매자 정보 ↓
            buyer_email: userEmail,
            buyer_name: userName,
            // buyer_tel : '010-1234-5678',
            // buyer_addr : '서울특별시 강남구 삼성동',
            // buyer_postcode : '123-456'
        }, async function (rsp) { // callback
            if (rsp.success) { //결제 성공시
                console.log(rsp);
                // 결제 성공시
                location.href = `/pay/airPayment.pm?dateFilter=${param.datefilter}&airLine=${param.airline}&airNum=${param.airnum}&dep=${param.dep}&arr=${param.arr}&price=${param.price}&userEmail=${userEmail}`;

            } else if (!rsp.success) { // 결제 실패시
                alert('결제 실패했습니다.');
            }
        });
    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
        return false;
    }
}



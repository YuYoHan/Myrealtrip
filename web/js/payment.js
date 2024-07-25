$(document).ready(function() {
    // 라디오 버튼이 변경될 때마다 결제 버튼 상태 업데이트
    $("input[name='payment']").change(function() {
        updatePaymentButtonState();
    });

    // 체크박스가 변경될 때마다 결제 버튼 상태 업데이트
    $(".term-defaultCheckTerm").change(function() {
        updatePaymentButtonState();
    });

    // 초기 로드 시 한 번 결제 버튼 상태 업데이트
    updatePaymentButtonState();

    // 결제 버튼 클릭 시 동작
    $("#paymentButton").click(function() {
        let getKakao = document.getElementById('KAKAO');
        if (getKakao.checked) {
            let emailElement = document.getElementById('userEmail');
            let nameElement = document.getElementById('userName');
            let payElement = document.getElementById('payment');

            // 이메일 주소 가져오기
            let email = emailElement.innerText || emailElement.textContent;
            console.log("이메일 : " + email);

            // 이름 가져오기
            let name = nameElement.innerText || nameElement.textContent;
            console.log("이름 : " + name);

            // 결제 금액 가져오기 (숫자 부분만 추출)
            let payText = payElement.innerText || payElement.textContent;
            let price = parseInt(payText.replace(/[^0-9]/g, ''), 10);
            console.log("가격 : " + price);

            kakaoPay(email, name, price);
        }
    });
});

function updatePaymentButtonState() {
    const allRequiredChecked = $(".term-defaultCheckTerm:not(.c_h):checked").length === $(".term-defaultCheckTerm:not(.c_h)").length;
    const paymentMethodSelected = $("input[name='payment']:checked").length > 0;
    $("#paymentButton").prop("disabled", !(allRequiredChecked && paymentMethodSelected));
}

function kakaoPay(userEmail, userName, pay) {
    if (confirm("구매 하시겠습니까?")) {
        let IMP = window.IMP;
        IMP.init("imp81523768"); // 가맹점 식별코드
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
            pay_method: 'card', // 결제 방식
            merchant_uid: "IMP" + imp(), // 결제 고유 번호
            name: '결제', // 제품명
            amount: pay, // 가격
            buyer_email: userEmail, // 구매자 이메일
            buyer_name: userName, // 구매자 이름
        }, function (rsp) { // 콜백 함수
            if (rsp.success) { // 결제 성공 시
                console.log(rsp);
                alert('결제가 완료되었습니다.');
                window.location.href = `/pay/airPayment.pm`;
            } else { // 결제 실패 시
                alert('결제에 실패하였습니다.');
            }
        });
    } else {
        return false; // 구매 확인 알림창 취소 클릭 시 돌아가기
    }
}

function imp() {
    let today = new Date();
    let hours = today.getHours();
    let minutes = today.getMinutes();
    let seconds = today.getSeconds();
    let milliseconds = today.getMilliseconds();
    return `${hours}${minutes}${seconds}${milliseconds}`;
}

// 토스 결제
/*
    jsp에 아래 코드를 추가 후 tossPay() 함수를 연결해서 사용하세요.
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
*/

function tossPay(userEmail, userName, pay) {
    let now = new Date();
    let year = now.getFullYear();
    let month = now.getMonth() + 1; // getMonth()는 0부터 11까지 반환하므로 1을 더해줌
    let date = now.getDate();
    let hours = now.getHours();
    let minutes = now.getMinutes();
    let seconds = now.getSeconds();

    let IMP = window.IMP;
    IMP.init("imp10888263");

    IMP.request_pay(
        {
            pg: "uplus",
            pay_method: "card",
            merchant_uid: year + (("00"+month.toString()).slice(-2)) + date + "-" + hours + minutes+ seconds,
            name: "결제",
            amount: pay,
            buyer_email: userEmail,
            buyer_name: userName
        },
        function (response) {
            if (response.success) {
                console.log(response);
                alert("결제가 완료되었습니다.");
                location.replace("/");
            } else {
                alert("결제에 실패하였습니다.");
            }
        }
    );
}
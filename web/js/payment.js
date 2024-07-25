// 필수 약관 동의 및 결제 수단 선택 확인 후 결제 버튼 활성화
function updatePaymentButtonState() {
    const allRequiredChecked = $(".c_h:checked").length === $(".c_h").length;
    const paymentMethodSelected = $("input[name='payment']:checked").length > 0;
    $("#paymentButton").prop("disabled", !(allRequiredChecked && paymentMethodSelected));
}


document.addEventListener("DOMContentLoaded", function () {
    // 구매자 정보
    let emailElement = document.getElementById('userEmail');
    let nameElement = document.getElementById('userName');
    let payElement = document.getElementById('payment');

    let cp = "<%= request.getContextPath() %>";
    console.log('cp : ' + cp);
    let dateFilter = "<%= param.dateFilter %>";
    console.log('dateFilter : ' + dateFilter);
    let airLine = "<%= param.airLine %>";
    console.log('airLine : ' + airLine);
    let dep = "<%= param.dep %>";
    console.log('dep : ' + dep);
    let arr = "<%= param.arr %>";
    console.log('arr : ' + arr);
    let userEmail = "<%= loginUser.userEmail %>";
    console.log('userEmail : ' + userEmail);

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

    $(".term-defaultCheckTerm, input[name='payment']").on('change', function () {
        updatePaymentButtonState();
    })

    // 결제 버튼에 이벤트 리스너 추가
    document.getElementById("paymentButton").addEventListener("click", function () {
        // 어떤 결제인지 체크
        let getKakao = document.getElementById('KAKAO');
        console.log('결제 체크 : ' + getKakao);

        if (getKakao.checked) {
            kakaoPay(email, name, price, cp, dateFilter, airLine, dep, arr);
        }
    });


    let IMP = window.IMP;

    let today = new Date();
    let hours = today.getHours(); // 시
    let minutes = today.getMinutes(); // 분
    let seconds = today.getSeconds(); // 초
    let milliseconds = today.getMilliseconds();

    let makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;

    function kakaoPay(userEmail, userName, pay, makeMerchantUid, cp, dateFilter, airLine, dep, arr) {
        if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기

            IMP.init("imp81523768"); // 가맹점 식별코드
            IMP.request_pay({
                pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
                pay_method: 'card', // 결제 방식
                merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
                name: '결제', // 제품명
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
                    window.location.href = `${cp}/pay/airPayment.pm?dateFilter=${dateFilter}&airLine=${airLine}&dep=${dep}&arr=${arr}&price=${pay}&userEmail=${userEmail}`;
                } else if (!rsp.success) { // 결제 실패시
                    alert('결제 실패했습니다.');
                }
            });
        } else { // 구매 확인 알림창 취소 클릭시 돌아가기
            return false;
        }
    }
})



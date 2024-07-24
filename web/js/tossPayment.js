/*
    jsp에 아래 코드를 추가 후 toss_Pay() 함수를 연결해서 사용하세요.
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
*/


function toss_Pay() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1; // getMonth()는 0부터 11까지 반환하므로 1을 더해줌
    var date = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();

    let IMP = window.IMP;
    IMP.init("imp10888263");

    IMP.request_pay(
        {
            pg: "uplus",
            pay_method: "card",
            merchant_uid: year + (("00"+month.toString()).slice(-2)) + date + "-" + hours + minutes+ seconds,
            name: "마이리얼트립",
            amount: Math.floor(100 + Math.random() * 900)*10
        },
        function (response) {
            if (response.success) {
                alert("성공!");
                location.replace("/");
            } else {
                alert("실패: " + response.error_msg);
            }
        }
    );
}




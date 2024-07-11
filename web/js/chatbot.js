// 챗봇 기능을 위한 자바스크립트
// 즉시 실행 함수
(function () {
    const w = window;
    // 이미 ChannelIO 객체가 있는지 확인한 후, 두 번 로드되지 않도록 중복 로드를 방지
    if (w.ChannelIO) {
        return (window.console.error || window.console.log || function () {
        })('ChannelIO script included twice.');
    }

    // ch 함수는 받은 인자들을 ch.c 메서드에 전달
    const ch = function () {
        ch.c(arguments);
    };
    // ch.q 배열은 큐(Queue)로, ChannelIO 스크립트가 로드되기 전에 호출된 모든 메서드와 인자들을 저장
    ch.q = [];
    ch.c = function (args) {
        ch.q.push(args);
    };
    // ch 객체를 할당하여, 외부에서 ChannelIO 객체에 접근할 수 있도록 합니다.
    w.ChannelIO = ch;

    // 페이지가 로드된 후, ChannelIO 스크립트를 비동기적으로 로드하는 함수입니다.
    function load() {
        // ChannelIOInitialized 변수가 이미 설정되어 있으면 함수를 종료
        if (w.ChannelIOInitialized) {
            return;
        }
        w.ChannelIOInitialized = true;
        // 새로운 <script> 엘리먼트를 생성하고, src 속성을 통해 ChannelIO 스크립트 파일을 지정
        const s = document.createElement('script');
        s.type = 'text/javascript';
        // async 속성을 true로 설정하여 비동기적으로 스크립트를 로드
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        const x = document.getElementsByTagName('script')[0];
        // 생성한 스크립트 엘리먼트를 기존 스크립트 엘리먼트 앞에 삽입
        x.parentNode.insertBefore(s, x);
    }

    // 페이지가 이미 로드된 상태이면 즉시 load() 함수를 호출
    if (document.readyState === 'complete') {
        load();
        // IE8 이하 버전을 지원하기 위해 attachEvent 메서드를 사용하여 페이지 로드 시 load() 함수를 호출
    } else if (window.attachEvent) {
        window.attachEvent('onload', load);
    } else {
        window.addEventListener('DOMContentLoaded', load, false);
        window.addEventListener('load', load, false);
    }
})();
ChannelIO('boot', {
    "pluginKey": "ff174692-8838-4993-a003-213cc9810724"
});
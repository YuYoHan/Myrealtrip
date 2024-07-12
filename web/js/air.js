// JQuery
//  Mobiscroll의 전역 설정 옵션을 설정하는 메서드
// 모바일로 봤을 때 보여주는 최적화
$(function () {
    mobiscroll.setOptions({
        // Mobiscroll의 테마를 iOS 스타일로 설정
        theme: 'ios',
        // 테마의 변형(variant)을 'light'로 설정
        themeVariant: 'light'
    });

    // 특정 DOM 요소에 날짜 선택기를 초기화하는 메서드
    mobiscroll.datepicker('#demo-range-selection', {
        // 사용할 컨트롤을 지정
        // 달력만 사용
        controls: ['calendar'],
        // 날짜 선택기를 인라인
        display: 'inline',
        // 범위 선택 모드를 wizard로 설정
        // 이 의미는 사용자가 범위를 선택할 때 마법사 스타일의 인터페이스가 사용됨을 의미
        rangeSelectMode: 'wizard',
        // 범위 선택을 가능하게 함
        select: 'range',
        // 선택된 범위의 라벨을 표시함
        showRangeLabels: true
    });
})





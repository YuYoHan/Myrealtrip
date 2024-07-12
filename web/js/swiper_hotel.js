// hotel_swiper.jsp에 위치함
const swiper5 = new Swiper(".Cdn > .swiper", {
    // 슬라이드를 루프하여 반복
    loop: true,
    //  화면에 보여질 슬라이드의 개수는 2개
    slidesPerView: 2,
    // 한 번에 슬라이드 그룹을 하나씩 이동
    slidesPerGroup: 1,

    // 이지네이션 설정으로, bullets 형식의 페이징을 사용하며, 클릭 가능
    pagination: {
        el: ".swiper-pagination-bullets",
        type: 'bullets',
        clickable: true,
    },

    // 자동 재생 설정으로, 슬라이드가 자동으로 전환되는 간격은 5초
    autoplay: {
        delay: 5000,
    },
    // 이벤트 리스너를 설정하여, 슬라이드 변경 시 페이징에서 활성화 클래스를 제거
    on: {
        slideChange: function () {
            $('.swiper-pagination-bullets').removeClass('swiper-pagination-bullets-active');
        }
    },

});


const swiper6 = new Swiper(".Best > .swiper", {
    // 화면에 보여질 슬라이드의 개수는 7개
    slidesPerView: 7,
    // 한 번에 슬라이드 그룹을 하나씩 이동
    slidesPerGroup: 1,

    navigation: {
        // 다음 버튼 요소를 지정합니다. .hotelsugsoList-button-next 클래스를 가진 요소를 사용
        nextEl: ".hotelsugsoList-button-next",
        // 이전 버튼 요소를 지정합니다. hotelsugsoList-button-prev 클래스를 가진 요소를 사용
        prevEl: ".hotelsugsoList-button-prev",
    },
});

const swiper7 = new Swiper(".special > .swiper", {
    slidesPerView: 7,
    slidesPerGroup: 1,

    navigation: {
        nextEl: ".hotelspecialList-button-next",
        prevEl: ".hotelspecialList-button-prev",
    },
});


















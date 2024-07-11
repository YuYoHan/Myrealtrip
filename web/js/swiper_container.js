// mainHeader.jsp에 위치함
const swipermain = new Swiper(".swiper-container", {
    loop: false,
    slidesPerView: 4,
    slidesPerGroup: 4,
    navigation: {
        nextEl: ".main-button-next",
        prevEl: ".main-button-prev",
    },
});


const bestswiper = new Swiper(".best-swiper", {
    loop: false,
    slidesPerView: 4,
    slidesPerGroup: 4,
    navigation: {
        nextEl: ".main-button-next",
        prevEl: ".main-button-prev",
    },
});

// mainBanner에 위치함
const swiper2 = new Swiper(".swiper", {
    loop: false,
    slidesPerView: 1,
    centeredSlides: true,

    pagination: {
        el: ".mainbanner-pagination",
    },
    autoplay: {
        delay: 5000,
    },

    navigation: {
        nextEl: ".mainbanner-button-next",
        prevEl: ".mainbanner-button-prev",
    },

    scrollbar: {
        el: ".swiper-scrollbar",
    },
});

const swiper_city = new Swiper(".swiper-city", {
    slidesPerView: 6,
    slidesPerGroup: 6,
    spaceBetween: 10,

    navigation: {
        nextEl: ".Eperience-button-next",
        prevEl: ".Eperience-button-prev",
    },
});
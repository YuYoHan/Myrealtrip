// airBanner.jsp에 위치함
const swiper3 = new Swiper(".swiper", {
	  loop: true,
	  slidesPerView: 2,
	  slidesPerGroup: 2,
	  spaceBetween : 20,
	  

	  pagination: {
	    el: ".mainbanner-pagination",
	    type:'bullets',
	    clickable: true, 
	  },
	  
	  autoplay: {
	    delay: 5000,
	  },

	  navigation: {
	    nextEl: ".mainbanner-button-next",
	    prevEl: ".mainbanner-button-prev",
	  },

	  on: {
		    slideChange: function () {
		    	$('.mainbanner-pagination').removeClass('swiper-pagination-bullet-active');
		    }
	  	},
	});

const swiper4 = new Swiper(".popular-container",{
	  loop: false,
	  slidesPerView: 4,
	  slidesPerGroup: 4,
	  spaceBetween : 20,
})

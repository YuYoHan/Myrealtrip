<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 국내숙소</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="${cp}/app/img/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
</head>
<link rel="stylesheet" href="${cp}/css/common.css">
<link rel="stylesheet" href="${cp}/css/hotel/hotel.css">
<link rel="stylesheet" href="${cp}/css/footer.css">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
</head>
<body>

<div class="home-style-container">
    <div class="bgimg">
        <div class="home-style-headerBackground"></div>
    </div>
    <section class="home-style-content">
        <form id="frm" method="get" action="${cp}/hotel/hotel.ht">
            <h1 class="home-style-headline">어떤 숙소 찾으세요?</h1>
            <div class="tabcontainer">
                <div class="TabSwitch-style-container">
                    <div class="tabswitch-inner">
                        <div class="TabSwitchItem-style">
                            <div class="TabSwitchItem-style-text">국내</div>
                        </div>
                    </div>
                    <span class="tabswitch-indicator"></span>
                </div>
            </div>
            <div class="searchTermBox">
                <div class="CategoriesTab-style-container">
                    <div class="CategoriesTabItem-style-tabItem">
                        <img class="CategoriesTabItem-style-icon"
                             src="https://dffoxz5he03rp.cloudfront.net/icons/ic_accommodation_hotel_40_x_40_colored.svg">
                        <span class="CategoriesTabItem-style-text">호텔·리조트</span>
                    </div>
                </div>
                <div class="SearchTermBox-style-inputArea">
                    <div class="PlaceInput-style-wrapper">
                        <div class="PlaceInput-style-input">
  						<span class="css-x1n18f">
  							<img class="css-labkkb"
                                 src="https://dffoxz5he03rp.cloudfront.net/icons/ic_accommodation_hotel_40_x_40_colored.svg">
  						</span>
                            <input class="css-3wnbe5" placeholder="제주 감성 충만 호텔" readonly="readonly">
                        </div>
                    </div>
                    <div class="date_selector clearfix border_all ml8" id="div_day_selector" role="calendarPopTxt"
                         style="cursor: pointer;">
                        <input id="txt_depDt" class="input_text" type="hidden" title="가는날 선택" placeholder="가는날 선택"
                               readonly="readonly" value="">
                        <input id="txt_depDt_view" class="input_text" type="text" title="가는날 선택"
                               placeholder="입실 날짜 선택  - 퇴실 날짜 선택" readonly="readonly" name="datefilter"
                               role="combobox" style="cursor: pointer;" value="">
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzQ5NTA1NiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiIGQ9Ik02IDRMMTAgOC4wMDIgNi4wMDUgMTIiIHRyYW5zZm9ybT0icm90YXRlKDkwIDggOCkiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
                    </div>
                    <div class="TravelerForm-style-container">
                        <div class="TravelerForm-style-dropdown">
                            <div class="css-pfy6jg">
                                <img class="TravelerForm-style-icon"
                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_person_sm_filled_gray_700.svg">
                                <span class="TravelerForm-style-dropdownText">인원 <span
                                        class="count-total"></span>명</span>
                                <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzQ5NTA1NiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiIGQ9Ik02IDRMMTAgOC4wMDIgNi4wMDUgMTIiIHRyYW5zZm9ybT0icm90YXRlKDkwIDggOCkiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
                            </div>
                        </div>
                    </div>
                    <div class="TravelerForm-style-holder hidden">
                        <div class="css-nkdub6">
                            <div class="TravelerForm-style-content">
                                <h5 class="TravelerForm-style-contentTitle">인원 선택</h5>
                                <div class="TravelerForm-style-row">
                                    <label class="TravelerForm-style-title">성인</label>
                                    <div class="css-cssveg">
                                        <div class="css-14zx4vh">
                                            <button class="css-w8i8sr Nop_btn_minus" type="button">
                                                <img class="css-labkkb"
                                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_minus_sm_blue_400.svg">
                                            </button>
                                            <span class="num">0</span>
                                            <button class="css-w8i8sr Nop_btn_plus" type="button">
                                                <img class="css-labkkb"
                                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_plus_xs_blue_400.svg">
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="TravelerForm-style-row">
                                    <label class="TravelerForm-style-title">어린이</label>
                                    <div class="css-cssveg">
                                        <div class="css-14zx4vh">
                                            <button class="css-w8i8sr Nop_btn_minus" type="button">
                                                <img class="css-labkkb"
                                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_minus_sm_blue_400.svg">
                                            </button>
                                            <span class="num">0</span>
                                            <button class="css-w8i8sr Nop_btn_plus" type="button">
                                                <img class="css-labkkb"
                                                     src="https://dffoxz5he03rp.cloudfront.net/icons/ic_plus_xs_blue_400.svg">
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="css-mkihkg">
  					<button type="button" class="css-17x5dyz">
  						<span class="1s4v6ia" onclick="return dateSubmit();">검색</span>
  					</button>
  				</span>
                </div>
            </div>
            <%@ include file="/app/hotel/hotel_swiper.jsp" %>
        </form>
    </section>
</div>
<div class="default-components" id="footer-components">
    <footer id="footer" class="footer-container">
        <%@ include file="/app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script>
    $(function () {

        $('input[name="datefilter"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        });

        $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });

    function countBtn() {
        const $wrap = $('.css-nkdub6'),
            $btnMinus = $wrap.find('.Nop_btn_minus'),
            $btnPlus = $wrap.find('.Nop_btn_plus');
        $cell = $wrap.find('.cell');

        $btnMinus.on('click', function (e) {
            let $this = $(this);
            let num = $this.parent().find('.num').text();
            num--;
            if (num <= 0) {
                num = 0;
            }
            $this.parent().find('.num').text(num);
            totalFn();
        });
        $btnPlus.on('click', function () {
            let $this = $(this);
            let num = $this.parent().find('.num').text();
            num++;
            if (9 <= num) {
                num = 9; // 최대 인원수
            }
            $this.parent().find('.num').text(num);
            totalFn();
        });

        function totalFn() {
            var $total = $(".TravelerForm-style-row")
            var total = 0;
            $total.find(".num").each(function () {
                total += Number($(this).text());
            });
            $(".count-total").text(total);
            $(".count-total-input").val(total);
        };
    }

    countBtn();

    const seat_wrap = document.getElementsByClassName("TravelerForm-style-dropdown")[0];
    const Nop_wrap = document.getElementsByClassName("TravelerForm-style-holder")[0];
    seat_wrap.addEventListener('click', () => {
        Nop_wrap.classList.toggle('hidden');
    })

    const dateSubmit = function () {
        document.getElementById('frm').submit();
    }
</script>
<script src="${cp}/js/swiper_hotel.js"></script>
<script src="${cp}/js/designForInput.js"></script>
<script src="${cp}/js/chatbot.js"></script>

</html>
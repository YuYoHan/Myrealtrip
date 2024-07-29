<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 숙소</title>
    <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
    <link rel="shortcut icon" type="image/x-icon" href="${cp}/img/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <link rel="stylesheet" href="../../css/global/common.css">
    <link rel="stylesheet" href="../../css/global/footer.css">
    <link rel="stylesheet" href="../../css/hotel/hotel.css">
    <link rel="stylesheet" href="../../css/air/air.css">
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
    #cityPopup {
        transform: translate(117px, 193px)
    }
</style>
<body>
<!-- header시작 -->
<%@ include file="../global/header.jsp" %>
<!-- header끝 -->
<main>
    <div class="home-style-container">
        <div class="bgimg">
            <div class="home-style-headerBackground"></div>
        </div>
        <section class="home-style-content">
            <form id="frm" method="get" action="${cp}/hotel/hotel.ht">
                <h1 class="home-style-headline">숙소 찾기</h1>
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
                            <div class="PlaceInput-style-input city_selector">
                                <input id="txt_arrCtyCode" class="css-3wnbe5 input_text" name="dep" placeholder="여행지 검색" type="text" readonly="readonly">
                            </div>
                        </div>

                        <div class="Nop_wrap2 hidden" id="cityPopup">
                            <div class="Nop_header">
                                <h1>도시 선택</h1>
                            </div>
                            <div class="Nop_container">
                                <div class="Nop_items2">
                                    <ul class="city_list">
                                        <li data-city="뉴욕">뉴욕</li>
                                        <li data-city="피렌체">피렌체</li>
                                        <li data-city="라스베가스">라스베가스</li>
                                        <li data-city="파리">파리</li>
                                        <li data-city="런던">런던</li>
                                        <li data-city="바르셀로나">바르셀로나</li>
                                        <li data-city="로마">로마</li>
                                        <li data-city="루체른">루체른</li>
                                        <li data-city="인터라켄">인터라켄</li>
                                        <li data-city="세고비아">세고비아</li>
                                        <li data-city="톨레도">톨레도</li>
                                        <li data-city="두바이">두바이</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

<%--                        --%>
                        <div class="date_selector clearfix border_all ml8" id="div_day_selector" role="combobox"
                             style="cursor: pointer;">
                            <input id="txt_depDt" class="input_text" type="hidden" title="가는날 선택" placeholder="가는날 선택"
                                   readonly="readonly" value="">
                            <input id="txt_depDt_view" class="input_text" type="text" title="가는날 선택"
                                   placeholder="입실 날짜 선택  - 퇴실 날짜 선택" readonly="readonly" name=" dateFilter"
                                   role="combobox" style="cursor: pointer;" value="">
                            <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzQ5NTA1NiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiIGQ9Ik02IDRMMTAgOC4wMDIgNi4wMDUgMTIiIHRyYW5zZm9ybT0icm90YXRlKDkwIDggOCkiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
                        </div>
                        <div class="TravelerForm-style-container">
                            <div class="TravelerForm-style-dropdown">
                                <div class="css-pfy6jg">
                                    <img class="TravelerForm-style-icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_person_sm_filled_gray_700.svg">
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
                                                    <img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_minus_sm_blue_400.svg">
                                                </button>
                                                <span class="num">0</span>
                                                <button class="css-w8i8sr Nop_btn_plus" type="button">
                                                    <img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_plus_xs_blue_400.svg">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="TravelerForm-style-row">
                                        <label class="TravelerForm-style-title">어린이</label>
                                        <div class="css-cssveg">
                                            <div class="css-14zx4vh">
                                                <button class="css-w8i8sr Nop_btn_minus" type="button">
                                                    <img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_minus_sm_blue_400.svg">
                                                </button>
                                                <span class="num">0</span>
                                                <button class="css-w8i8sr Nop_btn_plus" type="button">
                                                    <img class="css-labkkb" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_plus_xs_blue_400.svg">
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
            </form>

            <div id="product-side-container">
                <div id="filter-section-content" style="width: 224px">
                    <aside id="aside-section">
                        <div class="filter-section" id="section">
                            <h4 class="filter-title" id="price">가격</h4>
                            <span class="sp1dp" id="sp1dp">1박 기준 요금</span>
                            <div class="rc-slider rc-slider-horizontal">
                                <div class="rc-slider-track" style="left: 0%; width: 100%;"></div>
                                <div class="rc-slider-step"></div>
                                <div class="rc-slider-handle rc-slider-handle-1" tabindex="0" role="slider" aria-valuemin="100000" aria-valuemax="500000" aria-valuenow="0" style="left: 0%;"></div>
                                <div class="rc-slider-handle rc-slider-handle-2" tabindex="0" role="slider" aria-valuemin="100000" aria-valuemax="500000" aria-valuenow="500000" style="left: 100%;"></div>
                            </div>
                            <div>
                                <span id="price-range">100000원 - 500000원+</span>
                            </div>
                        </div>
                        <section id="section-sort">
                            <div class="filter-section" id="container-sort">
                                <h4 class="filter-title" id="h4sort">정렬</h4>
                                <div id="radio-list-sort">
                                    <input type="radio" name="sort-order" value="recommend" checked> 추천순<br>
                                    <input type="radio" name="sort-order" value="low-price"> 낮은 가격순<br>
                                    <input type="radio" name="sort-order" value="high-price"> 높은 가격순<br>
                                    <input type="radio" name="sort-order" value="high-discount"> 할인 높은순<br>
                                </div>
                            </div>
                        </section>
                    </aside>
                </div>

                <div id="product-list-container" style="width: 870px;">
                    <img src="https://dffoxz5he03rp.cloudfront.net/banners/unionstay/pc_top_banner_240103.jpg" style="width: 100%;">

                    <c:forEach items="${hotelbannerList}" var="ben">
                        <div class="image_container">
                            <a class="" href="#">
                                <div class="image_content">
                                    <img class="hotel-banner-image" alt="호텔리스트" src="${ben.hotelImgURL}">
                                </div>
                                <div id="hotel-content">
                                    <div id="hotel-title">
                                        <h2 class="hotel-hotelName">${ben.hotelName}</h2>
                                        <span>${ben.hotelCity}</span>
                                    </div>
                                    <div id="hotel-min-price">
                                        <span class="room-prices"><fmt:formatNumber value="${ben.roomMinPrice}" type="number" pattern="#,###"/>원/박</span>
                                    </div>
                                </div>
                            </a>
                            <hr>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%--                    <div>--%>
            <%--                        <%@ include file="/app/hotel/hotel_swiper.jsp" %>--%>
            <%--                    </div>--%>
        </section>
    </div>
</main>

<div class="default-components" id="footer-components" style="margin-top: 14756px">
    <footer id="footer" class="footer-container">
        <%@ include file="/app/global/footer.jsp" %>
    </footer>
</div>
</body>
<script>
    $(function () {
        // 날짜 선택기 초기화
        $('input[name=" dateFilter"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        // 날짜 선택기 적용 및 취소 이벤트 처리
        $('input[name=" dateFilter"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        });

        $('input[name=" dateFilter"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

        // 인원 수 조절 버튼 클릭 이벤트
        function countBtn() {
            const $wrap = $('.css-nkdub6'),
                $btnMinus = $wrap.find('.Nop_btn_minus'),
                $btnPlus = $wrap.find('.Nop_btn_plus');

            $btnMinus.on('click', function () {
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
                if (num >= 9) {
                    num = 9; // 최대 인원수
                }
                $this.parent().find('.num').text(num);
                totalFn();
            });

            function totalFn() {
                var $total = $(".TravelerForm-style-row");
                var total = 0;
                $total.find(".num").each(function () {
                    total += Number($(this).text());
                });
                $(".count-total").text(total);
                $(".count-total-input").val(total);
            }
        }

        countBtn();

        // 날짜 선택기와 인원 수 조절 버튼 클릭 이벤트
        const seat_wrap = document.getElementsByClassName("TravelerForm-style-dropdown")[0];
        const Nop_wrap = document.getElementsByClassName("TravelerForm-style-holder")[0];
        seat_wrap.addEventListener('click', () => {
            Nop_wrap.classList.toggle('hidden');
        });

        // 수정된 dateSubmit 함수
        const dateSubmit = function () {

            // const searchLocation = $('input.css-3wnbe5').val().trim();
            const searchLocation = document.getElementById('txt_arrCtyCode').value;
            // const searchLocation = '부산';
            const dateSelected = $('input[name=" dateFilter"]').val().trim();
            const totalCount = parseInt($('.count-total').text().trim(), 10);

            alert(searchLocation);
            alert(dateSelected);
            alert(totalCount);

            // 입력값 검증

            if (searchLocation === '' || dateSelected === '') {
                alert('도시와 날짜, 인원수를 모두 입력해 주세요.');
                return false;
            }

            if (totalCount < 1 || isNaN(totalCount)) {
                alert('인원 수를 1명 이상으로 설정해 주세요.');
                return false;
            }

            // 폼 제출 후 상태를 저장
            localStorage.setItem('formSubmitted', 'true');

            // h1 태그 숨기기
            document.querySelector('h1.home-style-headline').style.display = 'none';

            // 폼 제출
            document.getElementById('frm').submit();
            let a = '/hotel/hotelSearch.ht?city='+searchLocation+'&date='+dateSelected+'&count='+totalCount

            alert(a);
            window.location.href = a;
            return false; // 버튼의 기본 동작 방지
        };

        // 검색 버튼 클릭 시 dateSubmit 함수 호출
        $('button.css-17x5dyz').on('click', function () {
            return dateSubmit();
        });
    });

    $(document).ready(function() {
        if (localStorage.getItem('formSubmitted') === 'true') {
            document.querySelector('h1.home-style-headline').style.display = 'none';
            // 상태 초기화
            localStorage.removeItem('formSubmitted');
        }
    });

    $(function() {
        $("#price-slider").slider({
            range: true,
            min: 100000,
            max: 500000,
            values: [100000, 500000],
            slide: function(event, ui) {
                $('#price-range').text(ui.values[0] + '원 - ' + ui.values[1] + '원+');
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const cityPopup = document.getElementById('cityPopup');
        const arrCityInput = document.getElementById('txt_arrCtyCode');

        // 도착지 필드를 클릭하면 팝업을 표시
        arrCityInput.addEventListener('click', (event) => {
            const rect = arrCityInput.getBoundingClientRect();
            cityPopup.style.top = `${rect.bottom + window.scrollY}px`;
            cityPopup.style.left = `${rect.left + window.scrollX}px`;

            cityPopup.classList.toggle('hidden');
        });

        // 도시 목록의 항목을 클릭하면 도착지 필드에 반영하고 팝업을 숨김
        document.querySelectorAll('.city_list li').forEach(city => {
            city.addEventListener('click', () => {
                arrCityInput.value = city.dataset.city;
                cityPopup.classList.add('hidden');
            });
        });

        // 팝업 외부 클릭 시 팝업을 숨김
        document.addEventListener('click', (event) => {
            if (!event.target.closest('.city_selector') && !event.target.closest('.Nop_wrap')) {
                cityPopup.classList.add('hidden');
            }
        });
    });
</script>

    <script src="${cp}/js/swiper_hotel.js"></script>
    <script src="${cp}/js/designForInput.js"></script>
    <script src="${cp}/js/chatbot.js"></script>
</html>
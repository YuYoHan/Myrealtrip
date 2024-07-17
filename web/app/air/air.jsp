<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 항공권 예약에서 날짜 정하고 인원수 정하는 칸-->
    <meta charset="UTF-8">
    <title>마이리얼트립 :: 항공권</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/img/favicon.ico"/>">
    <link rel="stylesheet" href="../../css/air/air.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <!--
        Moment.js는 JavaScript 날짜 라이브러리로, 날짜와 시간을 파싱, 검증, 조작, 포맷하는 기능을 제공합니다.
        다양한 날짜 형식을 다루고, 날짜 간의 차이를 계산하는 등의 작업을 간편하게 할 수 있습니다.
    -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <!--
        Daterangepicker는 jQuery와 Moment.js를 기반으로 하는 날짜 선택기 라이브러리입니다.
        사용자가 시작일과 종료일을 쉽게 선택할 수 있도록 해줍니다. 주로 예약 시스템, 이벤트 일정, 보고서 작성 등에서 사용-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <!--
        Daterangepicker의 스타일을 정의한 CSS 파일입니다.
        Daterangepicker를 사용할 때 필요한 기본 스타일을 제공하여 일관된 UI를 유지할 수 있도록 합니다.-->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
</head>
<link rel="stylesheet" type="text/css" href="../../css/calendar.css" />
<body>
<div class="search_are">
    <div id="div_notice" class="statue_box6" style="display:none;"></div>
    <div id="inttab">
        <ul class="section_1">
            <li class="interval_select">
                <input type="radio" id="initFormCode" name="initform"
                       onclick="'#'" checked="checked"
                       value="RT" class="input_radio">
                <label for="initFormCode">왕복</label>
            </li>
            <!-- 항공권 예약 내역  -->
            <li class="extra_link">
                <!-- 비회원 예약 내역을 볼 수 있는 JSP를 만들어야 함-->
                <a href="#" target="_parent" title="항공권 예약내역">비회원 예약내역</a>
            </li>
            <li class="extra_link">
                <a href="${cp}/mytrip/myTrip.mt" target="_parent" title="항공권 예약내역">항공권 예약내역</a>
            </li>
        </ul>
        <div class="section_multi" id="div_search1">
            <form id="frm" method="get" action="${cp}/air/airSearch.ar">
                <fieldset id="div_search1_trip1">
                    <legend></legend>
                    <ul class="itinerary">
                        <li class="clearfix">
                            <div class="city_selector clearfix border_all">
                                <input id="depCtyCodeSearch" placeholder="서울" class="input_text input" type="text"
                                       readonly="readonly">
                                <button type="button" class="btn_swapper" id="btn_arrDepChange">도착지 출발지 교체</button>
                                <input id="txt_arrCtyCode" placeholder="제주 (CJU)" class="input_text" type="text"
                                       readonly="readonly">
                            </div>
                            <div class="date_selector clearfix border_all ml8" id="div_day_selector"
                                 style="cursor: pointer;">
                                <input id="txt_depDt" class="input_text" type="hidden" title="가는날 선택"
                                       placeholder="가는날 선택" readonly="readonly" value="">

                                <input id="txt_depDt_view" class="input_text" type="text" title="가는날 선택"
                                       placeholder="가는날 선택 - 오는날 선택" readonly="readonly" name="datefilter"
                                       role="combobox" style="cursor: pointer;" value="">
                            </div>
                            <div class="seat_wrap border_all">
                                <a class="select_border">
                                    <input name="count-total-input" class="count-total-input" type="hidden"
                                           readonly="readonly" value="">
                                    <span class="txt" id="bin_people">승객 <span class="count-total"></span>명, 전체</span>
                                </a>
                            </div>
                            <a class="btn_price_search" onclick="return ok_frm()">검색</a>
                            <div class="Nop_wrap hidden">
                                <div class="Nop_header">
                                    <h1>인원 & 좌석등급</h1>
                                </div>
                                <div class="Nop_container">
                                    <div class="Nop_items">
                                        <dl class="Nop_item">
                                            <dt>성인 <span>만 12세 이상</span></dt>
                                            <dd class="count-box">
                                                <button class="Nop_btn_minus" type="button"></button>
                                                <span class="num">0</span>
                                                <button class="Nop_btn_plus" type="button"></button>
                                            </dd>
                                        </dl>

                                        <dl class="Nop_item">
                                            <dt>소아 <span>만 12세 미만</span></dt>
                                            <dd class="count-box">
                                                <button class="Nop_btn_minus" type="button"></button>
                                                <span class="num">0</span>
                                                <button class="Nop_btn_plus" type="button"></button>
                                            </dd>
                                        </dl>

                                        <dl class="Nop_item">
                                            <dt>유아 <span>24개월 미만</span></dt>
                                            <dd class="count-box">
                                                <button class="Nop_btn_minus" type="button"></button>
                                                <span class="num">0</span>
                                                <button class="Nop_btn_plus" type="button"></button>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    // 날짜 범위 선택 기능
    $(function () {
        // 날짜 범위 선택기를 활성화
        // daterangepicker() 함수는 날짜 범위 선택을 가능하게 하는 라이브러리를 초기화
        // 사용자가 날짜를 선택하면 선택한 날짜 범위가 해당 입력 상자에 표시됩니다.
        $('input[name="datefilter"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });
        // 날짜를 선택하고 적용할 때 발생하며, 선택한 날짜 범위를 입력 상자에 설정
        $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        });
        // cancel.daterangepicker 이벤트는 사용자가 선택을 취소하면 해당 입력 상자의 값을 지웁니다.
        $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });
    });

    // 인원 수 조절 기능
    // countBtn() 함수는 버튼을 클릭하여 인원 수를 증가 혹은 감소시킬 수 있는 기능을 구현
    function countBtn() {
        const $wrap = $('.Nop_wrap'),
            $btnMinus = $wrap.find('.Nop_btn_minus'),
            $btnPlus = $wrap.find('.Nop_btn_plus');
        $cell = $wrap.find('.cell');

        // . .Nop_btn_minus와 .Nop_btn_plus 클래스를 가진 버튼들을 클릭하면 해당 부모 요소에서 숫자를 증가 또는 감소
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

        // totalFn() 함수는 모든 인원 수를 합산하여 총 인원 수를 계산하고, 이를 화면에 출력 및 필요한 곳에 입력
        function totalFn() {
            let $total = $(".count-box")
            let total = 0;
            $total.find(".num").each(function () {
                total += Number($(this).text());
            });
            $(".count-total").text(total);
            $(".count-total-input").val(total);
        }
    }

    countBtn();

    const seat_wrap = document.getElementsByClassName("seat_wrap")[0];
    const Nop_wrap = document.getElementsByClassName("Nop_wrap")[0];

    seat_wrap.addEventListener('click', () => {
        // hidden' 클래스가 이미 존재하면 제거하고, 없으면 추가
        // 이를 통해 클릭할 때마다 Nop_wrap 요소가 보이거나 숨겨지는 토글 기능을 구현
        Nop_wrap.classList.toggle('hidden');
    })

    function ok_frm() {
        document.getElementById("frm").submit();
    }
</script>
<script src="../../js/myInfo.js"></script>

</html>
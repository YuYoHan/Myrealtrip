<%--
  Created by IntelliJ IDEA.
  User: WD
  Date: 2024-07-24
  Time: 오후 7:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이리얼트립 :: 여행자 보험 간편하게 준비하기!</title>
    <script>
        document.getElementsByClassName('currentDate').value = new Date().toISOString().substring(0, 10);
    </script>
    <link rel="stylesheet" href="../../css/insurance/insurance.css">
</head>
<body>
    <div id="ns-Wrapper">
        <div class="ns-Flex">
             <span class="ns-Field" id="ns-Title">해외여행보험</span>
             <img src="/../../img/global/logo.png" id="ns-Logo">
        </div>
        <hr class="ns-Line">
        <div class="ns-Field" id="ns-Main">
            <h3>해외여행보험 간편하게 준비하기!</h3>
            <div class="ns-Box">
                <div >
                    <h3>여행기간</h3>
                    <p class="ns-info">출국 전 자택(국내)을 출발하여 여행을 마친 후 자택에 도착할 때까지의 기간으로 설정해 주세요.</p>
                    <div class="option-Box">
                        <p>자택 출발 일시</p>
                        <input type="date" class="currentDate">
                        <select>
                            <option>시간</option>
                            <option>00시</option>
                            <option>01시</option>
                            <option>02시</option>
                            <option>03시</option>
                            <option>04시</option>
                            <option>05시</option>
                            <option>06시</option>
                            <option>07시</option>
                            <option>08시</option>
                            <option>09시</option>
                            <option>10시</option>
                            <option>11시</option>
                            <option>12시</option>
                            <option>13시</option>
                            <option>14시</option>
                            <option>15시</option>
                            <option>16시</option>
                            <option>17시</option>
                            <option>18시</option>
                            <option>19시</option>
                            <option>20시</option>
                            <option>21시</option>
                            <option>22시</option>
                            <option>23시</option>
                            <option>24시</option>
                        </select>
                        <p>자택 도착 일시</p>
                        <input type="date" class="currentDate">
                        <select>
                            <option>시간</option>
                            <option>00시</option>
                            <option>01시</option>
                            <option>02시</option>
                            <option>03시</option>
                            <option>04시</option>
                            <option>05시</option>
                            <option>06시</option>
                            <option>07시</option>
                            <option>08시</option>
                            <option>09시</option>
                            <option>10시</option>
                            <option>11시</option>
                            <option>12시</option>
                            <option>13시</option>
                            <option>14시</option>
                            <option>15시</option>
                            <option>16시</option>
                            <option>17시</option>
                            <option>18시</option>
                            <option>19시</option>
                            <option>20시</option>
                            <option>21시</option>
                            <option>22시</option>
                            <option>23시</option>
                            <option>24시</option>
                        </select>
                    </div>
                </div>
                <div class="item-Box">
                    <h3>여행국가</h3>
                    <p class="ns-info">
                        외교통상부가 지정하는 지역별 여행경보 중 적색경보(출국권고), 흑색경보(여행금지)지역은 보험가입과 보상이 불가능합니다.<br>
                        <a href="https://www.0404.go.kr/dev/main.mofa">해외여행보험 가입 제한 국가 확인하기</a>
                    </p>
                </div>
                <div class="item-Box">
                    <h3>이메일</h3>
                    <input type="text" placeholder="exam@exam.com" id="input-Email">
                    <input type="submit" value="인증 요청">
                </div>
                <div class="item-Box">
                    <h3>보험 가입 인원</h3>
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                    </select>
                </div>
                <div class="item-Box">
                    <h3>보험 가입자 정보 입력</h3>
                    <p class="ns-info">
                        정확한 피보험자 정보인 경우에만 보험계약 조회 및 보험금 청구가 가능합니다.<br>
                        입력된 정보가 틀린 경우, 입력란을 클릭하여 직접 수정해 주세요.
                    </p>
                    <div class="option-Box">
                        <h3>가입자 1(대표피보험자)</h3>
                        <div>가입 정보 입력</div>
                        <input type="text" placeholder="국문 이름">
                        <input type="text" placeholder="영문 성">
                        <input type="text" placeholder="영문 이름">
                        <input type="text" placeholder="생년월일(8자)">
                        <select>
                            <option>성별</option>
                            <option>남자</option>
                            <option>여자</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div id="ns-Nav">
            <h3>약관 및 보험료 결제</h3>
            <hr class="ns-Line">
            <div >
                <span>가입자 인원수</span><span>총 명 가입</span><br>
                <span>납입 보험료</span><span>원</span>
            </div>
            <div>
                <button>중요사항 안내 확인</button>
                <button>약관 상세 확인</button>
            </div>
            <input type="checkbox"><span>보험료 납입 및 가입설계 내역에 대한 동의</span>
            <p>- 중요사항 안내 확인과 보험약관 내용을 확인했고 해외여행보험 가입에 동의합니다.</p>
            <button>카카오 결제</button>
            <button>토스 결제</button>

        </div>
    </div>
</div>
</body>
</html>
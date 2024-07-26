package action.reserve;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;

public class AirReserveAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {



        String outAirline = req.getParameter("outAirline");
        String outTime = req.getParameter("outTime");
        String outArriveTime = req.getParameter("outArriveTime");
        String inAirline = req.getParameter("inAirline");
        String inTime = req.getParameter("inTime");
        String inArriveTime = req.getParameter("inArriveTime");
        String fromAirPort = req.getParameter("fromAirPort");
        String toAirPort = req.getParameter("toAirPort");
        String seat = req.getParameter("seat");
        String price = req.getParameter("price");
        String peopleCount = req.getParameter("peopleCount");
        String depDate = req.getParameter("depDate");
        String retDate = req.getParameter("retDate");



        // 날짜를 받아와서 년, 월, 일 나누어 보내줌.
        String date = req.getParameter("dateFilter");
        String startYear = date.substring(6, 10);
        String startMonth = date.substring(0, 2);
        String startDay = date.substring(3, 5);
        String endYear = date.substring(19, 23);
        String endMonth = date.substring(13, 15);
        String endDay = date.substring(16, 18);



        /*

        ${pageContext.request.contextPath} // 경로
        ${loginUser == null}               // 로그인 유저 확인
        ${cp}                              // 경로
        ${airLine}                         // 출발항공사
        ${dep}                             // 출발지
        ${airNum}                          // 항공사 번호
        ${startYear}                       // 출빌 년도
        ${startMonth}                      // 출발 달
        ${startDay}                        // 출발 날
        ${startweekhangle}                 // 시작 정보??
        ${endYear}                         // 귀국 년도
        ${endMonth}                        // 귀국 달
        ${endDay}                          // 귀국 날
        ${endweekhangle}                   // 귀국 정보"??
        ${arr}                             // 도착정보
        ${price}                           // 가격
        ${loginUser.userName}              // 유저 정보
        ${loginUser.userEmail}             // Email
        * */

        // 요일 가져오기
        LocalDate startweek = LocalDate.of(
                Integer.parseInt(startYear),
                Integer.parseInt(startMonth),
                Integer.parseInt(startDay));
        DayOfWeek startdayOfWeek = startweek.getDayOfWeek();
        int startDayOfWeekNumber = startdayOfWeek.getValue() - 1;

        LocalDate endweek = LocalDate.of(
                Integer.parseInt(endYear),
                Integer.parseInt(endMonth),
                Integer.parseInt(endDay));
        DayOfWeek enddayOfWeek = endweek.getDayOfWeek();
        int endDayOfWeekNumber = enddayOfWeek.getValue() - 1;

        String[] weekStirng = {"월", "화", "수", "목", "금", "토", "일"};
        //요일 뽑아쓰기
        String startweekhangle = weekStirng[startDayOfWeekNumber];
        String endweekhangle = weekStirng[endDayOfWeekNumber];
        String airLine = outAirline;
        String airNum = "0";
        String dep = fromAirPort;
        String arr = toAirPort;
        //
        // String price = req.getParameter("price");


        req.setAttribute("startYear", startYear);
        req.setAttribute("startMonth", startMonth);
        req.setAttribute("startDay", startDay);                         //
        req.setAttribute("endYear", endYear);                           //
        req.setAttribute("endMonth", endMonth);                         //
        req.setAttribute("endDay", endDay);                             //
        req.setAttribute("startweekhangle", startweekhangle);           //
        req.setAttribute("endweekhangle", endweekhangle);               //

        req.setAttribute("startYear", startYear);
        req.setAttribute("depDate", depDate);
        req.setAttribute("retDate", retDate);


        //                                              인원수
        req.setAttribute("airLine", airLine);       // 항공사(출발)
        req.setAttribute("airNum", airNum);         // 삭제될 예정
        req.setAttribute("dep", dep);               //출발지
        req.setAttribute("arr", arr);               //도착지
        req.setAttribute("price", price);           // 가격

        System.out.println("AirReserveAction");
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/reserve/airReserves.jsp");
        return acto;
    }
}

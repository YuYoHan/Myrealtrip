package service.reserve;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;

public class AirReserveService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 날짜를 받아와서 년, 월, 일 나누어 보내줌.
        String date = req.getParameter("dateFilter");
        String startYear = date.substring(6, 10);
        String startMonth = date.substring(0, 2);
        String startDay = date.substring(3, 5);
        String endYear = date.substring(19, 23);
        String endMonth = date.substring(13, 15);
        String endDay = date.substring(16, 18);

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
        String airLine = req.getParameter("airLine");
        String airNum = req.getParameter("airNum");
        String dep = req.getParameter("dep");
        String arr = req.getParameter("arr");
        String price = req.getParameter("price");


        req.setAttribute("startYear", startYear);
        req.setAttribute("startMonth", startMonth);
        req.setAttribute("startDay", startDay);
        req.setAttribute("endYear", endYear);
        req.setAttribute("endMonth", endMonth);
        req.setAttribute("endDay", endDay);
        req.setAttribute("startweekhangle", startweekhangle);
        req.setAttribute("endweekhangle", endweekhangle);

        req.setAttribute("airLine", airLine);
        req.setAttribute("airNum", airNum);
        req.setAttribute("dep", dep);
        req.setAttribute("arr", arr);
        req.setAttribute("price", price);

        System.out.println("AirReserveAction");
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/reserve/airReserves.jsp");
        return acto;
    }
}

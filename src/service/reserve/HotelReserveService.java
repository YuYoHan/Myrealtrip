package service.reserve;

import config.action.Action;
import config.action.ActionTo;
import dao.hotel.HotelDAO;
import dao.hotel.RoomDAO;
import dto.hotel.HotelsDTO;
import dto.hotel.RoomsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;

public class HotelReserveService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {


        //" <a href=/hotel/hotemlReservl.pm?hotelNum=${hotelNum}&roomNum=${roomNum}&peopleCount=${peopleCount}&dateFilter=${dateFilter} >sdf</a>"
        String date = req.getParameter("dateFilter");

        // 날짜를 받아와서 년, 월, 일 나누어 보내줌.
        String startYear = date.substring(6, 10);
        String startMonth = date.substring(0, 2);
        String startDay = date.substring(3, 5);
        String endYear = date.substring(19, 23);
        String endMonth = date.substring(13, 15);
        String endDay = date.substring(16, 18);
        //요일 가져오기

        LocalDate startweek = LocalDate.of(Integer.parseInt(startYear), Integer.parseInt(startMonth), Integer.parseInt(startDay));
        DayOfWeek startdayOfWeek = startweek.getDayOfWeek();
        int startDayOfWeekNumber = startdayOfWeek.getValue() - 1;

        LocalDate endweek = LocalDate.of(Integer.parseInt(endYear), Integer.parseInt(endMonth), Integer.parseInt(endDay));
        DayOfWeek enddayOfWeek = endweek.getDayOfWeek();
        int endDayOfWeekNumber = enddayOfWeek.getValue() - 1;


        String[] weekStirng = {"월", "화", "수", "목", "금", "토", "일"};
        //요일 뽑아쓰기
        String startweekhangle = weekStirng[startDayOfWeekNumber];
        String endweekhangle = weekStirng[endDayOfWeekNumber];
        //String hotelNum = req.getParameter("hotelNum");
        String hotelName = req.getParameter("hotelName");
        String hotelImg = req.getParameter("hotelImg");
        String hotelPrice = req.getParameter("hotelPrice");

        String hotelNum = req.getParameter("hotelNum");
        String roomNum = req.getParameter("roomNum");
        HotelsDTO hotelsDTO = HotelDAO.getHotel(Integer.parseInt(hotelNum));
        RoomsDTO roomsDTO = RoomDAO.getRoom(Integer.parseInt(roomNum));
        int peopleCount = Integer.parseInt(req.getParameter("peopleCount"));
        int price = Integer.parseInt(req.getParameter("price"));



        req.setAttribute("startYear", startYear);
        req.setAttribute("startMonth", startMonth);
        req.setAttribute("startDay", startDay);
        req.setAttribute("endYear", endYear);
        req.setAttribute("endMonth", endMonth);
        req.setAttribute("endDay", endDay);
        req.setAttribute("startweekhangle", startweekhangle);
        req.setAttribute("endweekhangle", endweekhangle);

        req.setAttribute("hotelNum", hotelNum);
        req.setAttribute("hotelName", hotelName);
        req.setAttribute("hotelImg", hotelImg);
        req.setAttribute("hotelPrice", hotelPrice);

        System.out.println("ReserveAction");
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/reserve/hotelReserves.jsp");
        return acto;
    }
}

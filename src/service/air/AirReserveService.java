package service.air;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AirReserveService implements Action {

    @Override
    public ActionTo execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 파라미터 가져오기
        String outAirline = request.getParameter("outAirline");
        String outTime = request.getParameter("outTime");
        String outArriveTime = request.getParameter("outArriveTime");
        String inAirline = request.getParameter("inAirline");
        String inTime = request.getParameter("inTime");
        String inArriveTime = request.getParameter("inArriveTime");
        String seat = request.getParameter("seat");
        String price = request.getParameter("price");

        //출국 날짜, 귀국 날짜, 인원수,

        // 콘솔에 출력하기
        System.out.println("Outbound Airline: " + outAirline);
        System.out.println("Outbound Time: " + outTime);
        System.out.println("Outbound Arrival Time: " + outArriveTime);

        System.out.println("Inbound Airline: " + inAirline);
        System.out.println("Inbound Time: " + inTime);
        System.out.println("Inbound Arrival Time: " + inArriveTime);

        System.out.println("Seat: " + seat);
        System.out.println("Price: " + price);

        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/reserve/airReserves.jsp");
        return acto;
    }
}

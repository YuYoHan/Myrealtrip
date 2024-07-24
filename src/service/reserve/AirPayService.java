package service.reserve;

import config.action.Action;
import config.action.ActionTo;
import dao.pay.PaymentDAO;
import dto.pay.AirPaymentDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AirPayService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 날짜를 받아와서 년, 월, 일 나누어서 보내줌
        String dateFilter = req.getParameter("dateFilter");
        System.out.println("날짜 : " + dateFilter);
        String airLine = req.getParameter("airLine");
        System.out.println("airLine : " + airLine);
        String departure = req.getParameter("dep");
        System.out.println("출발지 : " + departure);
        String arrive = req.getParameter("arr");
        System.out.println("도착지 : " + arrive);
        int price = Integer.parseInt(req.getParameter("price"));
        System.out.println("가격 : " + price);
        String bank = req.getParameter("bank");
        System.out.println("결제 은행 : " + bank);

        AirPaymentDTO airPay = AirPaymentDTO.builder()
                .dateFilter(dateFilter)
                .airLine(airLine)
                .airNum("0")
                .departure(departure)
                .arrive(arrive)
                .build();
        System.out.println("airPay : " + airPay);

        int responseAirPay = PaymentDAO.airPay(airPay);
        System.out.println("항공 결제 정보 입력 성공 여부 : "  + responseAirPay);

        int responsePay = PaymentDAO.pay(price, bank);
        System.out.println("결제 입력 성공 여부 : "  + responsePay);

        if(responseAirPay > 0 && responsePay > 0) {
            System.out.println("결제 성공");
            ActionTo acto = new ActionTo();
            acto.setRedirect(false);
            acto.setPath("../web/app/mainPage/mainPage.jsp");
            return acto;
        } else {
            System.out.println("결제 실패");
            ActionTo acto = new ActionTo();
            acto.setRedirect(true);
            acto.setPath("/app/reserve/airReserves.jsp");
            return acto;
        }
    }
}

package service.reserve;

import config.action.Action;
import config.action.ActionTo;
import dao.pay.PaymentDAO;
import dto.air.AirPayDTO;
import dto.air.AirplaneReservationsDTO;
import dto.air.AirplanesDTO;
import dto.air.OperationsDTO;
import dto.pay.AirPaymentDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;


public class AirPayService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {


        int userId = (Integer) req.getSession().getAttribute("userId");
        System.out.println("세션에서 가져온 userId" + userId);

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
        int peopleCount = Integer.parseInt(req.getParameter("peopleCount"));
        String depDate = req.getParameter("depDate");
        String retDate = req.getParameter("retDate");

        System.out.println("출발 항공사: " + outAirline);
        System.out.println("출발 시간: " + outTime);
        System.out.println("출발 도착 시간: " + outArriveTime);
        System.out.println("귀국 항공사: " + inAirline);
        System.out.println("귀국 출발 시간: " + inTime);
        System.out.println("귀국 도착 시간: " + inArriveTime);
        System.out.println("출발지 공항: " + fromAirPort);
        System.out.println("도착지 공항: " + toAirPort);
        System.out.println("좌석: " + seat);
        System.out.println("가격: " + price);
        System.out.println("인원: " + peopleCount);
        System.out.println("출발 날짜: " + depDate);
        System.out.println("귀국 날짜: " + retDate);
        System.out.println("모든 것 완료 ");

        // Create sample data
        AirplanesDTO airplane1 = AirplanesDTO.builder()
                .airplaneModel("여객기")
                .airplaneCompany(inAirline)
                .airportId(1)
                .build();

        AirplanesDTO airplane2 = AirplanesDTO.builder()
                .airplaneModel("여객기")
                .airplaneCompany(outAirline)
                .airportId(2)
                .build();

        // price는 운행왕복 통합비용
        OperationsDTO operation1 = OperationsDTO.builder()
                .operationNum("OP123")
                .operationPrice(price)
                .operationDepartureTime(createTimestamp(retDate,inTime))
                .operationArriveTime(createTimestamp(retDate,inArriveTime)) // 1 hour later
                .operationDepartureArea(toAirPort)
                .operationArriveArea(fromAirPort)
                .airplaneCapacity(Integer.parseInt(seat))
                .build();

        OperationsDTO operation2 = OperationsDTO.builder()
                .operationNum("OP456")
                .operationPrice(price)
                .operationDepartureTime(createTimestamp(depDate,outTime)) // 2 hours later
                .operationArriveTime(createTimestamp(depDate,outArriveTime)) // 3 hours later
                .operationDepartureArea(fromAirPort)
                .operationArriveArea(toAirPort)
                .airplaneCapacity(Integer.parseInt(seat))
                .build();

        AirplaneReservationsDTO reservation = AirplaneReservationsDTO.builder()
                .airplaneReservationRegTime(new Timestamp(System.currentTimeMillis()))
                .airplanePay("Credit Card")
                .inAirplaneId(0) // These IDs will be updated after insertion
                .outAirplaneId(0)
                .userId(userId)
                .peopleCount(peopleCount)
                .build();

        AirPayDTO airPay = AirPayDTO.builder()
                .airLine(outAirline)
                .airNum("DL1234")
                .departure(fromAirPort)
                .arrive(toAirPort)
                .userId(userId)
                .build();

        // Call insertData method
        PaymentDAO.payReservation(reservation, operation1, operation2, airplane1, airplane2, airPay);




//        AirPaymentDTO airPay = AirPaymentDTO.builder()
//                .dateFilter(dateFilter)
//                .airLine(airLine)
//                .airNum("0")
//                .departure(departure)
//                .arrive(arrive)
//                .build();
//        System.out.println("airPay : " + airPay);

//        int responseAirPay = PaymentDAO.airPay(airPay);
//        System.out.println("항공 결제 정보 입력 성공 여부 : "  + responseAirPay);
//
//        int responsePay = PaymentDAO.pay(price, bank);
//        System.out.println("결제 입력 성공 여부 : "  + responsePay);

      //  if(responseAirPay > 0 && responsePay > 0) {
        if(true){
            System.out.println("결제 성공");
            ActionTo acto = new ActionTo();
            acto.setRedirect(false);
            acto.setPath("/");
            return acto;
        } else {
            System.out.println("결제 실패");
            ActionTo acto = new ActionTo();
            acto.setRedirect(true);
            acto.setPath("/");
            return acto;
        }
    }

    public static Timestamp createTimestamp(String dateStr, String timeStr) {
        // Combine date and time strings
        String dateTimeStr = dateStr + " " + timeStr;

        // Define the date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HH:mm");

        try {
            // Parse the string into a Date object
            java.util.Date parsedDate = dateFormat.parse(dateTimeStr);

            // Convert the Date object into a Timestamp
            return new Timestamp(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null; // or throw a custom exception if needed
        }
    }
}

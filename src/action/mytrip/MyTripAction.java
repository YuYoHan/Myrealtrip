package action.mytrip;

import config.action.Action;
import config.action.ActionTo;
import dao.mytrip.MytripDAO;
import dto.mytrip.MyTripRoomDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyTripAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        HttpSession session = req.getSession();
        System.out.println("session : " + session);
        int userId = (int) session.getAttribute("userId");
        System.out.println("세션에서 userId 조회 : " + userId);

        // 방 가격 조회
//        ResponseRoomReserveDTO reserveHotel = RoomDAO.getReserveHotel(userId);
//        System.out.println("예약 번호 확인 : " + reserveHotel.getRoomReservationsId());
//        System.out.println("가격 리턴 확인 : " + reserveHotel.getRoomReservationsTotalPrice());

        // 결제 내역 조회
        List<MyTripRoomDTO> findRoom = MytripDAO.selectRoomsById(userId);
        System.out.println("조회한 방 정보 : " + findRoom);

        // 프론트에게 보내주기 위해
        req.setAttribute("findRoom", findRoom);

        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/mytrip/mytrip.jsp");
        return acto;
    }
}
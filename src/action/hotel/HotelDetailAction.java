//package action.hotel;
//
//import config.action.Action;
//import config.action.ActionTo;
//import dao.hotel.HotelDAO;
//import dto.hotel.HotelDetailDTO;
//import dto.hotel.HotelListDTO;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.List;
//
//public class HotelDetailAction implements Action {
//    @Override
//    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        HotelDetailDTO detailDTO = HotelDAO.hotelDetail();
//        System.out.println("호텔 조회 : ");
//        req.setAttribute("hotelbannerList", );
//        ActionTo acto = new ActionTo();
//        acto.setRedirect(false);
//        acto.setPath("/app/hotel/hotel.jsp");
//        return acto;
//
//    }
//}

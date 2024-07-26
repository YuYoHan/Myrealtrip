package action.hotel;

import config.action.Action;
import config.action.ActionTo;
import dao.hotel.HotelDAO;
import dto.hotel.HotelListDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class HotelBannerAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        List<HotelListDTO> HotelListDTOS = HotelDAO.hotelBannerList();
        System.out.println("호텔 리스트 조회 : " + HotelListDTOS);
        req.setAttribute("hotelbannerList", HotelListDTOS);
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/hotel/hotel.jsp");
        return acto;
    }

}

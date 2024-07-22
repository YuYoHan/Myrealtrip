package action.hotel;

import config.action.Action;
import config.action.ActionTo;
import dao.hotel.HotelDAO;
import dto.hotel.HotelBannerDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class HotelBannerAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        List<HotelBannerDTO> hotelBannerDTOS = HotelDAO.hotelBannerList();
        System.out.println("호텔 리스트 조회 : " + hotelBannerDTOS);
        req.setAttribute("hotelbannerList", hotelBannerDTOS);
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/hotel/hotel.jsp");
        return acto;
    }
}

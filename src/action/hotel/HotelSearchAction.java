package action.hotel;

import config.action.Action;
import config.action.ActionTo;
import dao.hotel.HotelDAO;
import dao.hotel.RoomDAO;
import dto.hotel.HotelListDTO;
import dto.hotel.RoomsDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HotelSearchAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        String city = req.getParameter("city");
        String date = req.getParameter("date");
        String count = req.getParameter("count");

        List<HotelListDTO> HotelListDTOS = HotelDAO.hotelCityList(city);
        List<RoomsDTO> RoomList = RoomDAO.hotelRoomList(city);


        System.out.println("------------------------------------------11");
        System.out.println(HotelListDTOS);
        System.out.println(RoomList);
        System.out.println("------------------------------------------11");
        req.setAttribute("hotelbannerList", HotelListDTOS);
        req.setAttribute("RoomList", RoomList);


        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/hotel/hotel.jsp");
        return acto;
    }
}
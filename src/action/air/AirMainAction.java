package action.air;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirDAO;
import dto.air.AirBannerDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

// 항공권 이동
public class AirMainAction implements Action {

    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 단순 페이지 이동이므로 forward로 보냄
        List<AirBannerDTO> bannerList = AirDAO.searchBannerList();
        System.out.println("리스트 확인 : " + bannerList.size());
        System.out.println("리스트 확인 : " + bannerList);

        req.setAttribute("bannerList", bannerList);
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airMain.jsp");
        return acto;
    }
}

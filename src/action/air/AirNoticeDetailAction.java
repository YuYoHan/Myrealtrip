package action.air;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirDAO;
import dao.air.AirNoticesDAO;
import dto.air.AirBannerDTO;
import dto.air.AirNoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

// 항공 공지사항 상세보기
public class AirNoticeDetailAction implements Action {

    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 단순 페이지 이동이므로 forward로 보냄
        List<AirBannerDTO> bannerList = AirDAO.searchBannerList();
        AirNoticeDTO AirNotice = AirNoticesDAO.getNotice(Integer.parseInt(req.getParameter("airNoticeId")));
        System.out.println("AirNotices 확인 : " + AirNotice);
        req.setAttribute("bannerList", bannerList);
        req.setAttribute("airNotice", AirNotice);


        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airNoticeDetail.jsp");
        return acto;
    }
}

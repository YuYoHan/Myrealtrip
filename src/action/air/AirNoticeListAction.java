package action.air;

import config.action.Action;
import config.action.ActionTo;
import config.page.Criteria;
import config.page.PageDTO;
import dao.air.AirDAO;
import dao.air.AirNoticesDAO;
import dto.air.AirBannerDTO;
import dto.air.AirNoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

// 항공 공지사항 리스트
public class AirNoticeListAction implements Action {

    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int pageNum = req.getParameter("pageNum") == null ? 1 : Integer.parseInt(req.getParameter("pageNum"));
        int amount = 7; // 페이지당 공지사항 수

        Criteria cri = new Criteria(pageNum, amount);

        List<AirBannerDTO> bannerList = AirDAO.searchBannerList();
        List<AirNoticeDTO> AirNoticesList = AirNoticesDAO.getNoticesWithPagination(cri.getPageNum(), cri.getAmount());
        int total = AirNoticesDAO.getTotalNoticesCount(); // 공지사항 총 개수 가져오기
        PageDTO pageDTO = new PageDTO(total, cri);

        req.setAttribute("bannerList", bannerList);
        req.setAttribute("AirNoticesList", AirNoticesList);
        req.setAttribute("pageDTO", pageDTO);

        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airNoticeList.jsp");
        return acto;
    }
}

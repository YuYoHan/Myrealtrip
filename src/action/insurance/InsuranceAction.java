package action.insurance;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirDAO;
import dao.air.AirNoticesDAO;
import dto.air.AirBannerDTO;
import dto.air.AirNoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class InsuranceAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/insurance/insurance.jsp");
        return acto;
    }
}

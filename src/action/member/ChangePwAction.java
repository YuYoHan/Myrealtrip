package action.member;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePwAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/member/changePw.jsp");
        return acto;
    }
}

package action.member;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignOutAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        ActionTo acto = new ActionTo();
        HttpSession session = req.getSession();
        session.setAttribute("loginUser", null);
        acto.setRedirect(true);
        acto.setPath("/app/mainPage/mainPage.jsp");
        return acto;
    }
}

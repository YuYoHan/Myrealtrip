package action.member;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignInAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //단순 페이지 이동임으로 forward로 보냄
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/member/signIn.jsp");
        return acto;
    }
}

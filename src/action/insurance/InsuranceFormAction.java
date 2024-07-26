package action.insurance;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsuranceFormAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/insurance/insuranceForm.jsp");
        return acto;
    }
}

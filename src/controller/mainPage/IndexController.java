package controller.mainPage;

import action.mainPage.IndexAction;
import config.action.ActionTo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();    // /myrealtrip/index.jsp
        String contextPath = req.getContextPath(); // /myrealtrip
        String command = requestURI.substring(contextPath.length());
        ActionTo acto = null;

        if (command.equals("/index.jsp")) {
            try {
                acto = new IndexAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("첫 페이지  : " + e);
            }
        }

        if (acto != null) {
            if (acto.isRedirect()) {
                resp.sendRedirect(acto.getPath());
            } else {
                RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
                disp.forward(req, resp);
            }
        }
    }
}

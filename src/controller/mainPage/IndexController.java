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
        System.out.println("requestURI 체크 : " + requestURI);
        String contextPath = req.getContextPath(); // /myrealtrip
        System.out.println("path 체크 : " + contextPath);
        String command = requestURI.substring(contextPath.length()).trim();
        System.out.println("command 체크 : " + command);
        ActionTo acto = new ActionTo();


        if (command.equals("/")) {
            try {
                acto = new IndexAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("첫 페이지  : " + e);
            }
        }
        System.out.println("acto : " + acto);

        if (acto.getPath() != null) {
            if (!(acto.isRedirect())) {
                RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
                System.out.println(disp.toString());
                disp.forward(req, resp);
            } else {
                // isRedirect = true면 호출
                resp.sendRedirect(acto.getPath());
            }
        }
    }
}

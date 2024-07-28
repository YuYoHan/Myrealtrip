package controller.search;

import action.reserve.AirReserveAction;
import action.search.SearchAction;
import config.action.ActionTo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = requestURI.substring(contextPath.length());
        ActionTo acto = new ActionTo();

        if (command.equals("/search/result.sc")) {
            try {
                acto = new SearchAction().execute(req, resp);

            } catch (Exception e) {
                System.out.println("검색 에러 : " + e.getMessage());
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

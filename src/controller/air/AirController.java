package controller.air;

import action.air.AirMainAction;
import action.air.AirNoticeDetailAction;
import action.air.AirNoticeListAction;
import config.action.ActionTo;
import service.air.AirSearchService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AirController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = requestURI.substring(contextPath.length());
        ActionTo acto = new ActionTo();

        // 항공권 페이지 이동
        if (command.equals("/air/airMain.ar")) {
            try {
                acto = new AirMainAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("항공권 이동 에러 : " + e.getMessage());
            }
        }

        // 항공권 공지사항 리스트 이동
        if (command.equals("/air/airNoticeList.ar")) {
            try {
                acto = new AirNoticeListAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("항공권 이동 에러 : " + e.getMessage());
            }
        }

        // 항공권 공지사항 디테일 이동
        if (command.equals("/air/airNoticeDetail.ar")) {
            try {
                acto = new AirNoticeDetailAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("항공권 이동 에러 : " + e.getMessage());
            }
        }

        if (command.equals("/air/airSearch.ar")) {
            try {
                acto = new AirSearchService().execute(req, resp);
            } catch (StringIndexOutOfBoundsException e) {
                acto = new ActionTo();
                System.out.println(e.getMessage());
                acto.setRedirect(true);
                acto.setPath("/air/airReserve.ar");
            } catch (NumberFormatException e) {
                acto = new ActionTo();
                System.out.println(e.getMessage());
                acto.setRedirect(true);
                acto.setPath("/air/airReserve.ar");
            } catch (Exception e) {
                System.out.println("항공권 에러 : " + e.getMessage());
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

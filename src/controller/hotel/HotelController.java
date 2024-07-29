package controller.hotel;

import action.hotel.HotelBannerAction;
import action.hotel.HotelSearchAction;
import config.action.ActionTo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HotelController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        String requestURI = req.getRequestURI();    // /board_mvc2/UserJoin.usrt
        String contextPath = req.getContextPath(); // /board_mvc2
        String command = requestURI.substring(contextPath.length());
        ActionTo acto = null;

        switch (command) {
            case "/hotel/hotel.ht":
                try {
                    System.out.println("hotel.jsp");
                    acto = new HotelBannerAction().execute(req, resp);
                } catch (Exception e) {
                    System.out.println("호텔 배너 : " + e);
                }
                break;

            case "/hotel/hotelSearch.ht":
                try {
                    acto = new HotelSearchAction().execute(req, resp);
                } catch (Exception e) {
                    System.out.println("호텔 배너 : " + e);
                }
                break;
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

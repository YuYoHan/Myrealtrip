package controller.insurance;

import action.air.AirMainAction;
import action.hotel.HotelBannerAction;
import action.insurance.InsuranceAction;
import action.insurance.InsuranceFormAction;
import config.action.ActionTo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InsuranceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        String requestURI = req.getRequestURI();    // /board_mvc2/UserJoin.usrt
        String contextPath = req.getContextPath(); // /board_mvc2
        String command = requestURI.substring(contextPath.length());
        ActionTo acto = null;

        if (command.equals("/insurance/insurance.ns")) {
            try {
                acto = new InsuranceAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("여행자 보험 에러 : " + e.getMessage());
            }
        }
        if (command.equals("/insurance/insuranceForm.ns")) {
            try {
                acto = new InsuranceFormAction().execute(req, resp);
            } catch (Exception e) {
                System.out.println("여행자 보험 에러 : " + e.getMessage());
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

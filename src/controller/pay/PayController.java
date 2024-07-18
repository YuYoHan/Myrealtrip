package controller.pay;

import action.pay.AirPayAction;
import config.action.ActionTo;
import exception.pay.PayException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PayController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("-----------------------");
        String requestURI = req.getRequestURI();
        System.out.println(requestURI);
        String contextPath = req.getContextPath();
        System.out.println(contextPath);
        String command = requestURI.substring(contextPath.length());
        System.out.println("경로 확인 : " + command);
        ActionTo acto = null;

        if (command.equals("/pay/airPayment.pm")) {
            try {
                acto = new AirPayAction().execute(req, resp);
            } catch (Exception e) {
                throw new PayException(e.getMessage());
            }
        }

        // 경로가 있으면 true
        // 리다이렉트면 리다이렉트로 보내주고 아니면 forward로 보내줌
        if (acto.getPath() != null) {
            if (acto.isRedirect()) {
                resp.sendRedirect(acto.getPath());
            } else {
                RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
                System.out.println(disp.toString());
                disp.forward(req, resp);
            }
        }
    }
}

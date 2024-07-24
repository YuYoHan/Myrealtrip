package action.mainPage;

import config.action.Action;
import config.action.ActionTo;
import dao.mainPage.MainDAO;
import dto.mainPage.MainBannerDTO;
import dto.mainPage.TravelCardDTO;
import dto.mainPage.RePlaceDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class IndexAction implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        List<TravelCardDTO> cardList = MainDAO.cardList();
        System.out.println(cardList);
        List<RePlaceDTO> replaceList = MainDAO.placeList();
        System.out.println(replaceList);
        List<MainBannerDTO> bannerList = MainDAO.bannerList();
        System.out.println(bannerList);


        req.setAttribute("replaceList", replaceList);
        req.setAttribute("cardList", cardList);
        req.setAttribute("bannerList", bannerList);

        HashMap<String, String> loginUser = new HashMap<>();
        // 클라이언트로부터 받은 HttpServletRequest 객체 req를 사용하여 세션을 생성
        HttpSession session = req.getSession();
        System.out.println("세션 확인 : " + session.getAttribute("loginUser"));
        System.out.println("세션 확인 : " + session.getAttribute("userName"));

        if (session.getAttribute("loginUser") != null) {
            loginUser.put("userEmail", req.getParameter("userEmail"));
            loginUser.put("userName", req.getParameter("userName"));
            // loginUser HashMap을 세션의 "loginUser" 속성에 저장합니다.
            // 이로써 로그인한 사용자의 정보가 세션에 유지
            session.setAttribute("loginUser", loginUser);
        }

//        if (req.getParameter("loginUser") != null) {
//            loginUser.put("userEmail", req.getParameter("userEmail"));
//            loginUser.put("userName", req.getParameter("userName"));
//            // loginUser HashMap을 세션의 "loginUser" 속성에 저장합니다.
//            // 이로써 로그인한 사용자의 정보가 세션에 유지
//            session.setAttribute("loginUser", loginUser);
//        }

        ActionTo acto = new ActionTo();

        acto.setRedirect(false);

        acto.setPath("/app/mainPage/mainPage.jsp");

        System.out.println("execute 메서드에서 반환하기 전에 acto path" + acto.getPath());
        return acto;
    }
}

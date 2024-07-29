package action.search;

import config.action.Action;
import config.action.ActionTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class SearchAction implements Action{
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ActionTo acto = new ActionTo();
        try {
            // 요청에서 검색 매개변수 가져오기
            String keyword = req.getParameter("word");

            // 검색 결과 페이지로 포워딩할 경로 설정
            acto.setPath("/app/search/result.jsp?word="+keyword);
            acto.setRedirect(false);
        } catch (Exception e) {
            // 예외 처리
            System.out.println("검색 에러: " + e.getMessage());
            throw e;
        }
        return acto;
    }
}

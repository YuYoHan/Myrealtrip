package service.member;

import config.action.Action;
import config.action.ActionTo;
import dao.member.MemberDAO;
import dto.member.ResponseMemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

// 비밀번호 조회
public class PwSearchService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String userEmail = req.getParameter("userEmail");
        System.out.println("이메일 : " + userEmail);

        ResponseMemberDTO response = MemberDAO.selectByEmail(userEmail);
        System.out.println("조회 유저 : " + response);

        ActionTo acto = new ActionTo();
        PrintWriter out = resp.getWriter();
        if(response.getUserEmail() != null) {
            System.out.println("이메일 조회 성공");
            acto.setRedirect(false);
            acto.setPath("/app/member/changePw.jsp?userEmail="+userEmail);
        } else {
            out.print("<script>");
            out.print("alert('존재하지 않는 이메일 입니다~');");
            // -1은 브라우저의 이전 페이지를 의미합니다.
            // 즉, 현재 페이지를 불러온 바로 이전 페이지로 이동하라는 명령
            out.print("history.go(-1);");
            out.print("</script>");
        }
        out.close();
        return acto;
    }
}

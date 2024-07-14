package service.member;

import config.action.Action;
import config.action.ActionTo;
import config.passwordEncoder.PasswordEncode;
import dao.member.MemberDAO;
import dto.member.ResponseMemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

// 비밀번호 변경
public class ChangePwService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        // 이메일은 비빌번호 조회 때 프론트에게 보내준 것을 그대로 사용
        String userEmail = req.getParameter("userEmail");
        System.out.println("이메일 : " + userEmail);
        String userPassword = req.getParameter("userPassword");
        System.out.println("비밀번호 받아온 거 체크 : " + userPassword);

        String encodePw = PasswordEncode.encode(userPassword);
        System.out.println("인코딩 비번 : " + encodePw);

        int re = MemberDAO.changePw(encodePw, userEmail);

        PrintWriter out = resp.getWriter();
        if(re > 0) {
            System.out.println("비밀번호 변경 성공");
            out.print("alert('비밀번호 변경되었습니다');");
            out.print("location.href = '"+req.getContextPath()+"/member/signIn.us';");
            out.print("</script>");
        } else {
            System.out.println("비밀번호 변경 실패");
            out.print("<script>");
            out.print("alert('비밀번호 변경실패');");
            out.print("history.go(-1);");
            out.print("</script>");
        }
        out.close();
        return null;
    }
}

package service.member;

import config.action.Action;
import config.action.ActionTo;
import config.passwordEncoder.PasswordEncode;
import dao.member.MemberDAO;
import dto.member.ResponseMemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

// 로그인 처리 서비스
public class SignInService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        String userEmail = req.getParameter("userEmail");
        System.out.println("이메일 : " + userEmail);
        String userPassword = req.getParameter("userPassword");
        System.out.println("비밀번호 : " + userPassword);
        String encodePw = PasswordEncode.encode(userPassword);
        System.out.println("인코딩 비밀번호 : " + encodePw);
        // 클라이언트에서 전송된 로그인 상태 유지 체크박스의 값 받아오기
        // 로그인 유지 체크박스를 누르면 true가 날라오고 안눌르면 false나 null이 날라옴
        String loginStatus = req.getParameter("keep_session");
        System.out.println("상태 체크 : " + loginStatus);

        // 조회
        ResponseMemberDTO response = MemberDAO.selectByEmail(userEmail);
        System.out.println("조회 유저 : " + response);

        ActionTo acto = new ActionTo();
        PrintWriter out = resp.getWriter();

        if(response.getUserPw().equals(encodePw)) {
            System.out.println("로그인 성공");
            // 클라이언트에서 "true"가 전송된 경우
            if(loginStatus != null && loginStatus.equals("true")) {
                // 클라이언트로부터 전송된 요청(request)에 대해 이미 세션이 있는 경우 기존 세션을 반환하거나,
                // 세션이 없는 경우 새로운 세션을 생성하여 반환
                HttpSession session = req.getSession();
                session.setAttribute("loginUser", response.getUserEmail());
                session.setAttribute("userName", response.getUserName());
                acto.setRedirect(false);
                acto.setPath("/app/mainPage/mainPage.jsp");
            } else {
                // 세션 클릭을 안했기 때문에 이거로 처리
                // 로그인은 성공했기 때문이다.
                // 세션과 달리 클라이언트가 브라우저를 닫거나 사이트를 이탈하면 요청 스코프에 설정된 데이터는 사라져서 로그인 유지x
                req.setAttribute("loginUser", userEmail);
                acto.setRedirect(false);
                acto.setPath("/app/mainPage/mainPage.jsp");
            }
        } else {
            out.print("<script>");
            out.print("alert('로그인 실패하셨습니다.')");
            out.print("location.href = '"+req.getContextPath()+"/app/member/signIn_form.jsp';");
            out.print("</script>");
        }
        out.close();
        return acto;
    }
}
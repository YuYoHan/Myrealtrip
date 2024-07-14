package service.member;

import config.action.Action;
import config.action.ActionTo;
import config.passwordEncoder.PasswordEncode;
import dao.member.MemberDAO;
import dto.member.MemberRole;
import dto.member.RequestMemberDTO;
import dto.member.ResponseMemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 회원가입 서비스
public class SignUpService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");

        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        String encodePw = PasswordEncode.encode(userPassword);
        System.out.println("인코딩 비밀번호 : " + encodePw);

        String postCode = req.getParameter("postCode");
        String address = req.getParameter("address");
        String detailAddress = req.getParameter("detailAddress");

        System.out.printf("회원 등록하는 이름은 %s이고 이메일은 %s, 비밀번호는 %s, 주소는 %s\n %s\n %s",
                userName, userEmail, userPassword, postCode, address, detailAddress);

        RequestMemberDTO request = RequestMemberDTO.createMember(userEmail, userName, postCode, address, detailAddress, encodePw);
        int insert = MemberDAO.insert(request, MemberRole.USER);
        System.out.println("등록 성공 여부 : " + (insert > 0 ? "등록 성공" : "등록 싪패"));
        ActionTo acto = new ActionTo();
        if(insert > 0) {
            acto.setRedirect(true);
            acto.setPath("/app/mainPage/mainPage.jsp");
        } else {
            acto.setRedirect(true);
            acto.setPath("/app/member/signUp_form.jsp");
        }
        return acto;
    }
}

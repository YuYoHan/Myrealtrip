package controller.member;

import action.member.*;
import config.action.ActionTo;
import dao.member.MemberDAO;
import dto.member.ResponseMemberDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import exception.member.MemberException;
import service.member.ChangePwService;
import service.member.PwSearchService;
import service.member.SignInService;
import service.member.SignUpService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

public class MemberController extends HttpServlet {
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

        System.out.println(command.equals("/member/signUp.us"));

        // 회원가입하는 페이지로 이동
        if (command.equals("/member/signUp.us")) {
            try {
                acto = new SignUpAction().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 회원가입 기능 처리
        if(command.equals("/member/signUpSuccess.us")) {
            try {
                acto = new SignUpService().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 로그인 페이지 이동
        if(command.equals("/member/signIn.us")) {
            try {
                acto = new SignInAction().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 로그인 기능 처리
        if(command.equals("/member/signInOk.us")) {
            try {
                acto = new SignInService().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 로그아웃하면 인덱스로 이동
        if(command.equals("/member/logOut.us")) {
            try {
                acto = new SignOutAction().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 비밀번호 검색
        if(command.equals("/member/pwSearch.us")) {
            try {
                acto = new PwSearchAction().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 비밀번호 조회 기능
        if(command.equals("/member/pwSearchOk.us")) {
            try {
                acto = new PwSearchService().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 비밀번호 변경 페이지 이동
        if(command.equals("/member/changePw.us")) {
            try {
                acto = new ChangePwAction().execute(req, resp);
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
            }
        }

        // 비밀번호 변경 기능
        if(command.equals("/member/changePwOk.us")) {
            try {
                new ChangePwService();
                System.out.println("경로 확인 : " + acto);
            } catch (Exception e) {
                throw new MemberException(e.getMessage());
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

    // post에서 이렇게 처리하는 이유는 어차피 여기서 결과물 처리를 하지 않을거라서
    // post로 와도 doGet 호출
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = requestURI.substring(contextPath.length());
        // 이메일 중복 검사 체크
        if (command.equals("/member/checkEmail.us")) {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json;charset=UTF-8");

            // 데이터를 문자열로 저장할 StringBuilder 객체를 생성
            StringBuilder sb = new StringBuilder();
            // 이걸 사용하면 HttpServletRequest객체의 getReader()을 사용하여
            // 요청 본문을 읽을 수 있습니다. 클라이언트가 보낸 데이터를 줄 단위로 읽습니다.
            BufferedReader reader = req.getReader();
            System.out.println(reader);
            String line;
            // 청 본문을 한 줄씩 읽어들입니다. readLine() 메서드는 한 줄을 읽어들인 후
            // 해당 줄을 문자열로 반환하며, 더 이상 읽을 줄이 없으면 null을 반환
            while ((line = reader.readLine()) != null) {
                // 읽어들인 각 줄을 StringBuilder 객체에 추가
                sb.append(line);
            }

            // JSON 파싱
            // StringBuilder 객체에 저장된 문자열을 하나의 String 객체로 변환하여 requestBody 변수에 저장
            // 클라이언트가 보낸 전체 JSON 데이터
            String requestBody = sb.toString();
            System.out.println(requestBody);
            // GSON 라이브러리를 사용하여 JSON 문자열 파싱
            // JSON 문자열을 JsonObject로 변환
            JsonObject json = JsonParser.parseString(requestBody).getAsJsonObject();
            System.out.println("json 확인 : " + json);
            // 파싱된 JSON 객체에서 email 필드의 값을 추출하여 저장
            String userEmail = json.get("email").getAsString();
            System.out.println("이메일 중복검사하러 넘어온 데이터 체크 : " + userEmail);
            ResponseMemberDTO response = MemberDAO.selectByEmail(userEmail);
            System.out.println("DB 조회 데이터 : " + response);

            // JSON 응답 생성
            JsonObject jsonResponse = new JsonObject();
            // 조회데이터가 null이면 true, null이 아니면 false가 날라감
            jsonResponse.addProperty("exists", response == null);
            System.out.println(jsonResponse);

            // 응답 전송
            resp.getWriter().write(new Gson().toJson(jsonResponse));
        } else {
            req.setCharacterEncoding("UTF-8");
            doGet(req, resp);
        }
    }
}

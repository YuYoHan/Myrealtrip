package dao.member;

import config.jdbc.ConnectDB;
import config.jdbc.JDBCConfig;
import dto.member.MemberRole;
import dto.member.RequestMemberDTO;
import dto.member.ResponseMemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    // 유저 등록
    public static int insert(RequestMemberDTO member, MemberRole role) {
        String sql = "INSERT INTO users (user_email, user_name, postCode, address, detailAddress, user_role, user_pw) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return ConnectDB.connect(sql, member.getUserEmail(), member.getUserName(),
                member.getPostCode(), member.getAddress(), member.getDetailAddress(),
                role.name(), member.getUserPw());
    }

    // 비밀번호 수정
    public static int changePw(String pw, String email) {
        String sql = "update users set user_pw = ? where user_email = ?";
        return ConnectDB.connect(sql, pw, email);
    }


    // 이메일로 조회
    public static ResponseMemberDTO selectByEmail(String email) {
        String sql = "SELECT * FROM users WHERE user_email = ?";
        ResponseMemberDTO userDTO = null;
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                userDTO = ResponseMemberDTO.builder()
                        .userId(rs.getInt("user_id"))
                        .userEmail(rs.getString("user_email"))
                        .userName(rs.getString("user_name"))
                        .postCode(rs.getString("postCode"))
                        .address(rs.getString("address"))
                        .detailAddress(rs.getString("detailAddress"))
                        .userRole(MemberRole.valueOf(rs.getString("user_role")))
                        .userPw(rs.getString("user_pw"))
                        .build();
                System.out.println(userDTO);
            }
            JDBCConfig.close(rs, preparedStatement, connection);
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return userDTO;
    }


}

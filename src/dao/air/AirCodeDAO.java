package dao.air;

import config.jdbc.JDBCConfig;
import dto.air.AirCodeDTO;
import dto.member.MemberRole;
import dto.member.ResponseMemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AirCodeDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    //항공사 코드 조회
    public static AirCodeDTO selectAirCode(String loc) {
        String sql = "SELECT * FROM air_code WHERE air_code_loc = ?";
        AirCodeDTO airCodeDTO = null;
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, loc);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                airCodeDTO = AirCodeDTO.builder()
                        .airCodeId(rs.getInt("air_code_id"))
                        .airCodeIata(rs.getString("air_code_iata"))
                        .airCodeLoc(rs.getString("air_code_loc"))
                        .airCodeDefaultPrice(rs.getInt("air_code_default_price"))
                        .build();
                System.out.println(airCodeDTO);
            }
            JDBCConfig.close(rs, preparedStatement, connection);
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return airCodeDTO;
    }
}

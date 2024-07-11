package config.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectDB {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    // 등록, 수정, 삭제할 경우 사용할 메서드
    public static int connect(String sql, Object... params) {
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(i+1, params[i]);
            }
            int re = preparedStatement.executeUpdate();
            if(re > 0) {
                System.out.println("실행 성공");
                return re;
            } else {
                System.out.println("실행 실패");
                return -1;
            }
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            try {
                JDBCConfig.close(preparedStatement, connection);
            } catch (Exception e) {
                System.out.println("에러 발생 : " + e.getMessage());
            }
        }
    }

}

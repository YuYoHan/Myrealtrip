package config.search;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchConfig {
    private static Connection connection;
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/myRealTrip";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "1234";

    // 데이터베이스 연결을 반환하는 메서드
    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return connection;
    }

    // 리소스를 해제하는 메서드 (ResultSet, PreparedStatement, Connection)
    public static void close(ResultSet resultSet,
                             PreparedStatement preparedStatement,
                             Connection connection) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
    }

    // 리소스를 해제하는 메서드 (PreparedStatement, Connection)
    public static void close(PreparedStatement preparedStatement,
                             Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
    }

    // 데이터베이스에서 검색 결과를 가져오는 메서드
    public List<SearchDTO> searchInDatabase(String query) throws SQLException {
        List<SearchDTO> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT i.hotel_img_url, h.hotel_name " +
                    "FROM hotelImg i " +
                    "JOIN hotels h ON i.hotel_id = h.hotel_id " +
                    "WHERE h.hotel_name LIKE *?*";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + query + "%");

            rs = pstmt.executeQuery();
            while (rs.next()) {
                SearchDTO item = new SearchDTO();
                item.setHotel_img_url(rs.getString("image_url"));
                item.setHotel_name(rs.getString("title"));
                results.add(item);
            }
        } finally {
            close(rs, pstmt, conn);
        }

        return results;
    }

}


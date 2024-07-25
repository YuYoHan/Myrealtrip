package dao.air;

import config.jdbc.ConnectDB;
import config.jdbc.JDBCConfig;
import dto.air.AirNoticeDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AirNoticesDAO {

    // 공지사항 등록 메서드
    public static int addNotice(AirNoticeDTO notice) {
        String sql = "INSERT INTO air_notices (notice_title, notice_details, admin_id) VALUES (?, ?, ?)";
        return ConnectDB.connect(sql, notice.getAirNoticeTitle(), notice.getAirNoticeDetails(), notice.getAdminId());
    }

    // 공지사항 수정 메서드
    public static int updateNotice(AirNoticeDTO notice) {
        String sql = "UPDATE air_notices SET notice_title = ?, notice_details = ?, notice_updateTime = now() WHERE notice_id = ?";
        return ConnectDB.connect(sql, notice.getAirNoticeTitle(), notice.getAirNoticeDetails(), notice.getAirNoticeId());
    }

    // 공지사항 삭제 메서드
    public static int deleteNotice(long noticeId) {
        String sql = "DELETE FROM air_notices WHERE notice_id = ?";
        return ConnectDB.connect(sql, noticeId);
    }

    // 공지사항 조회 메서드 (단일 조회)
    public static AirNoticeDTO getNotice(int noticeId) {
        String sql = "SELECT * FROM air_notices WHERE notice_id = ?";
        try (Connection connection = JDBCConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setLong(1, noticeId);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    return AirNoticeDTO.builder()
                            .airNoticeId(rs.getInt("notice_id"))
                            .airNoticeTitle(rs.getString("notice_title"))
                            .airNoticeDetails(rs.getString("notice_details"))
                            .airNoticeRegTime(rs.getDate("notice_regTime"))
                            .airNoticeUpdateTime(rs.getDate("notice_updateTime"))
                            .adminId(rs.getString("admin_id"))
                            .build();
                }
            }
        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return null;
    }

    // 공지사항 전체 조회 메서드
    public static List<AirNoticeDTO> getRecentNotices() {
        String sql = "SELECT * " +
                "FROM air_notices " +
                "ORDER BY notice_id DESC " +
                "LIMIT 7; ";
        List<AirNoticeDTO> notices = new ArrayList<>();

        try (Connection connection = JDBCConfig.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                AirNoticeDTO notice = AirNoticeDTO.builder()
                        .airNoticeId(rs.getInt("notice_id"))
                        .airNoticeTitle(rs.getString("notice_title"))
                        .airNoticeDetails(rs.getString("notice_details"))
                        .airNoticeRegTime(rs.getDate("notice_regTime"))
                        .airNoticeUpdateTime(rs.getDate("notice_updateTime"))
                        .adminId(rs.getString("admin_id"))
                        .build();
                notices.add(notice);
            }

        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return notices;
    }

    // 제목으로 조회
    public static List<AirNoticeDTO> getNoticesByTitle(String title) {
        String sql = "SELECT * FROM air_notices WHERE notice_title LIKE ?";
        List<AirNoticeDTO> notices = new ArrayList<>();

        try (Connection connection = JDBCConfig.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // PreparedStatement의 매개변수를 설정
            preparedStatement.setString(1, "%" + title + "%");

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    AirNoticeDTO notice = AirNoticeDTO.builder()
                            .airNoticeId(rs.getInt("notice_id"))
                            .airNoticeTitle(rs.getString("notice_title"))
                            .airNoticeDetails(rs.getString("notice_details"))
                            .airNoticeRegTime(rs.getDate("notice_regTime"))
                            .airNoticeUpdateTime(rs.getDate("notice_updateTime"))
                            .adminId(rs.getString("admin_id"))
                            .build();
                    notices.add(notice);
                }
            }
        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return notices;
    }
    public static List<AirNoticeDTO> getNoticesWithPagination(int page) {
        String sql = "SELECT * FROM air_notices ORDER BY notice_id DESC LIMIT 7 OFFSET ?";
        List<AirNoticeDTO> notices = new ArrayList<>();
        int offset = (page - 1) * 7; // Calculate the offset based on the page number

        try (Connection connection = JDBCConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, offset);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    AirNoticeDTO notice = AirNoticeDTO.builder()
                            .airNoticeId(rs.getInt("notice_id"))
                            .airNoticeTitle(rs.getString("notice_title"))
                            .airNoticeDetails(rs.getString("notice_details"))
                            .airNoticeRegTime(rs.getDate("notice_regTime"))
                            .airNoticeUpdateTime(rs.getDate("notice_updateTime"))
                            .adminId(rs.getString("admin_id"))
                            .build();
                    notices.add(notice);
                }
            }
        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return notices;
    }

    // 공지사항 페이징 처리 조회 메서드
    public static List<AirNoticeDTO> getNoticesWithPagination(int page, int amount) {
        String sql = "SELECT * FROM air_notices ORDER BY notice_id DESC LIMIT ? OFFSET ?";
        List<AirNoticeDTO> notices = new ArrayList<>();
        int offset = (page - 1) * amount;

        try (Connection connection = JDBCConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, amount);
            preparedStatement.setInt(2, offset);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    AirNoticeDTO notice = AirNoticeDTO.builder()
                            .airNoticeId(rs.getInt("notice_id"))
                            .airNoticeTitle(rs.getString("notice_title"))
                            .airNoticeDetails(rs.getString("notice_details"))
                            .airNoticeRegTime(rs.getDate("notice_regTime"))
                            .airNoticeUpdateTime(rs.getDate("notice_updateTime"))
                            .adminId(rs.getString("admin_id"))
                            .build();
                    notices.add(notice);
                }
            }
        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return notices;
    }

    // 공지사항 총 개수 조회 메서드
    public static int getTotalNoticesCount() {
        String sql = "SELECT COUNT(*) FROM air_notices";
        try (Connection connection = JDBCConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return 0;
    }
}

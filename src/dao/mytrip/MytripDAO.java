package dao.mytrip;

import config.jdbc.JDBCConfig;
import dto.mytrip.MyTripRoomDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MytripDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    // 결제한 방 조회
    public static List<MyTripRoomDTO> selectRoomsById(int userId) {
        String sql = "SELECT rr.room_id, h.dateFilter, h.hotelImg, h.hotelName, h.user_id, rr.room_reservations_total_price " +
                "FROM hotelPay h " +
                "JOIN room_reservations rr ON h.user_id = rr.user_id " + // Assuming there's a relationship
                "WHERE h.user_id = ?";
        List<MyTripRoomDTO> myRooms = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                MyTripRoomDTO room = MyTripRoomDTO.builder()
                        .roomId(rs.getInt("room_id"))
                        .dateFilter(rs.getString("dateFilter"))
                        .hotelImg(rs.getString("hotelImg"))
                        .hotelName(rs.getString("hotelName"))
                        .userId(rs.getInt("user_id"))
                        .hotelPrice(rs.getString("room_reservations_total_price"))
                        .build();
                System.out.println(room);
                myRooms.add(room);
            }
            JDBCConfig.close(rs, preparedStatement, connection);
        } catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return myRooms;
    }
}
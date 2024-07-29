package dao.hotel;

import config.jdbc.JDBCConfig;
import dto.air.AirCodeDTO;
import dto.hotel.HotelBannerDTO;
import dto.hotel.RoomsDTO;
import exception.hotel.HotelException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static List<RoomsDTO> roomList(int hotelId) {
        String sql = "select * from rooms where hotel_id = ?";
        List<RoomsDTO> list = new ArrayList<RoomsDTO>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,hotelId);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                RoomsDTO room  = RoomsDTO.builder()
                        .roomId(rs.getInt("room_Id"))
                        .roomStatus(rs.getString("room_status"))
                        .roomCount(rs.getInt("room_count"))
                        .optionOthers(rs.getString("option_others"))
                        .hotelId(rs.getInt("hotel_id"))
                        .build();
                System.out.println(room);
                list.add(room);
            }
        } catch (Exception e) {
            System.out.println("룸 이미지 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return list;
    }

    public static RoomsDTO getRoom(int roomId) {
        String sql = "select * from rooms where room_id = ?";
        RoomsDTO room = null;
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, roomId);
            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                 room  = RoomsDTO.builder()
                        .roomId(rs.getInt("room_Id"))
                        .roomStatus(rs.getString("room_status"))
                        .roomCount(rs.getInt("room_count"))
                        .optionOthers(rs.getString("option_others"))
                        .hotelId(rs.getInt("hotel_id"))
                        .build();
                System.out.println(room);
            }
        } catch (Exception e) {
            System.out.println("룸 이미지 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return room;
    }

    public static List<RoomsDTO> hotelRoomList(String hotelCity) {
        String sql = "SELECT * "
                + "FROM rooms "
                + "WHERE hotel_id IN ("
                + "SELECT hotel_id "
                + "FROM hotels "
                + "WHERE hotel_city = ?)";

        List<RoomsDTO> list = new ArrayList<RoomsDTO>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,hotelCity);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                RoomsDTO room  = RoomsDTO.builder()
                        .roomId(rs.getInt("room_Id"))
                        .roomStatus(rs.getString("room_status"))
                        .roomCount(rs.getInt("room_count"))
                        .optionOthers(rs.getString("option_others"))
                        .hotelId(rs.getInt("hotel_id"))
                        .build();
                System.out.println(room);
                list.add(room);
            }
        } catch (Exception e) {
            System.out.println("룸 이미지 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return list;
    }

}

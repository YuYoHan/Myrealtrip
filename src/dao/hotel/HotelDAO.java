package dao.hotel;

import config.jdbc.JDBCConfig;
import dto.hotel.*;
import exception.hotel.HotelException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    // 전체 hotel 사진을 보여주기 위해서 DB 조회해서 가져옴
    public static List<HotelListDTO> hotelBannerList() {
        String sql = "SELECT h.hotel_id, h.hotel_name, hi.hotel_img_url, h.hotel_city, "
                + "MIN(CAST(r.room_price AS DECIMAL(10, 0))) AS lowest_room_price "
                + "FROM hotels h JOIN hotelimg hi "
                + "ON h.hotel_id = hi.hotel_id "
                + "JOIN rooms r "
                + "ON h.hotel_id = r.hotel_id "
                + "GROUP BY h.hotel_id, h.hotel_name, hi.hotel_img_url, h.hotel_city "
                + "ORDER BY h.hotel_id";
        List<HotelListDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                HotelListDTO hotel = new HotelListDTO();
                hotel.setHotelID(rs.getInt("hotel_id"));
                hotel.setHotelName(rs.getString("hotel_name"));
                hotel.setHotelImgURL(rs.getString("hotel_img_url"));
                hotel.setHotelCity(rs.getString("hotel_city"));
                hotel.setRoomMinPrice(rs.getString("lowest_room_price"));

                list.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("전체 호텔 리스트 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        System.out.println(list);
        return list;
    }

    public static List<HotelListDTO> hotelCityList(String hotelCity) {
        String sql = "SELECT h.hotel_id, h.hotel_name, hi.hotel_img_url, h.hotel_city, "
                + "MIN(CAST(r.room_price AS DECIMAL(10, 0))) AS lowest_room_price "
                + "FROM hotels h JOIN hotelimg hi "
                + "ON h.hotel_id = hi.hotel_id "
                + "JOIN rooms r "
                + "ON h.hotel_id = r.hotel_id "
                + "WHERE h.hotel_city = ?"
                + "GROUP BY h.hotel_id, h.hotel_name, hi.hotel_img_url, h.hotel_city "
                + "ORDER BY h.hotel_id";
        List<HotelListDTO> list = new ArrayList<>();
        try {

            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, hotelCity);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                HotelListDTO hotel = new HotelListDTO();
                hotel.setHotelID(rs.getInt("hotel_id"));
                hotel.setHotelName(rs.getString("hotel_name"));
                hotel.setHotelImgURL(rs.getString("hotel_img_url"));
                hotel.setHotelCity(rs.getString("hotel_city"));
                hotel.setRoomMinPrice(rs.getString("lowest_room_price"));

                list.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("호텔 리스트 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        System.out.println(list);
        return list;
    }

    public static List<HotelDetailDTO> hotelDetail(String hotelName) {
        String sql = "SELECT "
                + "h.hotel_name, "
                + "hi.hotel_img_url, "
                + "h.hotel_location, "
                + "h.hotel_info, "
                + "r.room_name, "
                + "ri.room_img_url, "
                + "r.room_count, "
                + "r.room_price, "
                + "r.option_others "
                + "FROM hotels h JOIN hotelimg hi "
                + "ON h.hotel_id = hi.hotel_id "
                + "JOIN rooms r "
                + "ON h.hotel_id = r.hotel_id "
                + "LEFT JOIN roomimg ri "
                + "ON r.room_id = ri.room_id "
                + "WHERE h.hotel_name = '"+hotelName+"'"
                + "ORDER BY h.hotel_id, r.room_id";

        List<HotelDetailDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                HotelDetailDTO hotel = new HotelDetailDTO();
                hotel.setHotelName(rs.getString("hotel_name"));
                hotel.setHotelImgURL(rs.getString("hotel_img_url"));
                hotel.setHotelLocation(rs.getString("hotel_location"));
                hotel.setHotelInfo(rs.getString("hotel_info"));
                hotel.setRoomImgURL(rs.getString("room_img_url"));
                hotel.setRoomCount(rs.getInt("room_count"));
                hotel.setRoomPrice(rs.getString("room_price"));
                hotel.setHotelLocation(rs.getString("hotel_location"));
                hotel.setHotelInfo(rs.getString("hotel_info"));

                list.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("전체 호텔 리스트 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        System.out.println(list);
        return list;
    }

    public static HotelsDTO getHotel(int hotelId) {
        String sql = "select * from hotels where hotel_id = ?";
        HotelsDTO hotel = null;
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,hotelId);
            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                hotel  = HotelsDTO.builder()
                        .hotelId(rs.getInt("hotel_id"))
                        .hotelName(rs.getString("hotel_name"))
                        .hotelLocation(rs.getString("hotel_location"))
                        .hotelInfo(rs.getString("hotel_info"))
                        .adminId(rs.getInt("admin_id"))
                        .build();
                System.out.println(hotel);
            }
        } catch (Exception e) {
            System.out.println("룸 이미지 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return hotel;
    }


}

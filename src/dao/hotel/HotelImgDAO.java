package dao.hotel;

import config.jdbc.JDBCConfig;
import dto.hotel.HotelImgDTO;
import dto.hotel.RoomsDTO;
import exception.hotel.HotelException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelImgDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static List<HotelImgDTO> getHotelImgList(int hotelId) {
        String sql = "select * from hotelImg where hotel_id = ?";
        List<HotelImgDTO> list = new ArrayList<HotelImgDTO>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,hotelId);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                HotelImgDTO hotel  = HotelImgDTO.builder()
                        .hotelImgId(rs.getInt("hotel_img_id"))
                        .hotelImgUrl(rs.getString("hotel_img_url"))
                        .hotelId(rs.getInt("hotel_id"))
                        .build();
                System.out.println(hotel);
                list.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("호텔 이미지 가져오는거 실패 : " + e.getMessage());
            throw new HotelException(e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return list;
    }
}

package dao.hotel;

import config.jdbc.JDBCConfig;
import dto.hotel.HotelBannerDTO;
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

    // hotel 사진을 보여주기 위해서 DB 조회해서 가져옴
    public static List<HotelBannerDTO> hotelBannerList() {
        String sql = "select * from hotels";
        List<HotelBannerDTO> list = new ArrayList<HotelBannerDTO>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                HotelBannerDTO hotel = new HotelBannerDTO();
                hotel.setHotelId(rs.getInt("hotel_id"));
                hotel.setHotelName(rs.getString("hotel_name"));
                hotel.setHotelAddress(rs.getString("hotel_location"));
                hotel.setHotelInfo(rs.getString("hotel_info"));

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

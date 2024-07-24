package dao.mainPage;


import config.jdbc.JDBCConfig;
import dto.mainPage.MainBannerDTO;
import dto.mainPage.RePlaceDTO;
import dto.mainPage.TravelCardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// 메인 페이지 이미지 조회해오는 DAO
public class MainDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    // travelCard 조회
    public static List<RePlaceDTO> placeList() {
        String sql = "select place_image from recommendedPlace";
        List<RePlaceDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                RePlaceDTO rePlaceDTO = new RePlaceDTO();
//                rePlaceDTO.setPlaceId(rs.getInt("place_id"));
//                rePlaceDTO.setPlaceTitle(rs.getString("place_title"));
//                rePlaceDTO.setPlaceContents(rs.getString("place_contents"));
                rePlaceDTO.setPlaceImage(rs.getString("place_image"));
                list.add(rePlaceDTO);
            }
            JDBCConfig.close(rs, preparedStatement, connection);
        }catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return list;
    }

    // travelCard 조회
    public static List<TravelCardDTO> cardList() {
        String sql = "select card_id, title, contents, travel_image from travelCard";
        List<TravelCardDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                TravelCardDTO travelCardDTO = new TravelCardDTO();
                travelCardDTO.setId(rs.getInt("card_id"));
                travelCardDTO.setTitle(rs.getString("title"));
                travelCardDTO.setContents(rs.getString("contents"));
                travelCardDTO.setTravelImage(rs.getString("travel_image"));
                list.add(travelCardDTO);
            }
            JDBCConfig.close(rs, preparedStatement, connection);
        }catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        }
        return list;
    }

    // mainBanner 조회
    public static List<MainBannerDTO> bannerList() {
        String sql = "SELECT bannerURL, bannerImage FROM mainBanner";
        List<MainBannerDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                MainBannerDTO mainBannerDTO = new MainBannerDTO();
                mainBannerDTO.setBannerURL(rs.getString("bannerURL"));
                mainBannerDTO.setBannerImage(rs.getString("bannerImage"));
                list.add(mainBannerDTO);
            }
        }catch (Exception e) {
            System.out.println("에러 발생 : " + e.getMessage());
        } finally {
            try {
                JDBCConfig.close(rs, preparedStatement, connection);
            } catch (Exception e) {
                System.out.println("에러 발생 : " + e.getMessage());
            }
        }
        return list;
    }
}

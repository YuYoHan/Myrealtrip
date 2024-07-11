package dao.mainPage;


import config.jdbc.JDBCConfig;
import dto.mainPage.MainBannerDTO;
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
    public static List<TravelCardDTO> cardList() {
        String sql = "select * from travelCard";
        List<TravelCardDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            TravelCardDTO travelCardDTO = new TravelCardDTO();
            while (rs.next()) {
                travelCardDTO.setTitle(rs.getString("title"));
                travelCardDTO.setTitle(rs.getString("contents"));
                travelCardDTO.setTitle(rs.getString("travel_image"));
                list.add(travelCardDTO);
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

    // mainBanner 조회
    public static List<MainBannerDTO> bannerList() {
        String sql = "select * from mainbanner";
        List<MainBannerDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            MainBannerDTO mainBannerDTO = new MainBannerDTO();
            while (rs.next()) {
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

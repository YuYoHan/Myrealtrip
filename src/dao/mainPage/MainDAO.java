package dao.mainPage;


import config.jdbc.JDBCConfig;
import dto.mainPage.*;

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
        String sql = "select place_id,place_title,place_contents,place_image from recommendedPlace";
        List<RePlaceDTO> list = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                RePlaceDTO rePlaceDTO = new RePlaceDTO();
                rePlaceDTO.setPlaceId(rs.getInt("place_id"));
                rePlaceDTO.setPlaceTitle(rs.getString("place_title"));
                rePlaceDTO.setPlaceContents(rs.getString("place_contents"));
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

    public static MainDetailDTO mainDetail(int placeId){
        String sql = "select mainDetail_title, mainDetail_price, mainDetail_option, content_image, content " +
                "from mainDetail where place_id =" + placeId;
//        List<MainDetailDTO> list = new ArrayList<>();
        MainDetailDTO mainDetailDTO = new MainDetailDTO();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
;           rs = preparedStatement.executeQuery();
            while (rs.next()){
//                MainDetailDTO mainDetailDTO = new MainDetailDTO();
                mainDetailDTO.setMainDetailTitle(rs.getString("mainDetail_title"));
                mainDetailDTO.setMainDetailPrice(rs.getString("mainDetail_price"));
                mainDetailDTO.setMainDetailOption(rs.getString("mainDetail_option"));
                mainDetailDTO.setContentImage(rs.getString("content_image"));
                mainDetailDTO.setContent(rs.getString("content"));
//                list.add(mainDetailDTO);

            }

        }catch (Exception e){
            System.out.println("에러발생:"+e.getMessage());
        }finally {
            try {
                JDBCConfig.close(rs, preparedStatement, connection);
            }catch (Exception e){
                System.out.println("에러발생:"+e.getMessage());
            }

        }
        return mainDetailDTO;
    }

    public static CardDetailDTO cardDetail(String cardTitle) {
        String sql = "SELECT cardTitle, cardImage1, cardImage2, cardImage3, cardImage4 " +
                "FROM cardDetail WHERE cardTitle = ?";
        CardDetailDTO cardDetailDTO = new CardDetailDTO();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cardTitle);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                cardDetailDTO.setCardTitle(rs.getString("cardTitle"));
                cardDetailDTO.setCardImage1(rs.getString("cardImage1"));
                cardDetailDTO.setCardImage2(rs.getString("cardImage2"));
                cardDetailDTO.setCardImage3(rs.getString("cardImage3"));
                cardDetailDTO.setCardImage4(rs.getString("cardImage4"));
            }
        } catch (Exception e) {
            System.out.println("에러발생:" + e.getMessage());
        } finally {
            try {
                JDBCConfig.close(rs, preparedStatement, connection);
            } catch (Exception e) {
                System.out.println("에러발생:" + e.getMessage());
            }
        }
        return cardDetailDTO;
    }


}

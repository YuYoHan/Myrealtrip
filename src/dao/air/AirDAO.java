package dao.air;

import config.jdbc.JDBCConfig;
import dto.air.AirBannerDTO;
import dto.air.PlaceImgDTO;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AirDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static NodeList getAirApi() {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList"); /*URL*/
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=IfJN7A3cBBPttYf%2FFcFWC8pNDT3mi3SRSsDJmyAXQAUOlqvkQhP4ggZkHzhacIhEEJzcswWo8fraVeUBAOxQng%3D%3D&"); /*Service Key*/
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() > 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            System.out.println(sb.toString());

            BufferedInputStream xmlData = new BufferedInputStream(url.openStream());
            Document document = builder.parse(xmlData);
            Element root = document.getDocumentElement();
            NodeList nodes = root.getElementsByTagName("items");
            return nodes;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    // 비행기 자석수 가져오기
    public static int getCount() {
        String sql = "select airplane_capacity from operations";
        int capacity = 0;
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // 좌석수
                capacity = rs.getInt("airplane_capacity");
                System.out.println("좌석수 :" + capacity);
            }
        } catch (Exception e) {
            System.out.println("에러발생 : " + e.getMessage());
        }
        return capacity;
    }


    // 항공권 배너 데이터 가져오기
    public static List<AirBannerDTO> searchBannerList() {
        String sql = "select place_id , place_title, place_image from recommendedPlace";
        List<AirBannerDTO> bannerList = new ArrayList<>();
        try {
            connection = JDBCConfig.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                AirBannerDTO air = AirBannerDTO.builder()
                        .placeId(rs.getInt("place_id"))
                        .placeName(rs.getString("place_title"))
                        .imageUrl(rs.getString("place_image"))
                        .build();
                System.out.println("배너 상세페이지 : " + air);
                bannerList.add(air);
            }
        } catch (Exception e) {
            System.out.println("에러발생 : " + e.getMessage());
        } finally {
            JDBCConfig.close(rs, preparedStatement, connection);
        }
        return bannerList;
    }
}

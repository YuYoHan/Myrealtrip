package dao.air;

import config.jdbc.JDBCConfig;
import dto.air.AirBannerDTO;
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
import java.nio.charset.StandardCharsets;
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
            // doument instance를 생성
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 인스턴스의 메소드를 실행, 이 빌더를 통해 xml로 가져온 데이터를 document타입으로 가공한다.
            DocumentBuilder builder = factory.newDocumentBuilder();
            // buffer타입의 객체를 생성하고
            // 가져오고자 하는 요청 주소를 추가
            StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList"); /*URL*/
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", StandardCharsets.UTF_8) + "=xVjkj6OejHpsNyP2LyreYZ%2FlRcLySeNLy6UGXbjGw2MhON7pLpzkGUHS2OLC6fQxP4XK5jlAz%2FlzIog0l2TNZw%3D%3D"); /*Service Key*/
            //URL 객체로 해당 stringbuffer를 넘겨주고
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() < 300) {
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

            // bufferinputStream객체로 생성하면 가져오기 완료
            BufferedInputStream xmlData = new BufferedInputStream(url.openStream());
            // 가져온 데이터는 builder를 통해 parse메소드로 넘겨주면 document타입이 된다.
            Document document = builder.parse(xmlData);
            // xml의 요소를 가져오려면 getDocumentElement메소드를 사용한다.
            Element root = document.getDocumentElement();
            // xml의 요소는 node요소이다. 우리가 원하는 데이터들은 xml의 item에 들어있으니
            // NodeList 객체 타입으로 list변수에 넣어주자.
            NodeList nodes = root.getElementsByTagName("item");
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

package dao.air;

import config.jdbc.JDBCConfig;
import dto.air.AirBannerDTO;
import dto.air.InternationalOperation;
import dto.air.PlaceImgDTO;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import util.XMLUtility;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
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
            // doument instance를 생성
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            // 인스턴스의 메소드를 실행, 이 빌더를 통해 xml로 가져온 데이터를 document타입으로 가공한다.
            DocumentBuilder builder = factory.newDocumentBuilder();
            // buffer타입의 객체를 생성하고
            // 가져오고자 하는 요청 주소를 추가
            StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList"); /*URL*/
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=IfJN7A3cBBPttYf%2FFcFWC8pNDT3mi3SRSsDJmyAXQAUOlqvkQhP4ggZkHzhacIhEEJzcswWo8fraVeUBAOxQng%3D%3D&"); /*Service Key*/
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

    /**
     * 국제선 정보를 가져오는 메서드
     *
     * @param from 출발지 코드
     * @param to 도착지 코드
     * @param date 검색 날짜
     * @param internationalIoType 입출국
     * @return 국제선 정보 리스트
     * @throws IOException 입출력 예외 발생 시
     */
    public static ArrayList<InternationalOperation> getInternationalAir(String from, String to, String date, String internationalIoType) throws IOException {
        // URL 빌더를 사용해 API 요청 URL 생성
        StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=xVjkj6OejHpsNyP2LyreYZ%2FlRcLySeNLy6UGXbjGw2MhON7pLpzkGUHS2OLC6fQxP4XK5jlAz%2FlzIog0l2TNZw%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("schDate", "UTF-8") + "=" + URLEncoder.encode(date, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("schDeptCityCode", "UTF-8") + "=" + URLEncoder.encode(from, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("schArrvCityCode", "UTF-8") + "=" + URLEncoder.encode(to, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));

        // URL 객체를 생성 및 연결 설정
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        // 응답 코드에 따라 입력 스트림을 설정
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        // 응답 내용을 읽어서 문자열로 저장
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        // XML을 파싱하여 결과 반환
        ArrayList<InternationalOperation> result = XMLUtility.parseXML(sb.toString(), AirDAO::createInternationalOperation);

        // 필터링 로직 추가
        if (result != null) {
            if (internationalIoType != null && !"".equals(internationalIoType)) {
                if (internationalIoType.equals("IN")) {
                    result.removeIf(operation -> !"IN".equals(operation.getInternationalIoType()));
                } else if (internationalIoType.equals("OUT")) {
                    result.removeIf(operation -> !"OUT".equals(operation.getInternationalIoType()));
                }
            }
        }

        return !result.isEmpty() ? result : new ArrayList<>();
    }

    /**
     * XML 데이터를 기반으로 InternationalOperation 객체를 생성하는 메서드
     *
     * @param elem XML 엘리먼트
     * @return InternationalOperation 객체
     */
    private static InternationalOperation createInternationalOperation(Element elem) {
        String airlineKorean = XMLUtility.getTagValue("airlineKorean", elem);
        String airport = XMLUtility.getTagValue("airport", elem);
        String city = XMLUtility.getTagValue("city", elem);
        String internationalIoType = XMLUtility.getTagValue("internationalIoType", elem);
        String internationalTime = XMLUtility.getTagValue("internationalTime", elem);

        return InternationalOperation.builder()
                .airlineKorean(airlineKorean)
                .airport(airport)
                .city(city)
                .internationalIoType(internationalIoType)
                .internationalTime(internationalTime)
                .build();
    }

    public static void main(String[] args) {
        try {
            // 국제선 정보를 가져와 출력
            System.out.println("\n국제선 정보:");
            ArrayList<InternationalOperation> internationalOperations = getInternationalAir("GMP", "HND", "20240725", "OUT");
            if (internationalOperations.isEmpty()) {
                System.out.println("국제선 정보를 찾을 수 없습니다.");
            } else {
                for (InternationalOperation operation : internationalOperations) {
                    System.out.println(operation);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

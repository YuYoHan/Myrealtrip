import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {
        String url = "https://accommodation.myrealtrip.com/union/products?checkIn=2024-07-17&checkOut=2024-07-19&adultCount=2&childCount=0&childAges=&infantCount=0&infantAges=&regionId=2573&keyword=%EC%84%9C%EC%9A%B8&roomCount=1"; // 마이리얼트립 숙소 페이지 URL
        try {
            Document doc = Jsoup.connect(url).get();
            Elements lodgings = doc.select("div"); // 적절한 CSS 선택자를 사용하세요
            System.out.println(lodgings);

            Connection connection = getConnection();
            String sql = "INSERT INTO lodgings (title, price, link, image) VALUES (?, ?, ?, ?)";
            System.out.println(sql);
            PreparedStatement statement = connection.prepareStatement(sql);

            for (Element lodging : lodgings) {
                String title = lodging.select(".lodging-title").text();
                String price = lodging.select(".lodging-price").text();
                String link = lodging.select("a").attr("href");
                String image = lodging.select("img").attr("src");

                System.out.println(title);
                System.out.println(price);
                System.out.println(link);
                System.out.println(image);

                statement.setString(1, title);
                statement.setString(2, price);
                statement.setString(3, link);
                statement.setString(4, image);
                statement.executeUpdate();
            }

            statement.close();
            connection.close();

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }

    private static Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:mysql://localhost:3306/ch";
        String dbUser = "root";
        String dbPassword = "1234";

        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }
}
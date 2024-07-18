package dao.pay;

import config.jdbc.ConnectDB;
import dto.member.MemberRole;
import dto.member.RequestMemberDTO;
import dto.pay.AirPaymentDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static int pay(int price, String bankName) {
        String sql = "insert into pay(final_pay,pay_bank) values(?,?)";
        return ConnectDB.connect(sql, price, bankName);
    }

    // 항공 결제
    public static int airPay(AirPaymentDTO pay) {
        String sql = "insert into airPay(dateFilter, airLine, airNum, departure, arrive)";
        return ConnectDB.connect(
                sql,
                pay.getDateFilter(),
                pay.getAirLine(),
                pay.getAirNum(),
                pay.getDeparture());
    }
}

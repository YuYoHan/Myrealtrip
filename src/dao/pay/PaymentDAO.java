package dao.pay;

import com.sun.tools.javac.Main;
import config.jdbc.ConnectDB;
import config.jdbc.JDBCConfig;
import dto.air.AirPayDTO;
import dto.air.AirplaneReservationsDTO;
import dto.air.AirplanesDTO;
import dto.air.OperationsDTO;
import dto.pay.AirPaymentDTO;

import java.sql.*;

import dto.air.OperationsDTO;
import dto.pay.HotelPaymentDTO;
import dto.pay.PayDTO;

public class PaymentDAO {
    public static Connection connection;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static int pay(int price, String bankName) {
        String sql = "insert into pay(final_pay,pay_bank) values(?,?)";
        return ConnectDB.connect(sql, price, bankName);
    }

    // 항공 결제\
    public static int airPay(AirPaymentDTO pay) {
        String sql = "insert into airPay(dateFilter, airLine, airNum, departure, arrive) values (?, ?, ?, ?, ?)";
        return ConnectDB.connect(
                sql,
                pay.getDateFilter(),
                pay.getAirLine(),
                pay.getAirNum(),
                pay.getDeparture(),
                pay.getArrive()
        );
    }

    public static int hotelPay(HotelPaymentDTO pay) {
        String sql = "insert into hotelPay(dateFilter, hotelName, hotelImg, user_id, room_reservations_id) values (?, ?, ?, ?, ?)";
        return ConnectDB.connect(
                sql,
                pay.getDateFilter(),
                pay.getHotelName(),
                pay.getHotelImg(),
                pay.getUserId(),
                pay.getRoomReservationId()
        );
    }

    public static int pay(PayDTO pay){
        String sql = "insert into pay(final_pay, pay_bank, pay_date, air_pay_id, hotel_pay_id) values (?, ?, ?, ?, ?)";
        return ConnectDB.connect(
                sql,
                pay.getFinalPay(),
                pay.getPayBank(),
                pay.getPayDate(),
                pay.getAirPayId(),
                pay.getHotelPayId()
        );
    }

    public static void payReservation(HotelPaymentDTO hotelPaymentDTO, PayDTO payDTO) {
        Connection connection = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs = null;

        try {
            connection = JDBCConfig.getConnection();
            connection.setAutoCommit(false); // Start transaction
            // Insert into airPay table
            String sql4 = "INSERT INTO hotelPay (dateFilter, hotelName, hotelImg, user_id, room_reservation_id) VALUES ( ?,?, ?, ?, ?)";
            pstmt1 = connection.prepareStatement(sql4,Statement.RETURN_GENERATED_KEYS);
            pstmt1.setString(1, hotelPaymentDTO.getDateFilter());
            pstmt1.setString(2, hotelPaymentDTO.getHotelName());
            pstmt1.setString(3, hotelPaymentDTO.getHotelImg());
            pstmt1.setInt(4, hotelPaymentDTO.getUserId());
            pstmt1.setInt(5, hotelPaymentDTO.getRoomReservationId());
            pstmt1.executeUpdate();
            rs = pstmt1.getGeneratedKeys();
            int airPayKey = -1;
            if(rs.next()) {
                airPayKey = rs.getInt(1);
            }
            payDTO.setAirPayId(airPayKey);
            pay(payDTO);


            connection.commit(); // Commit transaction
            System.out.println("All data inserted successfully.");

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback transaction on error
                    System.out.println("Transaction rolled back.");
                } catch (SQLException ex) {
                    System.out.println("Error during rollback: " + ex.getMessage());
                }
            }
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt1 != null) pstmt1.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

    }




    public static void payReservation(AirplaneReservationsDTO airplaneReservations, OperationsDTO operations1, OperationsDTO operations2,
                                  AirplanesDTO airplanes1, AirplanesDTO airplanes2, AirPayDTO airPay, PayDTO pay) {
        Connection connection = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2_1 = null;
        PreparedStatement pstmt2_2 = null;
        PreparedStatement pstmt3_1 = null;
        PreparedStatement pstmt3_2 = null;
        PreparedStatement pstmt4 = null;
        ResultSet rs = null;

        try {
            connection = JDBCConfig.getConnection();
            connection.setAutoCommit(false); // Start transaction

            // Insert into the first airplanes table
            String sql3_1 = "INSERT INTO airplanes (airplane_model, airplane_company, airport_id) VALUES (?, ?, ?)";
            pstmt3_1 = connection.prepareStatement(sql3_1, Statement.RETURN_GENERATED_KEYS);
            pstmt3_1.setString(1, airplanes1.getAirplaneModel());
            pstmt3_1.setString(2, airplanes1.getAirplaneCompany());
            pstmt3_1.setInt(3, airplanes1.getAirportId());      // 공항코드임 당장 값이 없어.
            pstmt3_1.executeUpdate();
            rs = pstmt3_1.getGeneratedKeys();
            int airplaneId1 = -1;
            if (rs.next()) {
                airplaneId1 = rs.getInt(1);
            }
            rs.close();

            // Insert into the second airplanes table
            String sql3_2 = "INSERT INTO airplanes (airplane_model, airplane_company, airport_id) VALUES (?, ?, ?)";
            pstmt3_2 = connection.prepareStatement(sql3_2, Statement.RETURN_GENERATED_KEYS);
            pstmt3_2.setString(1, airplanes2.getAirplaneModel());
            pstmt3_2.setString(2, airplanes2.getAirplaneCompany());
            pstmt3_2.setInt(3, airplanes2.getAirportId());
            pstmt3_2.executeUpdate();
            rs = pstmt3_2.getGeneratedKeys();
            int airplaneId2 = -1;
            if (rs.next()) {
                airplaneId2 = rs.getInt(1);
            }
            rs.close();

            // Insert into the first operations table
            String sql2_1 = "INSERT INTO operations (operation_num, operation_price, operation_departureTime, operation_arriveTime, operation_departure_area, operation_arrive_area, airplane_capacity, airplane_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt2_1 = connection.prepareStatement(sql2_1, Statement.RETURN_GENERATED_KEYS);
            pstmt2_1.setString(1, operations1.getOperationNum());
            pstmt2_1.setString(2, operations1.getOperationPrice());
            pstmt2_1.setTimestamp(3, new Timestamp(operations1.getOperationDepartureTime().getTime()));
            pstmt2_1.setTimestamp(4, new Timestamp(operations1.getOperationArriveTime().getTime()));
            pstmt2_1.setString(5, operations1.getOperationDepartureArea());
            pstmt2_1.setString(6, operations1.getOperationArriveArea());
            pstmt2_1.setInt(7, operations1.getAirplaneCapacity());
            pstmt2_1.setInt(8, airplaneId1);
            pstmt2_1.executeUpdate();
            rs = pstmt2_1.getGeneratedKeys();
            int operationId1 = -1;
            if (rs.next()) {
                operationId1 = rs.getInt(1);
            }
            rs.close();

            // Insert into the second operations table
            String sql2_2 = "INSERT INTO operations (operation_num, operation_price, operation_departureTime, operation_arriveTime, operation_departure_area, operation_arrive_area, airplane_capacity, airplane_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt2_2 = connection.prepareStatement(sql2_2, Statement.RETURN_GENERATED_KEYS);
            pstmt2_2.setString(1, operations2.getOperationNum());
            pstmt2_2.setString(2, operations2.getOperationPrice());
            pstmt2_2.setTimestamp(3, new Timestamp(operations2.getOperationDepartureTime().getTime()));
            pstmt2_2.setTimestamp(4, new Timestamp(operations2.getOperationArriveTime().getTime()));
            pstmt2_2.setString(5, operations2.getOperationDepartureArea());
            pstmt2_2.setString(6, operations2.getOperationArriveArea());
            pstmt2_2.setInt(7, operations2.getAirplaneCapacity());
            pstmt2_2.setInt(8, airplaneId2);
            pstmt2_2.executeUpdate();
            rs = pstmt2_2.getGeneratedKeys();
            int operationId2 = -1;
            if (rs.next()) {
                operationId2 = rs.getInt(1);
            }
            rs.close();

            // Insert into airplane_reservations table
            String sql1 = "INSERT INTO airplane_reservations (airplane_reservation_regTime, airplane_pay, in_airplane_id, out_airplane_id, user_id,peopleCount) VALUES (now(), ?, ?, ?, ?,?)";
            pstmt1 = connection.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            pstmt1.setString(1, airplaneReservations.getAirplanePay());
            pstmt1.setInt(2, airplaneId1);
            pstmt1.setInt(3, airplaneId2);
            pstmt1.setInt(4, airplaneReservations.getUserId());
            pstmt1.setInt(5, airplaneReservations.getPeopleCount());
            pstmt1.executeUpdate();
            rs = pstmt1.getGeneratedKeys();
            int airplaneReservationId = -1;
            if (rs.next()) {
                airplaneReservationId = rs.getInt(1);
            }
            rs.close();

            // Insert into airPay table
            String sql4 = "INSERT INTO airPay (dateFilter, airLine, airNum, departure, arrive, user_id, airplane_reservation_id) VALUES ( now(),?, ?, ?, ?, ?, ?)";
            pstmt4 = connection.prepareStatement(sql4,Statement.RETURN_GENERATED_KEYS);
            pstmt4.setString(1, airPay.getAirLine());
            pstmt4.setString(2, airPay.getAirNum());
            pstmt4.setString(3, airPay.getDeparture());
            pstmt4.setString(4, airPay.getArrive());
            pstmt4.setInt(5, airPay.getUserId());
            pstmt4.setInt(6, airplaneReservationId);
            pstmt4.executeUpdate();
            rs = pstmt4.getGeneratedKeys();
            int airPayKey = -1;
            if(rs.next()) {
                airPayKey = rs.getInt(1);
            }
            pay.setAirPayId(airPayKey);
            pay(pay);


            connection.commit(); // Commit transaction
            System.out.println("All data inserted successfully.");

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback transaction on error
                    System.out.println("Transaction rolled back.");
                } catch (SQLException ex) {
                    System.out.println("Error during rollback: " + ex.getMessage());
                }
            }
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt1 != null) pstmt1.close();
                if (pstmt2_1 != null) pstmt2_1.close();
                if (pstmt2_2 != null) pstmt2_2.close();
                if (pstmt3_1 != null) pstmt3_1.close();
                if (pstmt3_2 != null) pstmt3_2.close();
                if (pstmt4 != null) pstmt4.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

    }
}


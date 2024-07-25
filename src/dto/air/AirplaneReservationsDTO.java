package dto.air;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirplaneReservationsDTO {
    private int airplaneReservationId;
    private Timestamp airplaneReservationRegTime;
    private String airplanePay;
    private int inAirplaneId;
    private int outAirplaneId;
    private int userId;

}

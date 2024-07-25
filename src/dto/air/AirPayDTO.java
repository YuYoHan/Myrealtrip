package dto.air;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirPayDTO {
    private int airPayId;
    private String dateFilter;
    private String airLine;
    private String airNum;
    private String departure;
    private String arrive;
    private int userId;
    private int airplaneReservationId;
}

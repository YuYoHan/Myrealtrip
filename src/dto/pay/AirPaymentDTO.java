package dto.pay;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirPaymentDTO {
    private String userEmail;
    private String dateFilter;
    private String airLine;
    private String airNum;
    private String departure;
    private String arrive;
}

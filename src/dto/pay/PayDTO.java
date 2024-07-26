package dto.pay;

import lombok.*;

import java.sql.Timestamp;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Builder
public class PayDTO {
    private int payId;
    private String finalPay;
    private String payBank;
    private Timestamp payDate;
    private int airPayId;
    private int hotelPayId;
}

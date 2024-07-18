package dto.pay;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HotelPaymentDTO {
    private String userEmail;
    private String dateFilter;
    private String hotelName;
    private String hotelImg;
    private String hotelPrice;
}

package dto.pay;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HotelPaymentDTO {
    private String hotelPayId;
    private String dateFilter;
    private String hotelName;
    private String hotelImg;
    private int userId;
    private int roomReservationId;
}

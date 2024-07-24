package dto.hotel;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class HotelBannerDTO {
    private int hotelId;
    private String hotelName;
    private String hotelAddress;
    private String hotelInfo;
}

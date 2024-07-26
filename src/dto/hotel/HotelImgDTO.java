package dto.hotel;


import lombok.*;

@Builder
@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class HotelImgDTO {
    private int hotelImgId;
    private String hotelImgUrl;
    private int hotelId;
}

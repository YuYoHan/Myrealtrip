package dto.hotel;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class HotelDetailDTO {
    private String hotelName;
    private String hotelImgURL;
    private String hotelLocation;
    private String hotelInfo;
    private String roomName;
    private String roomImgURL;
    private int roomCount;
    private String roomPrice;
    private String optionOthers;
}

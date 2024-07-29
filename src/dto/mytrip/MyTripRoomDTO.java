package dto.mytrip;

import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyTripRoomDTO {
    private int roomId;
    private String hotelName;
    private String dateFilter;
    private String hotelImg;
    private String hotelPrice;
    private int userId;

    // 필요한 정보 추가
    public void addInfo(String hotelPrice) {
        this.hotelPrice = hotelPrice;
    }
}
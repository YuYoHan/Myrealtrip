package dto.hotel;


import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class HotelListDTO {
    // 숙소 탭을 누르면 전체 호텔 리스트를 출력하기 위함

    private int hotelID;
    private String hotelName;
    private String hotelImgURL;
    private String hotelCity;
    private String roomMinPrice;

}

package dto.hotel;


import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class RoomsDTO {
    private int roomId;
    private String roomStatus;
    private int roomCount;
    private String roomPrice;
    private String optionOthers;
    private int hotelId;
}

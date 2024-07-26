package dto.hotel;


import lombok.*;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomImgDTO {
    private int roomImgId;
    private String roomImgUrl;
    private int roomId;
}

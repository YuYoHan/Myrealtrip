package dto.hotel;

import lombok.*;

import java.sql.SQLException;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HotelsDTO {
    private int hotelId;
    private String hotelName;
    private String hotelLocation;
    private String hotelInfo;
    private int adminId;
}

package dto.air;


import lombok.*;

import java.sql.Date;



@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirNoticeDTO {
    int airNoticeId;
    String airNoticeTitle;
    String airNoticeDetails;
    Date airNoticeRegTime;
    Date airNoticeUpdateTime;
    String adminId;
}

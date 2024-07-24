package dto.air;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirCodeDTO {
    private int airCodeId;
    private String airCodeIata;
    private String airCodeLoc;
    private int airCodeDefaultPrice;
}

package dto.air;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirplanesDTO {
    private int airplaneId;
    private String airplaneModel;
    private String airplaneCompany;
    private int airportId;
}
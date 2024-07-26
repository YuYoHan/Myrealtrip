package dto.air;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OperationsDTO {
    private int operationId;
    private String operationNum;
    private String operationPrice;
    private Timestamp operationDepartureTime;
    private Timestamp operationArriveTime;
    private String operationDepartureArea;
    private String operationArriveArea;
    private int airplaneCapacity;
    private int airplaneId;
}
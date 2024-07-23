package dto.air;

import lombok.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InternationalOperation {
    private String airlineKorean;        // 항공사(국문)
    private String airport;              // 기준공항
    private String city;                 // 운항구간
    private String internationalIoType;  // 출/입국코드
    private String internationalTime;    // 계획시간


}

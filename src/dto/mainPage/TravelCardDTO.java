package dto.mainPage;

import lombok.*;

// 여기서는 일부로 Setter 방식으로 사용해봄
// 이유 : 기존의 수업이 Setter 방식으로 진행했기 때문에
// 하지만 Setter 방법은 원래 사용하면 안좋음
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TravelCardDTO {
    private int id;
    private String title;
    private String contents;
    // 대표 이미지
    private String travelImage;

}

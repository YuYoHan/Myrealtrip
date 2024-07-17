package dto.mainPage;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainBannerDTO {
    private int bannerId;
    private String  bannerURL;
    // 대표 이미지
    private String bannerImage;

}

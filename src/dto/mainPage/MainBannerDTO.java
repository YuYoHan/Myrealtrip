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
    private String bannerImage;

}

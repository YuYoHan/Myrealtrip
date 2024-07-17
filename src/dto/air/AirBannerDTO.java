package dto.air;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AirBannerDTO {
    private int placeId;
    private String placeName;
    private String placeContents;
    // 대표 이미지
    private String imageUrl;
    private List<PlaceImgDTO> imageUrls = new ArrayList<>();
}
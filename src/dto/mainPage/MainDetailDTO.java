package dto.mainPage;

import lombok.*;

import javax.servlet.annotation.ServletSecurity;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainDetailDTO {
    private int mainDetailId;
    private String mainDetailTitle;
    private String mainDetailPrice;
    private String mainDetailOption;
    private String contentImage;
    private String content;


}

package dto.mainPage;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class CardDetailDTO {
    private int cardId;
    private String cardTitle;
    private String cardImage1;
    private String cardImage2;
    private String cardImage3;
    private String cardImage4;
}

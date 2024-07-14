package dto.member;

import lombok.*;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
public class SocialDTO {
    private String email;
    private String userName;
}

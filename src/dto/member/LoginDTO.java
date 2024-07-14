package dto.member;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class LoginDTO {
    private String userEmail;
    private String userPw;
}

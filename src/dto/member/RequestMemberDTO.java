package dto.member;

import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RequestMemberDTO {
    private String userEmail;
    private String userName;
    private String postCode;
    private String address;
    private String detailAddress;
    private String userPw;

    // DTO에 담아서 DAO에 넘겨주기 위함
    public static RequestMemberDTO createMember(String userEmail,
                                                String userName,
                                                String postCode,
                                                String address,
                                                String detailAddress,
                                                String userPw) {
        return RequestMemberDTO.builder()
                .userEmail(userEmail)
                .userName(userName)
                .postCode(postCode)
                .address(address)
                .detailAddress(detailAddress)
                .userPw(userPw)
                .build();
    }
}

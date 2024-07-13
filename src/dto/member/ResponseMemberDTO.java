package dto.member;

import lombok.*;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class ResponseMemberDTO {
    private int userId;
    private String userEmail;
    private String userName;
    private String postCode;
    private String address;
    private String detailAddress;
    private MemberRole userRole;
    private String userPw;

    // 유저 생성한 데이터를 ResponseDTO에 담기
    public static ResponseMemberDTO createMember(int userId, RequestMemberDTO member) {
        return ResponseMemberDTO.builder()
                .userId(userId)
                .userEmail(member.getUserEmail())
                .userName(member.getUserName())
                .postCode(member.getPostCode())
                .address(member.getAddress())
                .detailAddress(member.getDetailAddress())
                .userRole(MemberRole.USER)
                .userPw(member.getUserPw())
                .build();
    }
}

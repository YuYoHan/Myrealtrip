package config.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
    private int startPage;
    private int endPage;
    private int realPage;
    private int totalPage;
    private boolean prev, next;
    private Criteria cri;

    public PageDTO(int totalPage, Criteria cri) {
        int pageNum = cri.getPageNum();
        this.totalPage = totalPage;
        this.cri = cri;

        // 페이지 끝 번호
        this.endPage = (int)Math.ceil(pageNum/10.0) * 10;
        // 한 페이지에서 몇개 까지 보여줄 갯수에서 -1
        // 거기서 끝 번호를 빼야 시작 페이지
        this.startPage = this.endPage - (cri.getAmount() -1);
        this.realPage = (int)Math.ceil(totalPage * 1.0 / cri.getAmount());

        if(endPage > realPage) {
            endPage = realPage;
        }

        // 이전
        this.prev = this.startPage > 1;
        // 다음
        this.next = this.endPage < this.realPage;
    }
}

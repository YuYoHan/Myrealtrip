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
    private boolean prev;
    private boolean next;
    private int total;
    private Criteria cri;

    public PageDTO(int total, Criteria cri) {
        this.cri = cri;
        this.total = total;

        // endPage 계산
        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

        // startPage 계산
        this.startPage = this.endPage - 9;

        // 실제 endPage 계산
        int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));

        // realEnd가 endPage보다 작으면 endPage 조정
        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        // prev와 next 표시 여부 결정
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }


}

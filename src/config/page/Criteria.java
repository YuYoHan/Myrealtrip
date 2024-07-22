package config.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
    // 현재 페이지 번호
    private int pageNum;
    // 각 페이지에 표시할 항목의 개수를 지정
    private int amount;
    // 현재 페이지와 페이지당 항목 수를 바탕으로 데이터베이스 조회를 시작할 행 번호를 계산
    private int startRow;

    public Criteria() {
        // 기본 생성자 세팅
        this(1,10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.startRow = (this.pageNum -1) * this.amount;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
        this.startRow = (this.pageNum -1) * this.amount;
    }

}

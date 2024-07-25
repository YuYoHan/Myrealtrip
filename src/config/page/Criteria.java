package config.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
    private int pageNum;
    private int amount;

    public Criteria() {
        this(1, 10); // 기본적으로 1페이지, 페이지당 7개 레코드
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

}

package exception.service;

// 서비스 또는 비느니스 로직의 일부에서 발생한 문제를 나타낸다.
// 예를들어, 재고가 부족한 경우 이 예외를 발생시킬 수 있음
public class OutOfStockException extends RuntimeException{
    public OutOfStockException(String msg) {
        super(msg);
    }
}

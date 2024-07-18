package exception.pay;

// 결제 예외처리
public class PayException extends RuntimeException{
    public PayException(String msg) {
        super(msg);
    }
}

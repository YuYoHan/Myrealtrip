package exception.pick;

// 찜하기 예외처리
public class PickException extends RuntimeException{
    public PickException(String msg) {
        super(msg);
    }
}

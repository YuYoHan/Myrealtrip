package exception.airplan;

// 항공권 예외처리
public class airPlanException extends RuntimeException{
    public airPlanException(String msg) {
        super(msg);
    }
}

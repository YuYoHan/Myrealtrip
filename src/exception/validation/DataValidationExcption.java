package exception.validation;

// 검증 예외처리
// 데이터 유효성 검사 실패 시 발생하는 예외
public class DataValidationExcption extends RuntimeException{
    public DataValidationExcption(String message) {
        super(message);
    }
}

package exception.answer;

// 답변 예외처리
public class AnswerException extends RuntimeException{
    public AnswerException(String msg) {
        super(msg);
    }
}

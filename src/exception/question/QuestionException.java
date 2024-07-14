package exception.question;

// 질문하기 예외처리
public class QuestionException extends RuntimeException{
    public QuestionException(String msg) {
        super(msg);
    }
}

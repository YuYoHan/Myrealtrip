package exception.notice;

// 공지 예외처리
public class NoticeException extends RuntimeException{
    public NoticeException(String msg) {
        super(msg);
    }
}

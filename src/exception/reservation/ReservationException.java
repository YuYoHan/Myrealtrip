package exception.reservation;

// 예약하기 예외처리
public class ReservationException extends RuntimeException{
    public ReservationException(String msg) {
        super(msg);
    }
}

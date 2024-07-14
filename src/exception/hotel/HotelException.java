package exception.hotel;

// 호텔 예외처리
public class HotelException extends RuntimeException{
    public HotelException(String msg) {
        super(msg);
    }
}

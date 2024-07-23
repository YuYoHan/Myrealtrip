package dto.air;


import lombok.*;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CombinedFlightDTO {
    private InternationalOperation in;
    private InternationalOperation out;

    //이렇게 따로 놓는 이유는 가격, 좌석, 도착시간은 따로 받아올 수 없고 귀국, 출국세트 값을 받아서 생성됐을 때 값이 정해져야 하므로 이렇게 설정하는 거다.

    private String price;
    private int seat;
    private String inArriveTime;        // 귀국 도착 시간
    private String outArriveTime;       // 출국 도착 시간


    public CombinedFlightDTO(InternationalOperation in, InternationalOperation out) {
        this.in = in;
        this.out = out;
    }

    public int setRandomSeat(int seat){
        if(seat == 0) {
            seat = 150;
        }
        this.seat = seat + (int)(Math.random()*66) - (int)(Math.random()*37);
        return this.seat;
    }

    public String setRandomPrice(int price){
        if(price == 0){
            price = 150000;
        }
        int priceRandom =  (int)(Math.random()*10)*100 * (int)(Math.random()*10)*10;
        int priceRandom1 =  (int)(Math.random()*10)*100 * (int)(Math.random()*10)*10;
        int priceRandom2 =  (int)(Math.random()*10)*100 * (int)(Math.random()*10)*10;
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedNumber = numberFormat.format(priceRandom + price - priceRandom2+priceRandom1);
        this.price =formattedNumber;
        return this.price;
    }

    public String calculateNewTime(String ttt, int hours, int minutes) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("HHmm");
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
        try {
            Date date = inputFormat.parse(ttt);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.HOUR_OF_DAY, hours);
            calendar.add(Calendar.MINUTE, minutes + (int) (Math.random() * 20));
            return outputFormat.format(calendar.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return ttt; // 파싱 오류 시 원래 시간 반환
        }
    }
    public String setDateFormat(String ttt) {
        SimpleDateFormat inputFormat;
        if (ttt.contains(":")) {
            inputFormat = new SimpleDateFormat("HH:mm");
        } else {
            inputFormat = new SimpleDateFormat("HHmm");
        }
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
        try {
            Date date = inputFormat.parse(ttt);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return outputFormat.format(calendar.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return ttt; // 파싱 오류 시 원래 시간 반환
        }
    }


}

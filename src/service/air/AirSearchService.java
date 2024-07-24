package service.air;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirCodeDAO;
import dao.air.AirDAO;
import dto.air.AirCodeDTO;
import dto.air.CombinedFlightDTO;
import dto.air.InternationalOperation;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AirSearchService implements Action {
    @Override
    public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {



        System.out.println(req.getParameter("dateFilter"));         // 떠나는 날짜 예시 07/24/2024 - 07/27/2024
        System.out.println(req.getParameter("dep"));                // 출국하는 지역명
        System.out.println(req.getParameter("count-total-input"));


        String dateFilter = req.getParameter("dateFilter");
        req.setAttribute("dateFilter",dateFilter);
        String dep = req.getParameter("dep");
        int peopleCount = Integer.parseInt(req.getParameter("count-total-input"));

        String startYear = dateFilter.substring(6, 10);
        String startMonth = dateFilter.substring(0, 2);
        String startDay = dateFilter.substring(3, 5);
        String endYear = dateFilter.substring(19, 23);
        String endMonth = dateFilter.substring(13, 15);
        String endDay = dateFilter.substring(16, 18);

        System.out.println("startYear" + startYear);
        System.out.println("startMonth" + startMonth);
        System.out.println("startDay" + startDay);
        System.out.println("endYearc" + endYear);
        System.out.println("endMonth" + endMonth);
        System.out.println("endDay" + endDay);


        AirCodeDTO airCode = AirCodeDAO.selectAirCode(dep); // 떠나는 지역 코드


        //req.setAttribute("remainSeat",);
        req.setAttribute("from", "서울");
        req.setAttribute("to", dep);

        // 인원수 가져오기
        int num = 15;

        // 출발지 가져오기
        String depDate= startYear+startMonth+startDay;
        String retDate= endYear+ endMonth+endDay;

        //김포 도쿄
        // 그거에 해당하는 코드 가져오기


        ArrayList<InternationalOperation> outList = AirDAO.getInternationalAir("GMP","HND",depDate,"OUT");
        ArrayList<InternationalOperation> inList = AirDAO.getInternationalAir("GMP","HND", endYear+ endMonth+endDay,"IN");
        ArrayList<CombinedFlightDTO> combineList = new ArrayList<CombinedFlightDTO>();
        for(InternationalOperation in : inList){
            for(InternationalOperation out : outList){
                CombinedFlightDTO c = new CombinedFlightDTO(in,out);
                // 가격 랜덤으로 정함
                c.setRandomPrice(0);
                // 좌석 랜덤으로 정함
                c.setRandomSeat(0);

                // 도착 시간 정함

                //출발시간으로 도착시간에 기본값 초기화
                c.setInArriveTime(c.getIn().getInternationalTime());
                c.setOutArriveTime(c.getOut().getInternationalTime());

                //도착시간 시간 랜덤값 넣기
                c.setInArriveTime(c.calculateNewTime(c.getIn().getInternationalTime(),1,20));
                c.setOutArriveTime(c.calculateNewTime(c.getOut().getInternationalTime(),1,20));

                //출발 시간 시간 포맷 정해주기
                c.getIn().setInternationalTime(c.setDateFormat(c.getIn().getInternationalTime()));
                c.getOut().setInternationalTime(c.setDateFormat(c.getOut().getInternationalTime()));

                combineList.add(c);
            }
        }

        req.setAttribute("depDate",depDate);        // 출발날짜
        req.setAttribute("retDate",retDate);        // 도착날짜
        req.setAttribute("peopleCount",peopleCount);// 사람수
        req.setAttribute("fromCode","GMP");      // 출발지 공항코드
        req.setAttribute("toCode",airCode);         // 도착지 공항코드
        // list HttpServletRequest에 저장.
        req.setAttribute("list", combineList);      // 공항정보를 연결한것
        ActionTo acto = new ActionTo();                //
        acto.setRedirect(false);
        acto.setPath("/app/air/airList.jsp");
        return acto;
    }
}

package service.air;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirDAO;
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

        //req.setAttribute("remainSeat",);
        req.setAttribute("from", "김포");
        req.setAttribute("to", "도쿄");

        // 인원수 가져오기
        int num = 15;

        // 출발지 가져오기
        String dep= "20240730";
        String Ret= "20240730";

        //김포 도쿄
        // 그거에 해당하는 코드 가져오기


        ArrayList<InternationalOperation> outList = AirDAO.getInternationalAir("GMP","HND","20240730","OUT");
        ArrayList<InternationalOperation> inList = AirDAO.getInternationalAir("GMP","HND","20240802","IN");
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
        // list HttpServletRequest에 저장.
        req.setAttribute("list", combineList);
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airList.jsp");
        return acto;
    }
}

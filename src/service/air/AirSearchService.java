package service.air;

import config.action.Action;
import config.action.ActionTo;
import dao.air.AirDAO;
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
        // data 정보
        String date = req.getParameter("dateFilter");
        System.out.println("날짜 : " + date);
        int count = Integer.parseInt(req.getParameter("count-total-input"));
        System.out.println("count : " + count);


        String departureYear = date.substring(6, 10);
        String departureMonth = date.substring(0, 2);
        String departureDay = date.substring(3, 5);
        String arriveYear = date.substring(19, 23);
        String arriveMonth = date.substring(13, 15);
        String arriveDay = date.substring(16, 18);
        System.out.printf("출발년도  : %s\n출발 월 : %s\n출발일 : %s", departureYear, departureMonth, departureDay);
        System.out.printf("도착년도  : %s\n도착 월 : %s\n도착일 : %s", arriveYear, arriveMonth, arriveDay);

        NodeList airApi = AirDAO.getAirApi();
        System.out.println("조회한 airPai : " + airApi.getLength());
        System.out.println("조회한 airPai : " + airApi);

        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();

        String[] randomPrice = new String[10];
        for (int i = 0; i < airApi.getLength(); i++) {
            // 랜덤으로 가격 생성
            int price_hd = (int) (Math.random()*(999-100+1)+100);
            int price_b = (int)(Math.random()*(99-50+1)+50);
            randomPrice[i] = price_b +", " + price_hd;
            System.out.println(randomPrice[i]);

            map = new HashMap<>();
            Node nde = airApi.item(i);
            System.out.println(nde);
            NodeList item_childList = nde.getChildNodes();
            for (int j = 0; j < item_childList.getLength(); j++) {
                Node item = item_childList.item(j);
                if(item.getNodeName().equals("etd")) {
                    map.put("fEtd", item.getTextContent().substring(0,2));
                    map.put("bEtd", item.getTextContent().substring(2,4));
                } else {
                    map.put(item.getNodeName(), item.getTextContent());
                }
            }
            list.add(i, map);
        }

        int remainSeat = AirDAO.getCount();
        System.out.println("남은 좌석 : " + remainSeat);


//        req.setAttribute("remainSeat",);
        req.setAttribute("price", randomPrice);
        req.setAttribute("list", list);
        
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airList.jsp");
        return acto;
    }
}

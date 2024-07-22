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

        // OPEN API에서 받은 XML을 받고 DAO로 처리한 것을 가져옴
        // 해당 메서드를 실행하면 NodeList 타입으로 받아오게 됨
        NodeList airApi = AirDAO.getAirApi();
        System.out.println("조회한 airPai : " + airApi.getLength());
        System.out.println("조회한 airPai : " + airApi);

        // List타입의 Map형태의 객체를 넣는 변수를 만든다.
        List<Map<String, Object>> list = new ArrayList<>();
        // map타입으로 각각의 데이터를 넣기 때문에 해당 변수를 만든다.
        Map<String, Object> map;

        String[] randomPrice = new String[10];
        // NodeList의 길이만큼 반복시켜서 노드들을 가져온다.
        // [{key : value, key : value...},{key : value, key : value...},
        // {key : value, key : value...},{key : value, key : value...}.......]
        for (int i = 0; i < airApi.getLength(); i++) {
            //새로운 HashMap을 만들어 map에 넣을 준비를 한다.
            map = new HashMap<>();

            // 노드에 있는 item의 자식요소를 가져온다.
            //({key : value, key : value ..})
            Node nde = airApi.item(i);
            System.out.println("node : " + nde);
            System.out.println("nodeName : " + nde.getNodeName());
            NodeList item_childList = nde.getChildNodes();
            System.out.println("childNodes : " + item_childList);

            // 랜덤으로 가격 생성
            int price_hd = (int) (Math.random()*(999-100+1)+100);
            int price_b = (int)(Math.random()*(99-50+1)+50);
            randomPrice[i] = price_b +", " + price_hd;
            System.out.println(randomPrice[i]);

            // 가져온 자식 요소의 길이 만큼 반복시키면 자식 요소 안의
            // 모든 데이터들을 가져 올 수 있다.
            for (int j = 0; j < item_childList.getLength(); j++) {
                // 자식 요소의 item 안에 비로소 우리가 원하는 데이터가 존재한다.
                Node item = item_childList.item(j);
                System.out.println("item : " + item);

                // 아래와 같이 조건문으로 우리가 원하는 데이터를 별도로 뽑아낼 수 있다.
                if(item.getNodeName().equals("etd")) {
                    //별도로 뽑아낸 데이터는 우리가 원하는 key네임으로 저장할 수 있다.
                    map.put("fEtd", item.getTextContent().substring(0,2));
                    map.put("bEtd", item.getTextContent().substring(2,4));
                } else {
                    // 나머지 데이터도 노드네임을 key로 노드value를
                    // value로 map에다가 넣어주자
                    map.put(item.getNodeName(), item.getTextContent());
                }
            }
            // 여기까지 실행되면 map에 키-값 구조로 담긴 데이터가 hashMap으로 존재한다.
            // 리스트로 만들어서 map을 저장할 수 있다.
            list.add(i, map);
        }

        int remainSeat = AirDAO.getCount();
        System.out.println("남은 좌석 : " + remainSeat);


//        req.setAttribute("remainSeat",);
        req.setAttribute("price", randomPrice);
        // setAttribute로 list를 담자.
        req.setAttribute("list", list);
        
        ActionTo acto = new ActionTo();
        acto.setRedirect(false);
        acto.setPath("/app/air/airList.jsp");
        return acto;
    }
}

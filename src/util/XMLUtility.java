package util;

import org.w3c.dom.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.function.Function;

public class XMLUtility {

    /**
     * XML 문자열을 파싱하여 객체 리스트로 변환하는 메서드
     *
     * @param xml XML 데이터 문자열
     * @param creator XML 요소를 객체로 변환하는 함수
     * @param <T> 변환할 객체의 타입
     * @return 변환된 객체 리스트
     */
    public static <T> ArrayList<T> parseXML(String xml, Function<Element, T> creator) {
        ArrayList<T> list = new ArrayList<>(); // 결과를 담을 리스트 생성
        try {
            // XML 파서 팩토리와 빌더 생성
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            // XML 문자열을 InputStream으로 변환
            InputStream is = new ByteArrayInputStream(xml.getBytes());
            // XML 파싱하여 Document 객체 생성
            Document doc = builder.parse(is);

            // "item" 태그를 가진 모든 요소 가져오기
            NodeList nList = doc.getElementsByTagName("item");
            for (int i = 0; i < nList.getLength(); i++) {
                Node node = nList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) { // 노드가 Element일 경우
                    Element elem = (Element) node;
                    // creator 함수를 사용하여 Element를 객체로 변환 후 리스트에 추가
                    list.add(creator.apply(elem));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
        }
        return list; // 변환된 객체 리스트 반환
    }

    /**
     * XML 요소에서 특정 태그의 값을 추출하는 메서드
     *
     * @param tag 추출할 태그 이름
     * @param elem XML 요소
     * @return 태그의 값
     */
    public static String getTagValue(String tag, Element elem) {
        // 태그 이름으로 노드 리스트를 가져오고 첫 번째 아이템의 자식 노드 가져오기
        NodeList nList = elem.getElementsByTagName(tag).item(0).getChildNodes();
        Node node = (Node) nList.item(0);
        return node.getNodeValue(); // 노드의 값 반환
    }
}

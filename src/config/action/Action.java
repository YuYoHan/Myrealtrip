package config.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
//	인터페이스화 해서 반복되는 코드를 줄였다.
	ActionTo execute (HttpServletRequest req, HttpServletResponse resp) throws Exception;
}

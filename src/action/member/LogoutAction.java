package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class LogoutAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		request.setAttribute("msg", "·Î±×¾Æ¿ôÇÏ¼Ì½À´Ï´Ù.");
		request.setAttribute("url", "Explogin.do");
		return new ActionForward(false,"../alert.jsp");
	}
}

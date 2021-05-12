package action.member;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
public abstract class AdminLoginAction implements Action{
	protected String login;
	protected String email;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		email=request.getParameter("email");
		
		if(login == null) { //로그아웃상태
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "Explogin.do");
			return new ActionForward(false,"../alert.jsp");
		}else if(!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능합니다.");
			request.setAttribute("url", "main.do");
			return new ActionForward(false,"../alert.jsp");
		}else {
			return doExecute(request,response);
		}
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

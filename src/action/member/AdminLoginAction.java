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
		
		if(login == null) { //�α׾ƿ�����
			request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
			request.setAttribute("url", "Explogin.do");
			return new ActionForward(false,"../alert.jsp");
		}else if(!login.equals("admin")) {
			request.setAttribute("msg", "�����ڸ� �����մϴ�.");
			request.setAttribute("url", "main.do");
			return new ActionForward(false,"../alert.jsp");
		}else {
			return doExecute(request,response);
		}
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

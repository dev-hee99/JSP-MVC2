package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import expermodel.ExpMemberDao;

public class PwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String pwque = request.getParameter("pwque");
		String pwans = request.getParameter("pwans");
		String url = "Explogin.do";
		String msg = "������ �´� ��й�ȣ�� ã�� �� �����ϴ�.";
		
		ExpMemberDao dao = new ExpMemberDao();
		String pw = dao.pwSearch(email, pwque, pwans);
		if(pw != null) {
			request.setAttribute("pw", pw);
			msg = "��й�ȣ�� "+pw+"�Դϴ�.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			return new ActionForward(false,"../alert.jsp");
		}else {
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false,"../alert.jsp");
		}
	}
	
}


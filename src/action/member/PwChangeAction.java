package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class PwChangeAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = null;
		String url = null;
		String pass = request.getParameter("nowpass");
		String chgpass = request.getParameter("pass");
		if(login == null) {
			msg = "�α����ϼ���.";
			url = "loginForm.me";
		}
		ExpMemberDao dao = new ExpMemberDao();
		ExperMember dbmem = dao.selectOne(login);
		if(pass.equals(dbmem.getPass())) {
			if(dao.updatePass(login, chgpass) > 0) {
				msg = "��й�ȣ ���� �Ǿ����ϴ� �ٽ� �α������ֱ� �ٶ��ϴ�.";
				url = "Explogin.do";
				request.setAttribute("msg",msg);
				request.setAttribute("url",url);
				return new ActionForward(false,"../alert.jsp");
				
			}
		}else {
			msg ="��й�ȣ�� Ʋ���ϴ�.";
			url ="mypage.do?email="+login;
		}
		return new ActionForward(false,"../alert.jsp");
	}
	
}

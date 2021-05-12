package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class MypageAction extends UserLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExperMember mem = new ExpMemberDao().selectOne(email);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}
	
}

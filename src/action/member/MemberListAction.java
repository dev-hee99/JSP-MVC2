package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class MemberListAction extends AdminLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ExperMember> list = new ExpMemberDao().list(); 
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
}

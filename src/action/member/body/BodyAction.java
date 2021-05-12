package action.member.body;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;
import expermodel.WeightBoard;
import expermodel.WeightDao;

public class BodyAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExperMember mem = new ExperMember();
		ExpMemberDao dbmem = new ExpMemberDao();
		
		mem = dbmem.selectOne(login);
		
		WeightDao dao = new WeightDao();
		List<WeightBoard> list = dao.list(login);
		String maxdate = dao.maxdate(login);
		String mindate = dao.mindate(login);
		
		request.setAttribute("maxdate", maxdate);
		request.setAttribute("mindate", mindate);
		request.setAttribute("list", list);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}
	
}

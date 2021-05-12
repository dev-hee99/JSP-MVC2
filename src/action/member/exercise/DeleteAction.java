package action.member.exercise;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExerciseDao;

public class DeleteAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExerciseDao dao = new ExerciseDao();
		int no = Integer.parseInt(request.getParameter("no"));
		if(dao.delete(no)>0) {
			return new ActionForward(true,"weightreport.do");
		}
		return new ActionForward();
	}
	
}

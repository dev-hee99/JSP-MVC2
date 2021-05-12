package action.member.exercise;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExerciseBoard;
import expermodel.ExerciseDao;

public class ExerciseAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExerciseDao dao = new ExerciseDao();
		String part = request.getParameter("part");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date bedate = sf.parse(request.getParameter("date1"));
		Date afdate = sf.parse(request.getParameter("date2"));
		//System.out.println(bedate); 문제X
		//System.out.println(afdate); 문제X
		
		List<ExerciseBoard> list = dao.list(part,login,bedate,afdate);
		request.setAttribute("list", list);
		return new ActionForward();
	}

}

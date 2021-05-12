package action.member.graph;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.WeightDao;

public class BodyFatGraph extends UserLoginAction {

	WeightDao dao = new WeightDao();

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String,Float>> list = dao.bodyfatgraph(login);
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
}

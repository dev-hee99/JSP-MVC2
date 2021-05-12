 package action.member.body;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.WeightDao;

public class DeleteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date regdate = fm.parse(request.getParameter("regdate"));
		WeightDao dao = new WeightDao();
		
		if(dao.delete(login,regdate)) {
			dao.weightupdate(login);
			return new ActionForward(true,"bodyreport.do");
		}
		String maxdate = dao.maxdate(login);
		String mindate = dao.mindate(login);
		
		request.setAttribute("maxdate", maxdate);
		request.setAttribute("mindate", mindate);
		request.setAttribute("url", "bodyreport.do");
		request.setAttribute("msg", "수정 실패");
		return new ActionForward(false,"../alert.jsp");
	}	
}

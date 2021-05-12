package action.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpReplyDao;

public class RepUpdateAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		ExpReplyDao dao = new ExpReplyDao();
		if(dao.update(seq,content)>0) {
			return new ActionForward(true,"info.do?num="+num);
		}
		request.setAttribute("msg","변경실패");
		request.setAttribute("url","info.do");
	
		return null;
	}
		
}

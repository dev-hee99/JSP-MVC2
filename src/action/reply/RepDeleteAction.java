package action.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpReply;
import expermodel.ExpReplyDao;

public class RepDeleteAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0;
		
		try {
		ExpReplyDao dao = new ExpReplyDao();
		int seq= Integer.parseInt(request.getParameter("seq"));
		ExpReply dbrep = dao.selectOne(seq);
		num = dbrep.getNum();
		int grp = dbrep.getGrp();
		
		if(dbrep.getSeq()==grp) {
			if(dao.deleteall(grp)>0) {
				int replycount = dao.repcount(login,0);
				request.getSession().setAttribute("replycount", replycount); //ȸ�� ��ۼ�
				return new ActionForward(true,"info.do?num="+num);
			}
		}else {
			if(dao.delete(seq)>0) {
				int replycount = dao.repcount(login,0);
				request.getSession().setAttribute("replycount", replycount); //ȸ�� ��ۼ�
				return new ActionForward(true,"info.do?num="+num);
			}
		}
		
		
		
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("url", "info.do?num="+num);
		request.setAttribute("msg", "��� ���� ����");
		return new ActionForward(false,"../alert.jsp");
	}
	
}

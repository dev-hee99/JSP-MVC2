package action.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpBoardDao;
import expermodel.ExpMemberDao;
import expermodel.ExpReply;
import expermodel.ExpReplyDao;
import expermodel.ExperBoard;
import expermodel.ExperMember;

public class InfoAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		ExpBoardDao dao = new ExpBoardDao();
		ExperBoard b = dao.selectOne(num); //num�� �ش��ϴ� �Խù� ��ȸ
		
		ExpReplyDao listdao = new ExpReplyDao();
		List<ExpReply> replist = listdao.list(num);
		ExpMemberDao memdao = new ExpMemberDao();
		
		List<ExperMember> memlist = memdao.list();
		//�ۼ��ڰ� ������ �ƴϸ� ��ȸ�� ����
		if(!login.equals(dao.selectemail(num))) {
		dao.readcntAdd(num);
		}
		ExpReplyDao repdao = new ExpReplyDao();
		int repcnt = repdao.cnt(num); //�Խù� ��ۼ�
		if(num > 0) {
			//�Խñ�
			request.setAttribute("cnt", repcnt);
			request.setAttribute("b", b);
			request.setAttribute("list", replist);
			request.setAttribute("mem", memlist);
			return new ActionForward();
		}else {
			request.setAttribute("msg","ã������ �Խñ��� �����ϴ�.");
			request.setAttribute("url","list.do");
			return new ActionForward(false,"../alert.jsp");
		}
	}
	
}

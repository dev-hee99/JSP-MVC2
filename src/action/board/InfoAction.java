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
		ExperBoard b = dao.selectOne(num); //num에 해당하는 게시물 조회
		
		ExpReplyDao listdao = new ExpReplyDao();
		List<ExpReply> replist = listdao.list(num);
		ExpMemberDao memdao = new ExpMemberDao();
		
		List<ExperMember> memlist = memdao.list();
		//작성자가 본인이 아니면 조회수 증가
		if(!login.equals(dao.selectemail(num))) {
		dao.readcntAdd(num);
		}
		ExpReplyDao repdao = new ExpReplyDao();
		int repcnt = repdao.cnt(num); //게시물 댓글수
		if(num > 0) {
			//게시글
			request.setAttribute("cnt", repcnt);
			request.setAttribute("b", b);
			request.setAttribute("list", replist);
			request.setAttribute("mem", memlist);
			return new ActionForward();
		}else {
			request.setAttribute("msg","찾으려는 게시글이 없습니다.");
			request.setAttribute("url","list.do");
			return new ActionForward(false,"../alert.jsp");
		}
	}
	
}

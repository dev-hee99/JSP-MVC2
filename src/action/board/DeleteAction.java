package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpBoardDao;

public class DeleteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		ExpBoardDao dao = new ExpBoardDao();
		String msg = "게시물 삭제 실패";
		String url = "info.do?num="+num;
		//btype이 1이면 자유게시판으로 아니면 정보공유게시판
		int btype = dao.selectbtype(num);

		if(dao.delete(num) > 0) {
			msg = "게시물이 삭제되었습니다.";
			url = "explist.do?btype="+btype;
		}
		request.getSession().setAttribute("postcount",dao.postcount(login)); // 회원 게시글 수 최신화
		request.getSession().setAttribute("postall", dao.postall()); //전체 게시글 수 최신화
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);	
		return new ActionForward(false,"../alert.jsp");
	}	
}
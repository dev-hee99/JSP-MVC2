package action.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpBoardDao;
import expermodel.ExpReply;
import expermodel.ExpReplyDao;
import expermodel.ExperBoard;

public class ListAction extends UserLoginAction {
	ExpBoardDao dao = new ExpBoardDao();
	ExpReplyDao repdao = new ExpReplyDao();
	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageNum = 1;
		int btype;
		String chkbtype = request.getParameter("btype");
		if(chkbtype==null) {
			btype = 0;
		}else {
			btype = Integer.parseInt(request.getParameter("btype"));;
		}
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
		}catch(NumberFormatException e) {}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.trim().equals("")) {
			column = null;
			find = null;
		}
		if(find == null || find.trim().equals("")) {
			column = null;
			find = null;
		}
		int limit = 15;
		//전체 등록 게시물 건수
		int boardcount = dao.boardCount(column,find,btype); //전체 등록된 게시글
		
		List<ExperBoard> list = dao.list(pageNum, limit, column, find, btype);
		List<ExpReply> numcnt = repdao.numcnt();
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("numcnt", numcnt); //게시물 댓글 수 리스트
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		request.setAttribute("btype", btype);
		return new ActionForward();
	}
	
}

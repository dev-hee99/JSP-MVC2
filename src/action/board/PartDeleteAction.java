package action.board;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.AdminLoginAction;
import expermodel.ExpBoardDao;

public class PartDeleteAction extends AdminLoginAction {
	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//체크박스 num값 배열에 대입
		String [] numarr = request.getParameterValues("deletechk");
		
		//게시물 url 위치
		int btype = Integer.parseInt(request.getParameter("btype"));
		
		ExpBoardDao dao = new ExpBoardDao();
		String msg = null;
		String url = "explist.do?btype="+btype;;
		boolean chk = false;
		
		try {
			for(int i=0; i<numarr.length;i++) {
				if(dao.delete(Integer.parseInt(numarr[i]))>0){
					chk = true;
				}
			}
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		//성공적으로 삭제가 될시
		if(chk)
			msg = "게시물이 삭제되었습니다.";
		else
			msg = "게시물 삭제 실패";
		
		//btype이 1이면 자유게시판으로 아니면 정보공유게시판

		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);	
		return new ActionForward(false,"../alert.jsp");
	}
}

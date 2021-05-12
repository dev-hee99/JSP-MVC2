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
		String msg = "�Խù� ���� ����";
		String url = "info.do?num="+num;
		//btype�� 1�̸� �����Խ������� �ƴϸ� ���������Խ���
		int btype = dao.selectbtype(num);

		if(dao.delete(num) > 0) {
			msg = "�Խù��� �����Ǿ����ϴ�.";
			url = "explist.do?btype="+btype;
		}
		request.getSession().setAttribute("postcount",dao.postcount(login)); // ȸ�� �Խñ� �� �ֽ�ȭ
		request.getSession().setAttribute("postall", dao.postall()); //��ü �Խñ� �� �ֽ�ȭ
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);	
		return new ActionForward(false,"../alert.jsp");
	}	
}
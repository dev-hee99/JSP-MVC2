package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import expermodel.ExpBoardDao;
import expermodel.ExpMemberDao;
import expermodel.ExpReplyDao;
import expermodel.ExperMember;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		ExperMember mem = new ExpMemberDao().selectOne(email);
		ExpReplyDao repdao = new ExpReplyDao();
		ExpBoardDao dao = new ExpBoardDao();
		
		int postall = dao.postall();
		int replycount = repdao.repcount(email,0);
		int postcount = dao.postcount(email);
		if(mem==null) {
			request.setAttribute("msg", "���̵� Ȯ���ϼ���");
			request.setAttribute("url", "Explogin.do");
		}else {
			if(pass.equals(mem.getPass())) {
				
				request.getSession().setAttribute("login", email); 
				request.getSession().setAttribute("name", mem.getName()); // ȸ�� �̸�
				request.getSession().setAttribute("picture", mem.getPicture());	 
				request.getSession().setAttribute("postcount",postcount); // ȸ�� �Խñ� ��
				request.getSession().setAttribute("postall", postall); //��ü �Խñۼ�
				request.getSession().setAttribute("replycount", replycount); //ȸ�� ��ۼ�
				request.setAttribute("msg", mem.getName()+"���� �α����߽��ϴ�.");
				request.setAttribute("url", "mypage.do?email="+email);
				if(mem.getName().equals("admin")) {
					request.setAttribute("url", "memberlist.do");
				}
			}else {
				request.setAttribute("msg", "��й�ȣ�� Ʋ���ϴ�");
				request.setAttribute("url", "Explogin.do");
			}
		}
		return new ActionForward(false,"../alert.jsp");
	
	}
}

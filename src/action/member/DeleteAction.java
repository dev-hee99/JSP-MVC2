package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class DeleteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String url = null;
		String msg = null;
		ExpMemberDao dao = new ExpMemberDao();
		ExperMember dbmem = dao.selectOne(login);
		ExperMember userdb = dao.selectOne(email);

		if(pass.equals(dbmem.getPass())) {
	        if(dao.delete(email)>0) {
	               if(login.equals("admin")) {
	            	  url= "memberlist.do";
	                  msg = userdb.getName() + "���� Ż�� ���׽��ϴ�.";
	               }else {
	            	  url = "main.do";
	                  msg = userdb.getName() + "�� Ż�� �Ǿ����ϴ�.";
	                  request.getSession().invalidate();
	               }
	            }else {
	               msg = userdb.getName() + "���� Ż��� ���� �߻�.";
	               if(!login.equals("admin")) {
	                  url = "mypage.do?email="+email;
	               }
	            }
	         }else {
	        	 if(login.equals("admin")) {
	        		 msg = "������ ��й�ȣ�� Ʋ���ϴ�.";
	        		 url = "memberlist.do";
	        	 }else {
	        		 msg = userdb.getName()+"���� ��й�ȣ�� Ʋ���ϴ�.";
	        		 url = "mypage.do?email="+email;
	        	 }
	         }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false,"../alert.jsp");
	}
}

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
	                  msg = userdb.getName() + "´ÔÀ» Å»Åð ½ÃÄ×½À´Ï´Ù.";
	               }else {
	            	  url = "main.do";
	                  msg = userdb.getName() + "´Ô Å»Åð µÇ¾ú½À´Ï´Ù.";
	                  request.getSession().invalidate();
	               }
	            }else {
	               msg = userdb.getName() + "´ÔÀÇ Å»Åð½Ã ¿À·ù ¹ß»ý.";
	               if(!login.equals("admin")) {
	                  url = "mypage.do?email="+email;
	               }
	            }
	         }else {
	        	 if(login.equals("admin")) {
	        		 msg = "°ü¸®ÀÚ ºñ¹Ð¹øÈ£°¡ Æ²¸³´Ï´Ù.";
	        		 url = "memberlist.do";
	        	 }else {
	        		 msg = userdb.getName()+"´ÔÀÇ ºñ¹Ð¹øÈ£°¡ Æ²¸³´Ï´Ù.";
	        		 url = "mypage.do?email="+email;
	        	 }
	         }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false,"../alert.jsp");
	}
}

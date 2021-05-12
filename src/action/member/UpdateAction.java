package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class UpdateAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExperMember mem = new ExperMember();
		mem.setEmail(request.getParameter("email"));
		mem.setName(request.getParameter("name"));
		mem.setHeight(Float.parseFloat(request.getParameter("height")));		
		mem.setWeight(Float.parseFloat(request.getParameter("weight")));
		String pass = request.getParameter("pass");
		
		String msg = "비밀번호가 틀렸습니다.";
	 	String url = "mypage.do?email="+mem.getEmail();
	 	
	 	ExpMemberDao dao = new ExpMemberDao();
	 	ExperMember dbmem = dao.selectOne(login);
		
	 	if(pass.equals(dbmem.getPass())) {
	 		int result = dao.update(mem);
	 		if(result > 0) {
	 			return new ActionForward(true,"mypage.do?email="+login);
	 		}else {
	 			msg = "수정 실패";
	 		}
	 	}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}

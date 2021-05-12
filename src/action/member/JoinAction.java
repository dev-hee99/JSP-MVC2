package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExperMember exmem = new ExperMember();
		exmem.setEmail(request.getParameter("email"));
		exmem.setPass(request.getParameter("pass"));
		exmem.setName(request.getParameter("name"));
		exmem.setPicture(request.getParameter("picture"));
		exmem.setGender(Integer.parseInt(request.getParameter("gender")));
		if(!request.getParameter("height").equals("")) {
		exmem.setHeight(Float.parseFloat(request.getParameter("height")));
		exmem.setWeight(Float.parseFloat(request.getParameter("weight")));
		}else {
			exmem.setHeight(0);
			exmem.setHeight(0);
		}
		exmem.setPwque(request.getParameter("pwque"));
		exmem.setPwans(request.getParameter("pwans"));
		String msg = "회원가입 실패";
		String url = "Expjoin.do";
		if(new ExpMemberDao().insert(exmem) > 0) {
			msg = exmem.getName() + "님 회원가입 완료";
			url = "Explogin.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
		
	}
 	
}

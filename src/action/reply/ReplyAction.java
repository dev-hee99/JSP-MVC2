package action.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpReply;
import expermodel.ExpReplyDao;

public class ReplyAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExpReply reply = new ExpReply();
		ExpReplyDao dao = new ExpReplyDao();
		
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		//게시글 댓글수
		int repall = dao.repcount(null,num); 
		//순서 
		int seq = dao.maxseq();
		
		reply.setSeq(++seq);	//순서
		reply.setGrp(seq);		//그룹
		reply.setEmail(login); // 이메일
		reply.setName(name); //이름
		reply.setNum(num); //게시글 넘버
		reply.setContent(content); // 내용
		
		//게시글 댓글수
		
		if(dao.insert(reply)) {
			request.setAttribute("repall", repall);
			request.getSession().setAttribute("replycount", dao.repcount(login,0)); //회원 댓글수
			return new ActionForward(true,"info.do?num="+num);
		}
			
		
		return new ActionForward();
	}
	
}

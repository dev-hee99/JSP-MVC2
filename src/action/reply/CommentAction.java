package action.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpReply;
import expermodel.ExpReplyDao;

public class CommentAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExpReplyDao dao = new ExpReplyDao();
		ExpReply reply = new ExpReply();
		
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		int grp = Integer.parseInt(request.getParameter("grp"));// ��۹�ȣ
		int num = Integer.parseInt(request.getParameter("num"));// �Խñ� ��ȣ
		int seq = dao.maxseq(); //��� ��ϼ�
		
		
		//�Խñ� ��ۼ�
		int repall = dao.repcount(null,num);
		
		reply.setSeq(++seq);
		reply.setNum(num);
		reply.setEmail(login);
		reply.setName(name);
		reply.setContent(content);
		reply.setGrp(grp);
		
		if(dao.insert(reply)) {
		request.setAttribute("repall", repall);
		request.getSession().setAttribute("replycount", dao.repcount(login, 0)); //ȸ�� ��ۼ� �ֽ�ȭ
		return new ActionForward(true,"info.do?num="+num);
		}
		return null;
	}
	
}

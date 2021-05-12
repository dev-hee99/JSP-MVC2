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
		
		//�Խñ� ��ۼ�
		int repall = dao.repcount(null,num); 
		//���� 
		int seq = dao.maxseq();
		
		reply.setSeq(++seq);	//����
		reply.setGrp(seq);		//�׷�
		reply.setEmail(login); // �̸���
		reply.setName(name); //�̸�
		reply.setNum(num); //�Խñ� �ѹ�
		reply.setContent(content); // ����
		
		//�Խñ� ��ۼ�
		
		if(dao.insert(reply)) {
			request.setAttribute("repall", repall);
			request.getSession().setAttribute("replycount", dao.repcount(login,0)); //ȸ�� ��ۼ�
			return new ActionForward(true,"info.do?num="+num);
		}
			
		
		return new ActionForward();
	}
	
}

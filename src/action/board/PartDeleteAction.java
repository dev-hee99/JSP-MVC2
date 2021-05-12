package action.board;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.AdminLoginAction;
import expermodel.ExpBoardDao;

public class PartDeleteAction extends AdminLoginAction {
	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//üũ�ڽ� num�� �迭�� ����
		String [] numarr = request.getParameterValues("deletechk");
		
		//�Խù� url ��ġ
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
		
		//���������� ������ �ɽ�
		if(chk)
			msg = "�Խù��� �����Ǿ����ϴ�.";
		else
			msg = "�Խù� ���� ����";
		
		//btype�� 1�̸� �����Խ������� �ƴϸ� ���������Խ���

		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);	
		return new ActionForward(false,"../alert.jsp");
	}
}

package action.member.exercise;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExerciseBoard;
import expermodel.ExerciseDao;

public class ReportAction extends UserLoginAction {
	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ExerciseBoard ex = new ExerciseBoard();
		ExerciseDao dao = new ExerciseDao();
		int no = dao.maxno();
		String part = request.getParameter("part"); //����
		String ename = request.getParameter("ename"); //���
		int setnum = Integer.parseInt(request.getParameter("setnum")); //��Ʈ ��ȣ (�Ʈ����)
		int count = Integer.parseInt(request.getParameter("count")); // ����	
		float weight = Float.parseFloat(request.getParameter("weight")); // ����
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date regdate = sf.parse(request.getParameter("date"));
		
		ex.setEmail(login); // �̸��� 
		ex.setPart(part);
		ex.setEname(ename);
		ex.setSetnum(setnum);
		ex.setWeight(weight);
		ex.setRegdate(regdate);
		ex.setCount(count);
		ex.setNo(++no);
		
		if(dao.insert(ex)) {
			return new ActionForward(true,"weightreport.do");			
		}
		
		
		request.setAttribute("url", "weightreport.do");
		request.setAttribute("msg", "��Ͻ���");
		return new ActionForward();
	}

}

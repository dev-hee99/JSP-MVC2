package action.member.body;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpMemberDao;
import expermodel.ExperMember;
import expermodel.WeightBoard;
import expermodel.WeightDao;

public class ReportAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date date = fm.parse(request.getParameter("date"));
		
		float weight = Float.parseFloat(request.getParameter("weight"));
		float bodyfat = Float.parseFloat(request.getParameter("bodyfat"));
		float musclemass = Float.parseFloat(request.getParameter("musclemass"));
		ExperMember mem = new ExpMemberDao().selectOne(login);
		WeightBoard w = new WeightBoard();
		w.setEmail(login);
		w.setBodyfat(bodyfat);
		w.setMusclemass(musclemass);
		w.setRegdate(date);
		w.setWeight(weight);
		
		WeightDao dao = new WeightDao();
		
		//�ش� ��¥�� �̹� �������
		if(dao.datechk(login,date)!=null) {
			//�ش� ��¥�� ����� ������Ʈ
			if(dao.update(w))
				//��ȭ�� ������ ����
				dao.weightupdate(login);
				mem = new ExpMemberDao().selectOne(login);
				return new ActionForward(true,"bodyreport.do"); 
		}else { // �ش糯¥�� ���� ���
			//�ش� ��¥�� ����� ���
			if(dao.insert(w)) {
				//��ȭ�� ������ ����
				dao.weightupdate(login);
				mem = new ExpMemberDao().selectOne(login);
				return new ActionForward(true,"bodyreport.do"); 
			}
		}
		String maxdate = dao.maxdate(login);
		String mindate = dao.mindate(login);
		
		request.setAttribute("maxdate", maxdate);
		request.setAttribute("mindate", mindate);
		request.setAttribute("mem",mem);
		request.setAttribute("msg", "��Ͻ���");
		request.setAttribute("url", "bodyreport.do");
		return new ActionForward(false,"../alert.jsp");
	}
	
}

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
		
		//해당 날짜가 이미 있을경우
		if(dao.datechk(login,date)!=null) {
			//해당 날짜의 기록을 업데이트
			if(dao.update(w))
				//변화한 몸무게 갱신
				dao.weightupdate(login);
				mem = new ExpMemberDao().selectOne(login);
				return new ActionForward(true,"bodyreport.do"); 
		}else { // 해당날짜가 없을 경우
			//해당 날짜의 기록을 등록
			if(dao.insert(w)) {
				//변화한 몸무게 갱신
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
		request.setAttribute("msg", "등록실패");
		request.setAttribute("url", "bodyreport.do");
		return new ActionForward(false,"../alert.jsp");
	}
	
}

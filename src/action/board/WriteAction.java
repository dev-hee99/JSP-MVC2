package action.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpBoardDao;
import expermodel.ExpMemberDao;
import expermodel.ExperBoard;
import expermodel.ExperMember;
/*
 * 	btype  	1. �����Խ���
 * 			2. ��������(�)
 * 			3. ��������(�Ĵ�)
 * 
 * 
 */
public class WriteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//�α��� ����
		ExperMember dbmem = new ExpMemberDao().selectOne(login);
		
		
				
		String path = request.getServletContext().getRealPath("/") 
				+ "/Experboard/file";
		int size = 10 * 1024 * 1024;
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		try {
		MultipartRequest multi = new MultipartRequest
							(request,path,size,"euc-kr");
		ExperBoard board = new ExperBoard();
		
		//�Խù�����
		int btype = Integer.parseInt(multi.getParameter("btype"));
		//�Խñ�����
		int wtype = 0;
		// admin ��������
		if(dbmem.getEmail().equals("admin")) 
			wtype = 1;
		else // user �Ϲݱ�
			wtype = 2;
		
		board.setBtype(btype);
		board.setWtype(wtype);
		board.setEmail(login);
		board.setName(dbmem.getName());
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		ExpBoardDao dao = new ExpBoardDao();
		
		//expboard table���� num �÷��� �ִ밪 ����. �ִ밪�� ���� ��� 0���� ����
		int num = dao.maxnum();
		board.setNum(++num);
		if(dao.insert(board)){
			//1.�����Խ��� 2.������Խ��� 3.�Ĵܰ����Խ���
			request.getSession().setAttribute("postcount",dao.postcount(login)); // ȸ�� �Խñ� �� �ֽ�ȭ
			request.getSession().setAttribute("postall", dao.postall()); //��ü �Խñ� �� �ֽ�ȭ
			return new ActionForward(true,"explist.do?btype="+btype);
		}
		
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "�Խù� ��� ����");
		request.setAttribute("url", "writeform.do");
		return new ActionForward(false,"../alert.jsp");	
	}
		
	
}

package action.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import action.member.UserLoginAction;
import expermodel.ExpBoardDao;
import expermodel.ExperBoard;

/*
 * �Խñ����� ���� ���� 
 * btype subject content 
 * 
 */
public class UpdateAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "/Experboard/file";
		int size = 10 * 1024 * 1024;
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
			ExperBoard board = new ExperBoard();
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setBtype(Integer.parseInt(multi.getParameter("btype")));
			board.setSubject(multi.getParameter("subject")); //����
			board.setContent(multi.getParameter("content")); //����
			board.setFile1(multi.getFilesystemName("file1")); //����
			ExpBoardDao dao = new ExpBoardDao();
			
			//�Խù� ���� true
			if(dao.update(board)) {
				request.setAttribute("msg","���ε� �Ǿ����ϴ�." );
				request.setAttribute("url", "info.do?num=" + board.getNum() );
			//�Խù� ���� false
			}else {
				request.setAttribute("msg","�Խù� ���� ����" );
				request.setAttribute("url", "list.do");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false,"../alert.jsp");
	}

}

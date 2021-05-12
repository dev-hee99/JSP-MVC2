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
 * 게시글종류 제목 내용 
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
			board.setSubject(multi.getParameter("subject")); //제목
			board.setContent(multi.getParameter("content")); //내용
			board.setFile1(multi.getFilesystemName("file1")); //파일
			ExpBoardDao dao = new ExpBoardDao();
			
			//게시물 수정 true
			if(dao.update(board)) {
				request.setAttribute("msg","업로드 되었습니다." );
				request.setAttribute("url", "info.do?num=" + board.getNum() );
			//게시물 수정 false
			}else {
				request.setAttribute("msg","게시물 수정 실패" );
				request.setAttribute("url", "list.do");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false,"../alert.jsp");
	}

}

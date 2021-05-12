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
 * 	btype  	1. 자유게시판
 * 			2. 정보공유(운동)
 * 			3. 정보공유(식단)
 * 
 * 
 */
public class WriteAction extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//로그인 정보
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
		
		//게시물종류
		int btype = Integer.parseInt(multi.getParameter("btype"));
		//게시글종류
		int wtype = 0;
		// admin 공지사항
		if(dbmem.getEmail().equals("admin")) 
			wtype = 1;
		else // user 일반글
			wtype = 2;
		
		board.setBtype(btype);
		board.setWtype(wtype);
		board.setEmail(login);
		board.setName(dbmem.getName());
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		ExpBoardDao dao = new ExpBoardDao();
		
		//expboard table에서 num 컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴
		int num = dao.maxnum();
		board.setNum(++num);
		if(dao.insert(board)){
			//1.자유게시판 2.운동공유게시판 3.식단공유게시판
			request.getSession().setAttribute("postcount",dao.postcount(login)); // 회원 게시글 수 최신화
			request.getSession().setAttribute("postall", dao.postall()); //전체 게시글 수 최신화
			return new ActionForward(true,"explist.do?btype="+btype);
		}
		
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", "writeform.do");
		return new ActionForward(false,"../alert.jsp");	
	}
		
	
}

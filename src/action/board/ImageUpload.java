package action.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class ImageUpload implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String path=request.getServletContext().getRealPath("/")+"Experboard/imgfile/";
        File f = new File(path);
        if(!f.exists()) f.mkdir();
        MultipartRequest multi = new MultipartRequest
      		  (request, path, 10*1024*1024, "euc-kr");
        //upload : ckeditor에서 지정한 파일이름
        String fileName = multi.getFilesystemName("upload");
        request.setAttribute("fileName", fileName);
        request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
        return new ActionForward(false, "ckeditor.jsp");
	}

}

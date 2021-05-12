package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class PictureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//getRealPath: WebContent위치
		//업로드 위치 : 현재폴더/picture
		String path = request.getServletContext().getRealPath("/")
							+"Expermember/picture/";
		int size = 10 * 1024 * 1024; //최대 업로드 크기
		File f1 = new File(path);
		//path가 지정한 폴더가 없는 경우 폴더 생성
		if(!f1.exists()) f1.mkdirs();
		
		MultipartRequest multi = new MultipartRequest
				(request,path,size,"EUC-KR");
		//업로드된 파일의 이름
		//picture라는 것에 파라미터값을 갖고
		String fname = multi.getFilesystemName("picture");
		//new File(path+fname) : 업로드된 파일의 절대 경로
		//bi : 이미지 파일을 읽어서 메모리에 로드
		BufferedImage bi = ImageIO.read(new File(path+fname));
		
		int width = bi.getWidth()/3; //원본이미지 가로크기의 3분의1
		int height = bi.getHeight()/3; //원본이미지 세로크기의 3분의1
		
		//thumb : 원본이미지크기의 3분의 1크기의 도화지 생성.
		//섬네일이미지를 그리기 위한 도화지.
		BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//g : 그리기 도구
		Graphics2D g = thumb.createGraphics();
		//g.drawImage : 이미지 그리기
		g.drawImage(bi,0,0,width,height,null);
		//f : 섬네일 이미지 저장을 위한 파일 설정
		File f = new File(path+"sm_"+fname);
		//thumb 이미지를 f파일로 생성
		ImageIO.write(thumb,"jpg",f); //thumb 이미지를 f 파일로 저장
		request.setAttribute("fname",fname);
		return new ActionForward(true,"Expjoin.do?fname="+fname);
		
	}
	
}

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
		//getRealPath: WebContent��ġ
		//���ε� ��ġ : ��������/picture
		String path = request.getServletContext().getRealPath("/")
							+"Expermember/picture/";
		int size = 10 * 1024 * 1024; //�ִ� ���ε� ũ��
		File f1 = new File(path);
		//path�� ������ ������ ���� ��� ���� ����
		if(!f1.exists()) f1.mkdirs();
		
		MultipartRequest multi = new MultipartRequest
				(request,path,size,"EUC-KR");
		//���ε�� ������ �̸�
		//picture��� �Ϳ� �Ķ���Ͱ��� ����
		String fname = multi.getFilesystemName("picture");
		//new File(path+fname) : ���ε�� ������ ���� ���
		//bi : �̹��� ������ �о �޸𸮿� �ε�
		BufferedImage bi = ImageIO.read(new File(path+fname));
		
		int width = bi.getWidth()/3; //�����̹��� ����ũ���� 3����1
		int height = bi.getHeight()/3; //�����̹��� ����ũ���� 3����1
		
		//thumb : �����̹���ũ���� 3���� 1ũ���� ��ȭ�� ����.
		//�������̹����� �׸��� ���� ��ȭ��.
		BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//g : �׸��� ����
		Graphics2D g = thumb.createGraphics();
		//g.drawImage : �̹��� �׸���
		g.drawImage(bi,0,0,width,height,null);
		//f : ������ �̹��� ������ ���� ���� ����
		File f = new File(path+"sm_"+fname);
		//thumb �̹����� f���Ϸ� ����
		ImageIO.write(thumb,"jpg",f); //thumb �̹����� f ���Ϸ� ����
		request.setAttribute("fname",fname);
		return new ActionForward(true,"Expjoin.do?fname="+fname);
		
	}
	
}

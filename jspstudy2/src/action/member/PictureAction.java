package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;
/*
  	1. �̹������� ���ε� (->request ��ü ��� �Ұ�)
	2. �̹��������� 3����1 ũ���� ������ �̹��� ����. -> sm_�����̸� ���� ����
 */
public class PictureAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("")+"model2/member/picture/";
		String fname = null;
		try {
			File f = new File(path);
			if(!f.exists()){   //model2/member/picture ������ ������,
				f.mkdirs();    //���� ����
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
			//fname : ���ε�� �̹��� ���� �̸�
			fname = multi.getFilesystemName("picture");
			//�Ʒ����� ����� �̹��� ����
			//new File(path + fname) : ���ε�� ���� ����
			//bi : �޸𸮿� �ε�� ����
			BufferedImage bi = ImageIO.read(new File(path + fname));
			int width = bi.getWidth()/3;      //����� ũ�⸦ ������ 3���� 1�� ����
			int height = bi.getHeight()/3;
			//thumb : �� ��ȭ��
			BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			//g : �׸��� ����
			Graphics2D g = thumb.createGraphics();
			//g.drawImage(bi, 0, 0, width, height, null); : �׸� �׸���(bi�� �ε�� ������ ���� ������ ���� ������, ũ�� ����)
			g.drawImage(bi, 0, 0, width, height, null);
			// f : thumbnail �̹����� ���Ϸ� �����ϱ� ���� ��ü
			f = new File(path + "sm_" + fname);
			ImageIO.write(thumb, "jpg", f);
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}

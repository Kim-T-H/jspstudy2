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
   1. 이미지파일 업로드. request 객체 사용 불가
   2. 이미지파일의 3분의1 크기의 섬네일이미지 생성. 이름은 sm_파일이름으로 설정
 */
public class PictureAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") 
				                            + "model2/member/picture/";
		String fname = null;
		try {
			File f = new File(path);
			if (!f.exists()) {
				f.mkdirs(); //폴더 생성
			}
			MultipartRequest multi = new MultipartRequest
					    (request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture");
			//썸네일 이미지
			//new File(path + fname) : 업로드된 원본 파일
			// bi : 메모리에 로드 정보
			BufferedImage bi = ImageIO.read(new File(path + fname));
			int width = bi.getWidth() / 3;
			int height = bi.getHeight() / 3;
			//thumb : 빈이미지. 그림이 없는 도화지
			BufferedImage thumb = new BufferedImage
					      (width, height, BufferedImage.TYPE_INT_RGB);
			//g : 그리기 도구
			Graphics2D g = thumb.createGraphics();
		    // 그림 그리기.
		    // thumb : 이미지 그려짐
			g.drawImage(bi, 0, 0, width, height, null);
			f = new File(path + "sm_" + fname);
			//thumb 이미지 f 파일로 저장
			ImageIO.write(thumb, "jpg", f);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}

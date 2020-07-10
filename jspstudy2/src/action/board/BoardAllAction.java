package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.MyBatisConnection;

public class BoardAllAction {
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("hello", "Hello, World");
		return new ActionForward();
	}

	/*
	 * 1.파라미터 값을 model.Board 객체 저장. useBean 사용 불가: request 정보의 파라미터와 빈클래스의 프로퍼티 비교
	 * request 객체를 사용할 수없음. 2.게시물 num 현재 등록된 num의 최대값을 조회. 최대값+1 등록된 게시물의 번호. db에서
	 * maxnum 을 구해서 +1 값으로 num 설정하기 3. board 내용을 db에 등록하기 등록 성공: 메세지 출력. list.do 페이지
	 * 이동 등록 실패: 메세지 출력. writeForm.do 페이지 이동
	 * 
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String msg = "게시물 등록 실패";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		System.out.println("path: "+path);
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			BoardDao dao = new BoardDao();
			int num = dao.maxnum(); // board table에서 num 컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴

			board.setNum(++num);
			board.setGrp(num);
			if (dao.insert(board)) {
				msg = "게시물 등록 성공";
				url = "list.do";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1.한 페이지당 10건의 게시물을 출력하기. pageNum 파라미터값을 저장 => 없는경우는 1로 설정하기. 2.최근 등록된 게시물이 가장
	 * 위에 배치함. 3.db에서 해당 페이지에 출력될 내용을 조회하여 list 객체로 저장. list 객체를 request의 객체의 속성으로
	 * 등록하여 list.jsp 로 페이지 이동.
	 */

	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1; // 페이지 번호 초기화
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}

		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.trim().equals("")) { // column값이 없음
			column = null;
			find = null;
		}
		if (find == null || find.trim().equals("")) { // find 값이 없음.
			column = null;
			find = null;
		}
		int limit = 10; // 한페이지에 출력할 게시물 건수
		// boardcount: 등록된 전체 게시물의 건수 또는 검색된 게시물의 건수
		BoardDao dao = new BoardDao();
		int boardcount = dao.boardCount(column, find); // 등록된 전체 게시물의 건수
		// list: 화면에 출력된 게시물의 내용 목록
		List<Board> list = dao.list(pageNum, limit, column, find); // 화면에 출력할 게시글
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9; // 종료페이지 번호
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());

		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);

		return new ActionForward();
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		/*-- /WebContent/model1/board/info.jsp
		  1. num 파라미터 저장
		  2. num값의 게시물을 db에서 조회.
		  3. num값의 게시물의 조회수 증가시키기
		  4. 조회된 게시물 화면에 출력. 
		*/
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num); // 해당 게시물 조회
		if (request.getRequestURI().contains("board/info.do")) {
			dao.readcntAdd(num); // 해당 게시물의 조회 건수 1 증가
		}
		request.setAttribute("b", b);

		return new ActionForward();
	}

	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);

		request.setAttribute("b", b);
		return new ActionForward();

	}

	

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		// jsp의 어플리케이션을 java에서 getServletContext()로 대체
		String msg = null;
		String url = null;
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();

		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			if (board.getFile1() == null || board.getFile1().equals("")) {
				board.setFile1(multi.getParameter("file2"));
			}
			// 2. 비밀번호 검증
			BoardDao dao = new BoardDao();
			// dbBoard : 수정전 정보 저장. 비밀번호 검증시 사용
			Board dbBoard = dao.selectOne(board.getNum());
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?num=" + board.getNum();
			if (board.getPass().equals(dbBoard.getPass())) {
				if (dao.update(board)) {
					msg = "게시물 수정 완료";
					url = "info.do?num=" + board.getNum();
				} else {
					msg = "게시물 수정 실패";
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String msg = "게시글의 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?num=" + num;
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(num);
		if (board == null) {
			msg = "없는 게시글입니다.";
			url = "list.do";
		} else {
			if (pass.equals(board.getPass())) {
				if (dao.delete(num)) {
					msg = "게시글 삭제 성공";
					url = "list.do";
				} else {
					msg = "게시글 삭제 실패";
					url = "info.do?num=" + num;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "model2/board/imgfile/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");

	}

	// 채팅 화면
	public ActionForward chatform(HttpServletRequest request, HttpServletResponse response) {
		if (logincheck(request)) {
			return new ActionForward();
		} else {
			return new ActionForward(false, "../alert.jsp");
		}
	}

	public boolean logincheck(HttpServletRequest request) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "../member/loginForm.me"); // ../의 나의 하나위 단계
			return false;
		}
		return true;
	}

	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String, Integer>> list = dao.boardgraph();
		System.out.println(list);
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for (Map<String, Integer> m : list) {
			for (Map.Entry<String, Integer> me : m.entrySet()) {
				if (me.getKey().equals("name"))
					json.append("{\"name\":\"" + me.getValue() + "\",");
				if (me.getKey().equals("cnt"))
					json.append("\"cnt\":" + me.getValue() + "}");

			}
			i++;
			if (i < list.size())
				json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}

	public ActionForward graph22(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String, Integer>> list = dao.boardgraph2();
		System.out.println(list);
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for (Map<String, Integer> m : list) {
			for (Map.Entry<String, Integer> me : m.entrySet()) {
				if (me.getKey().equals("regdate"))
					json.append("{\"regdate\":\"" + me.getValue() + "\",");
				if (me.getKey().equals("cnt"))
					json.append("\"cnt\":" + me.getValue() + "}");

			}
			i++;
			if (i < list.size())
				json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward(false, "graph.jsp");
	}

	public ActionForward graph2(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String, Integer>> list = dao.boardgraph2();
		System.out.println(list);
		request.setAttribute("list", list);
		return new ActionForward();
	}

	// jsoup 을 이용하여 크롤링하기
	public ActionForward exchange(HttpServletRequest request, HttpServletResponse response) {
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".tc"); // 국가코드, 환율값 태그선택
			Elements e2 = doc.select(".tl2.bdl"); // 국가이름
			for (int i = 0; i < e1.size(); i++) {
				if (e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html()); // USD 정보 저장
					for (int j = 1; j <= 6; j++) {
						list.add(e1.get(i + j).html());//USD 다음 부터 정보들이 나타남
					}
					break;
				}
			}
			for (Element ele : e2) {
				if (ele.html().contains("미국")) {
					list2.add(ele.html());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		request.setAttribute("list", list);	//통화코드, 환율정보
		request.setAttribute("list2", list2);	//국가명
		request.setAttribute("today", new Date());

		return new ActionForward();
	}
	
	
	//keb 하나은행 환율정보 조회: JSON 형태 데이터 처리
	public ActionForward exchange2(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		System.out.println("????????????");
		Map<String,List<String>> map = new HashMap<>();
		String kebhana=Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
		String strJson= kebhana.substring(kebhana.indexOf("{"));		//indexof 이후 로 다가져와
		System.out.println(strJson);
		JSONParser jsonParser = new JSONParser();	//JSON 번역기
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());	//Json 객체 변경
		request.setAttribute("date", json.get("날짜").toString());
		JSONArray array = (JSONArray)json.get("리스트");
		try {
		for(int i=0; i<array.size(); i++){
			JSONObject obj=(JSONObject)array.get(i);
			if(obj.get("통화명").toString().contains("미국")||
				obj.get("통화명").toString().contains("일본")||
				obj.get("통화명").toString().contains("유로")||
				obj.get("통화명").toString().contains("중국")){
					String str=obj.get("통화명").toString();
					String[] sarr=str.split(" ");
					String key=sarr[0];
					String code=sarr[1];
					List<String> list=new ArrayList<String>();
					list.add(code);
					list.add(obj.get("매매기준율").toString());
					list.add(obj.get("현찰파실때").toString());
					list.add(obj.get("현찰사실때").toString());
					map.put(key,list);
			}
		}
		request.setAttribute("map", map);
		System.out.println("=========");
		System.out.println(map);
		System.out.println("=========");

	}catch(Exception e) {
		e.printStackTrace();
	}
	return new ActionForward();
}
}

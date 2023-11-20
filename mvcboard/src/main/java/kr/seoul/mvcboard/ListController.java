package kr.seoul.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		Map<String, Object> map = new HashMap<>();
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !"".equals(pageTemp)) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int pageSize = 2;
		int start = (pageNum - 1) * pageSize ;
		int end = pageSize;
		
		map.put("start", start);
		map.put("end", end);
//		map.put("start", 0);
//		map.put("end", 2);
		
		int count = dao.selectCount(map);
		List<MVCBoardDTO> board = dao.selectListPage(map);
		
		req.setAttribute("count", count);
		req.setAttribute("board", board);
		
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
//		super.doGet(req, resp);
	}
}

package romance;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Util;

@WebServlet("/romanceBoard")
public class RomanceBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RomanceBoard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Util.str2Int(request.getParameter("page"));
		}

		RequestDispatcher rd = request.getRequestDispatcher("romanceBoard.jsp");
		int best = 1;
		ArrayList<HashMap<String, Object>> list = RomanceDAO.getInstance().boardList((page - 1) * 5);
		ArrayList<HashMap<String, Object>> list2 = RomanceDAO.getInstance().bestBoardList((best - 1) * 3);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		if (list != null && list.size() > 0) {
			request.setAttribute("totalCount", list.get(0).get("totalcount"));
		}

		request.setAttribute("page", page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
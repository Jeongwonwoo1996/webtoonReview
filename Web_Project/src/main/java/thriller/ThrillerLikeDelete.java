package thriller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Util;

@WebServlet("/thrillerLikeDelete")
public class ThrillerLikeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ThrillerLikeDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
		
		if (request.getParameter("tno") != null
				&& Util.str2Int(request.getParameter("tno")) != 0
				&& session.getAttribute("id") != null) {
			
		String id = (String) session.getAttribute("id");
		int tno = Util.str2Int(request.getParameter("tno"));
		
		ThrillerDAO dao = ThrillerDAO.getInstance();
		
		int result = dao.deleteLike(tno, id);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

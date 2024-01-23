package com.poseidon.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.CommentDAO;
import com.poseidon.dto.CommentDTO;
import com.poseidon.util.Util;

@WebServlet("/commentDel")
public class CommentDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentDel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null && request.getParameter("no") != null 
				&&request.getParameter("cno") != null) {
			
			//System.out.println(request.getParameter("no"));
			//System.out.println(request.getParameter("cno"));
			CommentDTO dto = new CommentDTO();
			dto.setMid((String) session.getAttribute("mid"));
			dto.setCno(Util.str2Int(request.getParameter("cno")));
			
			CommentDAO dao = new CommentDAO();
			int result = dao.commentDelete(dto);
			if(result == 1) {
				response.sendRedirect("./detail?no="+request.getParameter("no"));
			}else {
				response.sendRedirect("./error.jsp");
			}
		}else {
			response.sendRedirect("./error.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}

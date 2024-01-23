package com.poseidon.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.BoardDTO;
import com.poseidon.util.Util;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Delete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 글 삭제하기 2024-01-11 + 2024-01-16 로그인 한 사용자 + 내글
		HttpSession session = request.getSession();
		//no가 숫자야? + 로그인 했어?
		if (Util.intCheck(request.getParameter("no")) && session.getAttribute("mid") != null) {
			
			// 숫자네? -> 삭제 진행 -> board로 이동
			// 번호 잡기
			int no = Util.str2Int(request.getParameter("no"));
			// DAO에게 일 시키기
			BoardDAO dao = new BoardDAO();
			//board_no , mid 가 같이 있는 클래스는 BoardDTO
			BoardDTO dto = new BoardDTO();
			dto.setNo(no);
			dto.setMid((String) session.getAttribute("mid"));
			
			int result = dao.delete(dto);
			if (result == 1) {
				response.sendRedirect("./board");

			} else {
				response.sendRedirect("./error.jsp");
			}

		} else {
			response.sendRedirect("./error.jsp");
		}

		// 값이 0 이면 어디로?

		// 값이 1 이면 어디로?

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

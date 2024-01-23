package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.MemberDAO;
import com.poseidon.dto.MemberDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Join() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//값 잡아주세요
		MemberDTO dto = new MemberDTO();
		dto.setMid(request.getParameter("id"));
		dto.setMname(request.getParameter("name"));
		dto.setMpw(request.getParameter("pw1"));
		
		MemberDAO dao = new MemberDAO();
		//db에 보내주세요
		
		int result = dao.join(dto);
		
		if(result == 1) {
			response.sendRedirect("./login");
			
		} else {
			response.sendRedirect("./error");
			
		}
		//정상적으로 데이터입력을 완료했다면 로그인 페이지로,
		//비정상이라묜 에러로 보내주세요
		
	}

}

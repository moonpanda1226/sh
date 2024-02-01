package com.poseidon.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.AdminDAO;

@WebServlet("/admin/ip")
public class Ip extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ip() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("ip"));
		AdminDAO dao = new AdminDAO();
		
		List<Map<String, Object>> list1 = dao.ipList(); 
		List<Map<String, Object>> topIpList = dao.topIpList(); 
		List<Map<String, Object>> latestAccessIP10 = dao.latestAccessIP10(); 

		request.setAttribute("list1", list1);
		request.setAttribute("topIpList", topIpList);
		request.setAttribute("latestAccessIP10", latestAccessIP10);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/ip.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}

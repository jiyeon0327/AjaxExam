package com.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JavascriptAjaxServlet
 */
@WebServlet("/js/test")
public class JavascriptAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavascriptAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("여기로 오니?????????????");
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();//값ㄷ전달용
		out.append("<p>이거는 서버 응답!!</p>");
		out.append("<p>"+name+"</p>");
		out.append("<p>"+nickname+"</p>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

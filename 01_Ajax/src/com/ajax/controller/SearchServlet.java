package com.ajax.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//보낸 데이터 받아오가
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		
		//비즈니스 로직:key과 일치하는 값을 찾아오기!
		Connection conn=null;
		List<String> list=new ArrayList();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","web","web");
			conn.setAutoCommit(false);
			Statement stmt=conn.createStatement();
			String sql="select username from member where username like '%"+key+"%'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		String ids = "";
		if(!list.isEmpty()) {
		for(int i=0;i<list.size();i++) {
			if(i!=0) ids+=",";
			ids+=list.get(i);
			}
		}
		System.out.println(ids);
		response.setContentType("text/csv;charset=UTF-8");
		response.getWriter().append(ids);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

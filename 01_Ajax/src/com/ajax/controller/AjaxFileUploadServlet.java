package com.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.MultipartStream;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AjaxFileUploadServlet
 */
@WebServlet("/ajaxFile")
public class AjaxFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		//저장경로
		String path=getServletContext().getRealPath("/upload");
		//크기
		int maxSize=1024*1024*100;
		MultipartRequest mr=new MultipartRequest(
				request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		//System.out.println(mr.getFilesystemName("upfile"));
		
		//파일 8개 고른거 출력
		//다중파일 업로드를 쉽게 하는 방법
		//이걸 디비에 저장해주면 됨
		//근데 문제는 몇개인지 갯수를 ...다 알기가 어려워
		/*
		 * System.out.println(mr.getFilesystemName("file0"));
		 * System.out.println(mr.getFilesystemName("file1"));
		 * System.out.println(mr.getFilesystemName("file2"));
		 * System.out.println(mr.getFilesystemName("file3"));
		 * System.out.println(mr.getFilesystemName("file4"));
		 * System.out.println(mr.getFilesystemName("file5"));
		 * System.out.println(mr.getFilesystemName("file6"));
		 * System.out.println(mr.getFilesystemName("file7"));
		 */
		//그래서
		List<String> fileNames = new ArrayList();
		//Enumeration이라고 해서 파일이름을 받을수 있게함 이더레이터와 비슷함
		Enumeration<String> e=mr.getFileNames();
		while(e.hasMoreElements()) {
			fileNames.add(mr.getFilesystemName(e.nextElement()));//이 리스트 안에 다 사진을 넣어줌
		}
		System.out.println(fileNames);//배열로 넣어준 값들이 순서대로 출력됨
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

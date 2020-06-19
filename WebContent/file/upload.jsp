<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("/upload/files");

	MultipartRequest mr = null;
	try {
		mr = new MultipartRequest(
				request,
				path, //file path
				10*1024*1024, //file size
				"utf-8", //encoding type
				//파일 이름이 중복되었을 때 파일명 끝에 1,2,3 순으로 이름을 변경해주는 클래스
				new DefaultFileRenamePolicy() 
				);
		//MultipartRequest 객체가 생성되면 파일 업로드 완료
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String name = mr.getParameter("name");
	String fileName = mr.getFilesystemName("file");
	String uploadName = mr.getOriginalFileName("file");
%>

name : <%=name %><br>
file system name : <a href="/upload/files/<%=fileName %>"><%=fileName %></a><br>
file origin name : <%=uploadName %>
<%@page import="kr.or.kpc.dto.CustomerDto2"%>
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CustomerDto2 customerdto = (CustomerDto2)session.getAttribute("login");
	if(customerdto != null){
		
	
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = 0;
	
	NoticeDao dao = NoticeDao.getInstance();
	num = dao.getMaxNum();
	NoticeDto dto = new NoticeDto(num, writer, title, content, null);
	
	int resultCount = dao.insert(dto);
	if(resultCount == 1){
		%>
			<script>
				alert('글이 추가되었습니다.');
				location.href="list.jsp?page=1";
			</script>		
		<%
	} else{
		%>
		<script>
			alert('에러..');
			history.back(-1);
		</script>
		<%
	}
%>

	<%}else{%>
		<script>
			alert('로그인 사용자만 글을 올릴 수 있습니다.');
			history.back(-1);
		</script>
	<%}%>
<%@page import="kr.or.kpc.dto.CustomerDto2"%>
<%@page import="kr.or.kpc.dao.CustomerDao2"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	System.out.println(email);
	CustomerDao2 dao = CustomerDao2.getInstance();//
	CustomerDto2 dto = dao.getLogin(email, pwd);
	
	if(dto != null) {
		response.sendRedirect("/member/mypage.jsp");
	}else {
		// email과 pwd가 일치하지 않는 경우
%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.back(-1);
		</script>
		<%
	}
%>
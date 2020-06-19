<%@page import="kr.or.kpc.dto.CustomerDto2"%>
<%@page import="kr.or.kpc.dao.CustomerDao2"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String cpwd = request.getParameter("cpwd");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	CustomerDao2 dao = CustomerDao2.getInstance();
	CustomerDto2 dto = dao.getLogin(email, cpwd);
	
	if(dto != null) {
		//update
		dto = new CustomerDto2(email, pwd, name);
		int resultCount = dao.update(dto);
		if(resultCount == 1) {
			
			session.setAttribute("login", dto);
			%>
			<script>
			alert("회원정보가 수정 되었습니다. ");
			location.href="/member/mypage.jsp";
			</script>
			<% 
		}else {
			%>
			<script>
			alert("에러....");
			history.back(-1);
		</script>
			<% 
		}
		
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
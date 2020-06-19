<%@page import="kr.or.kpc.dto.CustomerDto2"%>
<%@page import="kr.or.kpc.dao.CustomerDao2"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("post")) {
	
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
		
			CustomerDao2 dao = CustomerDao2.getInstance();
			CustomerDto2 dto = new CustomerDto2(email, pwd, name);
			int resultCount = dao.insert(dto);
			if (resultCount == 1) {
		%>
		<script>
			alert('회원가입에 성공했습니다.');
			location.href = "login.jsp";
		</script>
		<%
			} else {
		%>
		<script>
			alert('에러....');
			history.back(-1);
		</script>
		<%
			}
		%>
		<%}else{%>
		<script>
			alert('POST방식으로 요청해야합니다. ');
			location.href="join.jsp";
		</script>
	<%
		}
%>
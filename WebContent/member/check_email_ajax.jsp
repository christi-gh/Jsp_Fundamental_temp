<%@page import="kr.or.kpc.dao.CustomerDao2"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"%>
<% 
	String email = request.getParameter("email");
	CustomerDao2 dao = CustomerDao2.getInstance();
	boolean existed = dao.isExisted(email);
	if(existed){
		%>
		{"result": "fail"}
		<%
	}else{
		%>
		{"result": "okay"}
		<%
	}
	
%>
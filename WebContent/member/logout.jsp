<%@page import="kr.or.kpc.dto.CustomerDto2"%>
<%@page import="kr.or.kpc.dao.CustomerDao2"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션객체를 삭제한다.
	//세션객체의 속성을 삭제한다. (장바구니 비우기)
	//session.removeAttribute("cart");
	response.sendRedirect("/member/login.jsp");
%>
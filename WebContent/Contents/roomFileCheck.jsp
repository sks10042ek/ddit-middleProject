<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String res = (String)request.getAttribute("result");
	
	response.setContentType("application/json; charset/utf-8");

	Gson gson = new Gson();

	String result = gson.toJson(res);

	out.print(result);

%>
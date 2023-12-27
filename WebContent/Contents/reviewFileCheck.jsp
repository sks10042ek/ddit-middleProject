<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String res = (String)request.getAttribute("result");
	
	if(res.equals("ok")){
%>
{"sw" : "ok"}
<%		
	}else{
%>
{"sw" : "no"}
<%
	}
%>
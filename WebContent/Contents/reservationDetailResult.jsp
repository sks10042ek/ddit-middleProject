<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.middle.vo.Info_ReservVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Info_ReservVO vo = (Info_ReservVO)request.getAttribute("resVo");
response.setContentType("application/json; charset/utf-8");

Gson gson = new Gson();

String result = gson.toJson(vo);

out.print(result);
%>
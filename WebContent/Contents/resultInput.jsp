<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 저장한 데이터 꺼내기
	int res = (int)request.getAttribute("checkResult");
	
	if(res == 0){
		//사용가능 (db에 입력한 id없음 중복x)
%>		
	{
		"sw" : "사용가능한 ID입니다."
	}
<%	
	}else{
		//사용 불가능(아이디 중복)
%>
	{
		"sw" : "사용불가능한 ID입니다."
	}
<%
	}
%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="movieborad.wrestlerDAO"%>
<jsp:useBean id="Wrestler" class="movieborad.wrestler" scope="page"></jsp:useBean>
<jsp:setProperty name="Wrestler" property="wrestlerContent" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		// 아이디가 없으면 로그인 페이지로 반환 
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('로그인이 필요 합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		// 제목 or 게시글 내용이 없으면 입력 하라고 시키기
		if(Wrestler.getWrestlerContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			wrestlerDAO wrestlerDAO = new wrestlerDAO();
			int result = wrestlerDAO.write(userID, Wrestler.getWrestlerContent()); //작성하게 시키기
			if(result == -1){
				//데이터 베이스 오류 라면 글쓰기에 실패 하였다라고 알림
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패 하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				//성공적으로 완성 하였다면 게시판으로 이동 시키기
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='Wrestler.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
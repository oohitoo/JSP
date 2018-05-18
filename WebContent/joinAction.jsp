<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="user.UserDAO" %>
<%@ page import ="java.io.PrintWriter"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope = "page"/>
<jsp:setProperty name="user" property= "userID" />
<jsp:setProperty name="user" property= "userPassword"/>
<jsp:setProperty name="user" property= "userName" />
<jsp:setProperty name="user" property= "userGender"/>
<jsp:setProperty name="user" property= "userEmail" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 만들기</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 항목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('동일한 아이디가 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	}
		/* else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다..')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생 했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} */
	%>
</body>
</html>
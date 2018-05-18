<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.Bbs" %>
<%@ page import="user.BbsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 만들기</title>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'borad.jsp");
			script.println("</script>");
		}
		int idx = 0;
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은 글입니다.')");
			script.println("location.href = 'borad.jsp");
			script.println("</script>");
		}
	%>
	<div class="container">

		<nav class="navbar navbar-default">
			<!-- Brand and toggle get grouped for better mobile display -->
	    
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
			</div>
			<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li class ="active"><a href="main.jsp">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container">
			<div class="row">
			<form method="post" action="updateAction.jsp?idx=<%= idx %>">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan ="2" style="backgroud-color : #eeeeee; text-align: center;">게시판수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글제목" name="boradTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글내용" name="boradContent" maxlength="2048" ></textarea></td>
						</tr>
					</tbody>
				 </table>
				 <input type="submit" class="btn btn-primary pull-right" value="글쓰기"> 
				 </form>
			</div>
		</div>
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>

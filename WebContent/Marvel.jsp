<%@ page import="java.io.PipedWriter" %>
<%@ page import="movieborad.marvel"%>
<%@ page import="movieborad.marvelDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>영화예고편</title>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){//페이지 번호가 넘어 왔다면
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //정수형으로 반환
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
				<%
					if(userID == null){
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				<% 
					}else { 
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</nav>
		<div class="embed-responsive embed-responsive-16by9">
		<iframe width="1920" height="1280" src="https://www.youtube.com/embed/xUDhdCsLkjU" ></iframe>
		</div>
		<br><br><br>
				<div class="container">
			<div class="row">
			<form method="post" action="marvelAction.jsp">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan ="2" style="backgroud-color : #eeeeee; text-align: center;">댓글 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="댓글내용" name="marvelContent" maxlength="50"	></td>
						</tr>
					</tbody>
				 </table>
				 <input type="submit" class="btn btn-primary pull-right" value="작성"> 
				 </form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color : #eeeeee; text-align: center;">번호</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">내용</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">작성자</th>
						</tr>
					</thead>
					<tbody>
					<%
						marvelDAO marvelDAO = new marvelDAO();
						ArrayList<marvel> list = marvelDAO.getList(pageNumber);
						for(int i = 0 ; i <list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getIdx() %></td>
							<td><%= list.get(i).getMarvelContent()%></td>
							<td><%= list.get(i).getUserID() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				 </table>
				 
			</div>
		</div>
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>
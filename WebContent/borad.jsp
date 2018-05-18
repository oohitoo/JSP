<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.BbsDAO" %>
<%@ page import="user.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color : #eeeeee; text-align: center;">번호</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">제목</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">작성자</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">작성일</th>
							<th style="backgroud-color : #eeeeee; text-align: center;"></th>
							<th style="backgroud-color : #eeeeee; text-align: center;"></th>
						</tr>
					</thead>
					<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0 ; i <list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getIdx() %></td>
							<td><a href="view.jsp?idx=<%= list.get(i).getIdx()%>"><%= list.get(i).getBoradTitle() %></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBoradDate().substring(0,11) + list.get(i).getBoradDate().substring(11,13) + "시" + list.get(i).getBoradDate().substring(14,16) + "분" %></td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
						<%
						}
						%>
					</tbody>
				 </table>
				<%
					if(pageNumber != 1){	
				%>
					<a href=borad.jsp?pageNumber=<%= pageNumber - 1 %> class="btn btn-success btn-arraw-Left">이전</a>
				<%
					}if(bbsDAO.nextPage(pageNumber + 1)){
				%>
					<a href="borad.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-Left">다음</a>
				<%
					}
				%>
				 <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				 
			</div>
		</div>
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>

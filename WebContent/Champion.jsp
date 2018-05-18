<%@ page import="java.io.PipedWriter" %>
<%@ page import="movieborad.Champion"%>
<%@ page import="movieborad.ChampionDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>��ȭ������ ����Ʈ</title>
</head>
<body>
	<div class="container">
		<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){//������ ��ȣ�� �Ѿ� �Դٸ�
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //���������� ��ȯ
		}
	%>
		<nav class="navbar navbar-inverse"> <!-- Brand and toggle get grouped for better mobile display -->

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">����</a></li>
				<li><a href="borad.jsp">�Խ���</a></li>
			</ul>
			<%
					if(userID == null){
				%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> �����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">�α���</a></li>
						<li><a href="join.jsp">ȸ������</a></li>
					</ul></li>
			</ul>
			<% 
					}else { 
				%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> ȸ������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
					</ul></li>
			</ul>
			<%
					}
				%>
		</div>
		</nav>
		<div class="embed-responsive embed-responsive-16by9">
		<iframe width="1280" height="720" src="https://www.youtube.com/embed/YgN4RghTCgA" frameborder="0" allow="autoplay;"allowfullscreen></iframe>
		</div>
		<br><br><br>
		<div class="container">
			<div class="row">
			<form method="post" action="championAction.jsp">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan ="2" style="backgroud-color : #eeeeee; text-align: center;">������ ���</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea rows="5" class="form-control" placeholder="��۳���" name="championContent" maxlength="2048" ></textarea></td>
						</tr>
					</tbody>
				 </table>
				 <input type="submit" class="btn btn-primary pull-right" value="���"> 
				 </form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgroud-color : #eeeeee; text-align: center;">��ȣ</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">����</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">�ۼ���</th>
						</tr>
					</thead>
					<tbody>
					<%
						ChampionDAO championDAO = new ChampionDAO();
						ArrayList<Champion> list = championDAO.getList(pageNumber);
						for(int i = 0 ; i <list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getIdx() %></td>
							<td><%= list.get(i).getChampionContent()%></td>
							<td><%= list.get(i).getUserID() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				 </table>
				 
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
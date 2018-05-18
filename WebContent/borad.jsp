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
<title>�Խ��� �����</title>
</head>
<body>
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
	<div class="container">

		<nav class="navbar navbar-default">
			<!-- Brand and toggle get grouped for better mobile display -->
	    
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
			</div>
			<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">����</a></li>
					<li class ="active"><a href="main.jsp">�Խ���</a></li>
				</ul>
				<%
					if(userID == null){
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						�����ϱ�<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">�α���</a></li>
							<li><a href="join.jsp">ȸ������</a></li>
						</ul>
					</li>
				</ul>
				<% 
					}else { 
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						ȸ������<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
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
							<th style="backgroud-color : #eeeeee; text-align: center;">��ȣ</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">����</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">�ۼ���</th>
							<th style="backgroud-color : #eeeeee; text-align: center;">�ۼ���</th>
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
							<td><%= list.get(i).getBoradDate().substring(0,11) + list.get(i).getBoradDate().substring(11,13) + "��" + list.get(i).getBoradDate().substring(14,16) + "��" %></td>
							<td>����</td>
							<td>����</td>
						</tr>
						<%
						}
						%>
					</tbody>
				 </table>
				<%
					if(pageNumber != 1){	
				%>
					<a href=borad.jsp?pageNumber=<%= pageNumber - 1 %> class="btn btn-success btn-arraw-Left">����</a>
				<%
					}if(bbsDAO.nextPage(pageNumber + 1)){
				%>
					<a href="borad.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-Left">����</a>
				<%
					}
				%>
				 <a href="write.jsp" class="btn btn-primary pull-right">�۾���</a>
				 
			</div>
		</div>
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>��ȭ ������ ����Ʈ</title>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
					<li class ="active"><a href="main.jsp">����</a></li>
					<li><a href="borad.jsp">�Խ���</a></li>
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
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/���Ǵ�Ƽ.jpg" alt="��� �߸���" class = "img-rounded">
					<div class="caption">
						<span class="label label-primary">12</span>
						<h3>�����</h3>
						<p>�帣 : �׼�, ����, ��Ÿ��, SF</p>
						<p>12�� ������</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">����</a> 
							<a href="Marvel.jsp" class="btn btn-info" role="button">������</a>
						</p>
					</div>
				</div>
			</div>
						<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/������.jpg" alt="��� �߸���">
					<div class="caption">
						<h3>������</h3>
						<p>�帣 : ���, �ڹ̵�</p>
						<p>15�� ������</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">����</a> <a
								href="Wrestler.jsp" class="btn btn-info" role="button">������</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/è�Ǿ�.jpg" alt="��� �߸���">
					<div class="caption">
						<h3>è�Ǿ�</h3>
						<p>�帣 : ���</p>
						<p>12�� ������</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">����</a> <a
								href="Champion.jsp" class="btn btn-info" role="button">������</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/Ŀ�ٶ���Ŀ�ٶ���.jpg" alt="��� �߸���">
				<div class="caption">
					<h3>Ŀ�ٶ���Ŀ�ٶ���Ŀ�ٶ���</h3>
					<p>�帣 : �ִϸ��̼�</p>
					<p>��ü ������</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">����</a> <a
							href="Bigship.jsp" class="btn btn-info" role="button">������</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/�簥.jpg" alt="��� �߸���">
				<div class="caption">
					<h3>�簥</h3>
					<p>�帣 : ���, �׼�</p>
					<p>12�� ������</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">����</a> <a
							href="Posters.jsp" class="btn btn-info" role="button">������</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/�󸮸�.jpg" alt="��� �߸���">
				<div class="caption">
					<h3>�󸮸�</h3>
					<p>�帣 : �ִϸ��̼�</p>
					<p>��ü�̿밡</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">����</a> <a
							href="EarlyMan.jsp" class="btn btn-info" role="button">������</a>
					</p>
				</div>
			</div>
		</div>
		<%=application.getContextPath()%><br>
		<%=request.getSession().getServletContext().getRealPath("/")%><br>
		<%= application.getRealPath("/image") %>
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>

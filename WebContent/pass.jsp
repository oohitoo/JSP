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
<a href="http://www.cgv.co.kr/ticket/" target="_black"><button type="button" class="btn btn-lg btn-block btn-danger">CGV</button><br></a>
<a href="http://www.megabox.co.kr/?show=booking&p=step1" target="_black"><button type="button" class="btn btn-lg btn-block btn-warning">�ް��ڽ�</button><bR></a>
<a href="http://www.lottecinema.co.kr/LCHS/Contents/ticketing/ticketing.aspx" target="_black"><button type="button" class="btn btn-lg btn-block btn-success">�Ե��ó׸�</button></a>
<Br>		
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
</body>
</html>

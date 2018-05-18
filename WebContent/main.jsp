<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>영화 예고편 사이트</title>
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
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
			</div>
			<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class ="active"><a href="main.jsp">메인</a></li>
					<li><a href="borad.jsp">게시판</a></li>
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
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/인피니티.jpg" alt="경로 잘못됨" class = "img-rounded">
					<div class="caption">
						<span class="label label-primary">12</span>
						<h3>어벤져스</h3>
						<p>장르 : 액션, 모험, 판타지, SF</p>
						<p>12세 관람가</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> 
							<a href="Marvel.jsp" class="btn btn-info" role="button">예고편</a>
						</p>
					</div>
				</div>
			</div>
						<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/레슬러.jpg" alt="경로 잘못됨">
					<div class="caption">
						<h3>레슬러</h3>
						<p>장르 : 드라마, 코미디</p>
						<p>15세 관람가</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> <a
								href="Wrestler.jsp" class="btn btn-info" role="button">예고편</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="movie/챔피언.jpg" alt="경로 잘못됨">
					<div class="caption">
						<h3>챔피언</h3>
						<p>장르 : 드라마</p>
						<p>12세 관람가</p>
						<p>
							<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> <a
								href="Champion.jsp" class="btn btn-info" role="button">예고편</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/커다랗고커다랗고.jpg" alt="경로 잘못됨">
				<div class="caption">
					<h3>커다랗고커다랗고커다란배</h3>
					<p>장르 : 애니메이션</p>
					<p>전체 관람가</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> <a
							href="Bigship.jsp" class="btn btn-info" role="button">예고편</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/당갈.jpg" alt="경로 잘못됨">
				<div class="caption">
					<h3>당갈</h3>
					<p>장르 : 드라마, 액션</p>
					<p>12세 관람가</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> <a
							href="Posters.jsp" class="btn btn-info" role="button">예고편</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="movie/얼리맨.jpg" alt="경로 잘못됨">
				<div class="caption">
					<h3>얼리맨</h3>
					<p>장르 : 애니메이션</p>
					<p>전체이용가</p>
					<p>
						<a href="pass.jsp" class="btn btn-danger" role="button">예매</a> <a
							href="EarlyMan.jsp" class="btn btn-info" role="button">예고편</a>
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

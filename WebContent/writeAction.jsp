<%@page import="user.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="user.BbsDAO" %>
<%@ page import ="java.io.PrintWriter"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="bbs" class="user.Bbs" scope = "page"/>
<jsp:setProperty name="bbs" property= "boradTitle" />
<jsp:setProperty name="bbs" property= "boradContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �����</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		// ���̵� ������ �α��� �������� ��ȯ 
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('�α����� �ʿ� �մϴ�.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		// ���� or �Խñ� ������ ������ �Է� �϶�� ��Ű��
		if(bbs.getBoradTitle() == null || bbs.getBoradContent()== null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �ȵ� �׸��� �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BbsDAO userDAO = new BbsDAO();
			int result = userDAO.write(bbs.getBoradTitle(), userID, bbs.getBoradContent()); //�ۼ��ϰ� ��Ű��
			if(result == -1){
				//������ ���̽� ���� ��� �۾��⿡ ���� �Ͽ��ٶ�� �˸�
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�۾��⿡ ���� �Ͽ����ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				//���������� �ϼ� �Ͽ��ٸ� �Խ������� �̵� ��Ű��
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='borad.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
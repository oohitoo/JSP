<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="movieborad.wrestlerDAO"%>
<jsp:useBean id="Wrestler" class="movieborad.wrestler" scope="page"></jsp:useBean>
<jsp:setProperty name="Wrestler" property="wrestlerContent" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		if(Wrestler.getWrestlerContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �ȵ� �׸��� �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			wrestlerDAO wrestlerDAO = new wrestlerDAO();
			int result = wrestlerDAO.write(userID, Wrestler.getWrestlerContent()); //�ۼ��ϰ� ��Ű��
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
				script.println("location.href='Wrestler.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
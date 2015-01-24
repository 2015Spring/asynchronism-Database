<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	String email = request.getParameter("email"); 
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("insert into users (email) values ('" + email + "')");
	
	ResultSet rs = stmt.executeQuery("select * from users");
	
	while(rs.next()) {
		String value = rs.getString("email");
	%>
		<%= value %><br>
	<%
	}
	%>
</body>
</html>
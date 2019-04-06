<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cookit regjsp</title>
</head>
<body>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%
String user=request.getParameter("userid"); 
session.putValue("userid",user);
String pwd=request.getParameter("pwd"); 
String fname=request.getParameter("fname"); 
String lname=request.getParameter("lname"); 
String email=request.getParameter("email");
String url = "jdbc:sqlite:C:/sqlite/cookit.db";
String sql = "insert into users values(?,?,?,?,?);";
Class.forName("org.sqlite.JDBC");
try (Connection conn = DriverManager.getConnection(url);
       	 PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user);
            pstmt.setString(2, pwd);
	    pstmt.setString(3, fname);
	    pstmt.setString(4, lname);
	    pstmt.setString(5, email);            
pstmt.executeUpdate();
	out.println("Registered");
        } catch (SQLException e) {
	out.println("NOT Registered");
	out.println(e.getMessage()); 
        }

%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
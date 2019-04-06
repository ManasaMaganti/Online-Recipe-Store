<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginjsp</title>
</head>
<body>
	<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
	<%
String userid=request.getParameter("usr"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd");
String url = "jdbc:sqlite:C:/sqlite/cookit.db";
Class.forName("org.sqlite.JDBC");
Connection con = DriverManager.getConnection(url);
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"'"); 
if(rs.next())
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("welcome"+userid); 

} 
else 
{ 
out.println("Invalid password try again"); 
} 
} 
else
{
Exception e=new Exception();
e.printStackTrace();
}

st.close();
con.close();
%>
<a href="index.html">Home</a>
</body>
</html>
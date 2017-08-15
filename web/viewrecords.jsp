<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="records" type="java.sql.ResultSet" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MVC Model 2 Lecture</title>
</head>
<body>
	<%@ include file="design/header.html" %>
	
	<h2 align="center">BPI Forex Records</h2>
	<table align="center" border="1">
		<tr>
			<th>#</th>
			<th>Peso Amount</th>
			<th>Currency Type</th>
			<th>Equivalent Value</th>
		</tr>
	
	
	<%
		while(records.next()){
	%>
	
		<tr align="center">
			<td><%= records.getInt("id") %></td>
			<td><%= records.getString("pesoAmount") %></td>
			<td><%= records.getString("currencyType") %></td>
			<td><%= records.getString("message") %></td>
		</tr>

		<% } %>

	</table>

	<form action="index.jsp">
		<input type="submit" value="<<GO BACK>>"/>
	</form>
	<%@ include file="design/footer.jsp" %>
</body>
</html>
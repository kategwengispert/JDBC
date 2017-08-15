<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <jsp:useBean id="forex" type="bpi.model.ForexBean" scope="request"/>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MVC Model 2 Lecture</title>
</head>
<body>
	<%@ include file="design/header.html"%>
	<p>Philippine Peso Amount: <b>Php
		<jsp:getProperty name="forex" property="pesoAmount" /></b></p>
	<p>Computed Value: <b>
		<jsp:getProperty name="forex" property="message" />
	</b></p> 
	
	<form action="getallrecords.html">
		<input type="submit" value="View all records">
	</form>
	
	<!-- create a form that once the submit button is selected,
	it goes back to the form -->
	
	<form action="index.jsp">
		<input type="submit" value="<< GO BACK >>"/>
	</form>
	
	<%@ include file="design/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MVC Model 2 Lecture</title>
</head>
<body>
	<%@ include file="design/header.html"%>
	<fieldset>
		<legend>BPI Forex Form</legend>
		<form action='processcurrencyexchange.html' method='post'>
			<p>Enter Philippine Peso Amount: Php
				<input type='number' name='pesoAmount' id='pesoAmount'
					min='1000' max='300000' required="required"/>
			</p>
			<p>Select Currency:
				<select name='currencyType' id='currencyType'>
					<option value='USD'>US$</option>
					<option value='EUR'>&euro;uro</option>
					<option value='JPY'>&yen;en</option>
					<option value='AUD'>AUS$</option>
				</select> 
			</p>
			<p><input type="submit" value='Compute Currency Exchange'/>
			   &nbsp;&nbsp;&nbsp; 
			   <input type='reset'/> 		
		</form>
	</fieldset>
	<%@ include file="design/footer.jsp"%>
</body>
</html>
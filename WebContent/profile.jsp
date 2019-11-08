<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<title>User Profile</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="card">
<div class="content">
<h1>Personal Information</h1>
<table>
<tr>
<td>First Name:</td>
<td>${person.fname}</td>
</tr>

<tr>
<td>Last Name:</td>
<td>${person.lname}</td>
</tr>

<tr>
<td>Address</td>
<td>${person.address}</td>
</tr>

<tr>
<td>Email</td>
<td>${person.email}</td>
</tr>

<tr>
<td>Phone Number</td>
<td>${person.phonenumber}</td>
</tr>

<tr>
<td>Level</td>
<td>${person.levelname}</td>
</tr>

</table>
</div>
</div>
</body>
</html>
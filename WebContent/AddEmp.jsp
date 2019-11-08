<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<style>
table td, table th {border: none;}
</style>
<title>Add Employee</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="card">
<div class="content">
<h1>Add Employee</h1>
<html:form action="newemp"  name="addeForm" type="form.AddeForm">
<table >
<tr>
<td>Username:</td>
<td><html:text property="username"/></td>
</tr>
<tr>
<td>Password:</td>
<td><html:password property="password"/></td>
</tr>
<tr>
<td>First Name:</td>
<td><html:text property="fname"/></td>
</tr>
<tr>
<td>Last Name:</td>
<td><html:text property="lname"/></td>
</tr>
<tr>
<td>Address:</td>
<td><html:text property="address"/></td>
</tr>
<tr>
<td>Email:</td>
<td><html:text property="email"/></td>
</tr>
<tr>
<td>Phone number:</td>
<td><html:text property="phone"/></td>
</tr>
<tr>
<td>Level:</td>
<td><html:select property="level">
<html:option value="2">Team Leader</html:option>
<html:option value="3">Developer</html:option>
</html:select></td>
</tr>
<tr>
<td></td>
<td>
<html:submit value="Add Employee"/> 
</td>
</tr>
</table>
</html:form>
</div>
</div>
</body>
</html>
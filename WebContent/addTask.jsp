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
<title>Add Task</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="card">
<div class="content">
<h1>Add task</h1>
<html:form action="addtask"  name="addtForm" type="form.AddtForm">
<table>
<tr><td>
Title:</td><td> <html:text property="title"/></td>
</tr>
<tr><td>
Summary:</td><td><html:textarea property="summary" ></html:textarea></td>
</tr>
<tr><td></td><td>
<html:submit value="Add Task"/> 
</td></tr>
</table>
</html:form>
</div>
</div>
</body>
</html>
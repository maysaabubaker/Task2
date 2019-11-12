<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page  isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Task</title>
<link rel="stylesheet" href="home.css" type="text/css">
<style>
table td, table th {border: none;}
</style>
</head>
<body>
<div class="card">
<div class="content">
<h1>Assign task</h1>
<html:form action="assign" name="assignForm" type="form.AssignForm">
<table>
<tr><td>
Title:</td><td> <html:text property="title"/></td>
</tr>
<tr><td>
Summary:</td><td><html:textarea property="summary" ></html:textarea></td>
</tr>
<tr><td></td>
<td><input type="hidden" name="aid" value="${param.aid}"/></td>
</tr>
<tr><td></td><td>
<html:submit value="Assign"/> </td></tr>
</table>
</html:form>
</div>
</div>
</body>
</html>
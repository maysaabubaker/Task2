<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<script type="text/javascript" src="sort-table.js"></script>

<title>Developer Home</title>
</head>
<body>

<div class="card">
<div class="content">
<h1>Developer Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
<th>Status</th>
<th></th>
</tr>
<logic:iterate id="task" name="userTasks">
<logic:notEqual name="task"
property="status"
value="waiting leader">
<tr>
<td><bean:write name="task" property="tid"/></td>
<td><bean:write name="task" property="title"/></td>
<td><bean:write name="task" property="summary"/></td>
<td><bean:write name="task" property="status"/></td>
<td>
<html:form action="changeStatus" name="cstatusForm" type="form.CstatusForm" >
<html:radio property="status"  value="to do"/> to do<br>
<html:radio property="status"  value="in progress"/> in progress<br>
<html:radio property="status"  value="completed"/>completed<br>
<html:hidden property="tid" value="${task.tid}"/>
<br>
<center>
<html:submit value="Change Status"/>
</center>
<br>
</html:form>
</td>

</tr>
</logic:notEqual>
</logic:iterate>
</table>
<h1>Pending Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
</tr>
<logic:iterate id="task" name="userTasks">
<logic:equal name="task"
property="status"
value="waiting leader">
<tr>
<td><bean:write name="task" property="tid"/></td>
<td><bean:write name="task" property="title"/></td>
<td><bean:write name="task" property="summary"/></td>

</tr>
</logic:equal>
</logic:iterate>
</table>
</div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
 <%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<script type="text/javascript" src="sort-table.js"></script>

<title>Developer Home</title>
</head>
<body>
<jsp:include page="header.jsp"/>
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
<c:forEach var="task" items="${userTasks}">
<c:if test="${task.status != 'waiting leader'}">
<tr>
<td>${task.tid}</td>
<td>${task.title}</td>
<td>${task.summary}</td>
<td>${task.status}</td>
<td>
<html:form action="changeStatus" name="cstatusForm" type="form.CstatusForm" >
<c:choose>
<c:when test="${task.status=='in progress'}">
<html:radio property="status"  value="to do"/> to do<br>
<html:radio property="status"  value="in progress"/> in progress<br>
<html:radio property="status"  value="completed"/>completed<br>
</c:when>
<c:when test="${task.status=='to do'}">
<html:radio property="status"  value="to do"/> to do<br>
<html:radio property="status"  value="in progress"/> in progress<br>
<html:radio property="status"  value="completed"/>completed<br></c:when>
<c:when test="${task.status=='completed'}">
<html:radio property="status"  value="to do"/> to do<br>
<html:radio property="status"  value="in progress"/> in progress<br>
<html:radio property="status"   value="completed"/>completed<br>
</c:when>
<c:otherwise>
<html:radio property="status"  value="to do"/> to do<br>
<html:radio property="status"  value="in progress"/> in progress<br>
<html:radio property="status"  value="completed"/>completed<br>
</c:otherwise>
</c:choose>
<html:hidden property="tid" value="${task.tid}"/>
<br>
<center>
<html:submit value="Change Status"/>
</center>
<br>
</html:form>
</td>

</tr>
</c:if>
</c:forEach>
</table>
<h1>Pending Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
</tr>
<c:forEach var="task" items="${userTasks}">
<c:if test="${task.status == 'waiting leader'}">
<tr>
<td>${task.tid}</td>
<td>${task.title}</td>
<td>${task.summary}</td>

</tr>
</c:if></c:forEach>
</table>
</div>
</div>
</body>
</html>

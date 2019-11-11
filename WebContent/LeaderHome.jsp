<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page  isELIgnored="false"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<script type="text/javascript" src="sort-table.js"></script>
<title>Leader Home</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="card">
<div class="content">
<h1>Leader Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
<th>Status</th>
<th></th>
</tr>
<c:forEach var="task" items="${userTasks}">
<c:if test="${task.status != 'waiting manager'}">
<tr>
<td>${task.tid}</td>
<td>${task.title}</td>
<td>${task.summary}</td>
<td>${task.status}</td>
<td>
<html:form action="changeStatus" name="cstatusForm" type="form.CstatusForm">
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
<br>
<h1>Pending Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
</tr>
<c:forEach var="task" items="${userTasks}">
<c:if test="${task.status == 'waiting manager'}">
<tr>
<td>${task.tid}</td>
<td>${task.title}</td>
<td>${task.summary}</td>

</tr>
</c:if>
</c:forEach>
</table>
<br>
<h1>Developers</h1>
<table border=1 class="js-sort-table">
<tr>
<th>Name</th>
<th>Tasks</th>
<th></th>
</tr>
<c:forEach var="developer" items="${developers}">
<tr>
<tr>
<td>${developer.name}</td>

<td>

<html:form action="vtask" name="vtaskForm" type="form.VtaskForm" >
<html:hidden property="pid" value="${developer.id}"/>
<html:submit value="View Tasks" styleId="myBtn" />
</html:form>
</td>

<td>
<html:link href="Assign.jsp?aid=${developer.id}" styleClass="anch">Assign</html:link>
</td>

</tr>
</c:forEach>
</table>
<br><br>
<c:if test="${not empty vtasks}">
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close" id="close">&times;</span>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
<th>Status</th>
</tr>
<c:forEach var="task" items="${vtasks}">
<tr>
<td>${task.tid}</td>
<td>${task.title}</td>
<td>${task.summary}</td>
<td>
<c:choose>
<c:when test="${task.status!='waiting leader'}">
${task.status}
</c:when>
<c:when test="${task.status=='waiting leader'}">
<html:form action="atask" name="arForm" type="form.ARForm" >
<html:hidden property="tid" value="${task.tid}"/>
<html:submit value="accept"/>
</html:form>
<br/>
<html:form action="rtask" name="arForm" type="form.ARForm" >
<html:hidden property="tid" value="${task.tid}"/>
<html:submit value="reject"/>
</html:form>
</c:when>
</c:choose>
</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</c:if>
<br>

</div>
</div>

</body>
<script type="text/javascript">
//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it ?
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
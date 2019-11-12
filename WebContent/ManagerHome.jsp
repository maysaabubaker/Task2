<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page  isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="home.css" type="text/css">
<script type="text/javascript" src="sort-table.js"></script>
<title>Manager Home</title>
</head>
<body>
<div class="card">
<div class="content">
<h1>Manager Tasks</h1>
<table border=1 class="js-sort-table">
<tr><th>Task Id</th>
<th>Title</th>
<th>Summary</th>
<th>Status</th>
<th></th>
</tr>
<logic:iterate id="task" name="userTasks">
<logic:notEmpty name="task"
property="status">
<tr>
<td><bean:write name="task" property="tid"/></td>
<td><bean:write name="task" property="title"/></td>
<td><bean:write name="task" property="summary"/></td>
<td><bean:write name="task" property="status"/></td>
<td>
<html:form action="changeStatus" name="cstatusForm" type="form.CstatusForm">
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
</logic:notEmpty>
</logic:iterate>
</table>

<br>
<h1>Team Leaders</h1>
<table border=1 class="js-sort-table">
<tr>
<th>Name</th>
<th>Tasks</th>

</tr>
<logic:iterate id="leader" name="leaders">
<tr>
<td><bean:write name="leader" property="name"/></td>
<td>
<html:form action="vtask" name="vtaskForm" type="form.VtaskForm" >
<html:hidden property="pid" value="${leader.id}"/>
<html:submit value="View Tasks" styleId="myBtn" />
</html:form>
</td>
</tr>
</logic:iterate>
</table>
<h1>Developers</h1>
<table border=1 class="js-sort-table">
<tr>
<th>Name</th>
<th>Leader Name</th>
<th>Tasks</th>
</tr>
<logic:iterate id="developer" name="developers">
<tr>
<tr>
<td><bean:write name="developer" property="name"/></td>
<td><bean:write name="developer" property="lename"/></td>

<td>
<html:form action="vtask" name="vtaskForm" type="form.VtaskForm" >
<html:hidden property="pid" value="${developer.id}"/>
<html:submit value="View Tasks" styleId="myBtn"/>
</html:form>
</td>


</tr>
</logic:iterate>
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
<logic:iterate id="task" name="vtasks">

<tr>
<td><bean:write name="task" property="tid"/></td>
<td><bean:write name="task" property="title"/></td>
<td><bean:write name="task" property="summary"/></td>
<td>
<c:choose>
<c:when test="${task.status!='waiting manager'}">
${task.status}
</c:when>
<c:when test="${task.status=='waiting manager'}">
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
</logic:iterate>
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
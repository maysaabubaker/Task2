    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ page  isELIgnored="false"%>
    <%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="sidebar.css" type="text/css">


<title>Left Sidebar</title>
</head>
<body>
		<ul class="mcd-menu">
			
			<li>
				<html:link href="profile.do">
					<i class="fa fa-edit"></i>
					<strong>Profile</strong>
				</html:link>
			</li>
			<c:choose>
			<c:when test="${level==1}">
			<li>
				<html:link href="mhome.do" >
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</html:link>
			</li>
			</c:when>
			<c:when test="${level==2}">
			<li>
				<html:link href="lhome.do">
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</html:link>
			</li>
			</c:when>
			<c:when test="${level==3}">
			<li>
				<html:link href="dhome.do">
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</html:link>
			</li>
			</c:when>
			</c:choose>
			
			<li>
				<html:link href="addTask.do">
					<i class="fa fa-globe"></i>
					<strong>Add Task</strong>
				</html:link>
			</li>
			<c:if test="${level==1}">
			<li>
				<html:link href="addEmp.do">
					<i class="fa fa-globe"></i>
					<strong>Add Employee</strong>
				</html:link>
			</li>
			</c:if>
		</ul>

	</body>
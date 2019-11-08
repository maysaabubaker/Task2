    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ page  isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/task11/sidebar.css" type="text/css">


<title>Developer Home</title>
</head>
<body>
		<ul class="mcd-menu">
			
			<li>
				<a href="profile.do" class="${pageContext.request.requestURI eq '/task11/profile.jsp' ? ' active' : ''}">
					<i class="fa fa-edit"></i>
					<strong>Profile</strong>
				</a>
			</li>
			<c:choose>
			<c:when test="${level==1}">
			<li>
				<a href="mhome.do" class="${pageContext.request.requestURI eq '/task11/ManagerHome.jsp' ? ' active' : ''}">
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</a>
			</li>
			</c:when>
			<c:when test="${level==2}">
			<li>
				<a href="lhome.do" class="${pageContext.request.requestURI eq '/task11/LeaderHome.jsp' ? ' active' : ''}">
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</a>
			</li>
			</c:when>
			<c:when test="${level==3}">
			<li>
				<a href="dhome.do" class="${pageContext.request.requestURI eq '/task11/DeveloperHome.jsp' ? ' active' : ''}">
					<i class="fa fa-gift"></i>
					<strong>Tasks</strong>
				</a>
			</li>
			</c:when>
			</c:choose>
			
			<li>
				<a href="addTask.jsp" class="${pageContext.request.requestURI eq '/task11/addTask.jsp' ? ' active' : ''}">
					<i class="fa fa-globe"></i>
					<strong>Add Task</strong>
				</a>
			</li>
			<c:if test="${level==1}">
			<li>
				<a href="AddEmp.jsp" class="${pageContext.request.requestURI eq '/task11/AddEmp.jsp' ? ' active' : ''}">
					<i class="fa fa-globe"></i>
					<strong>Add Employee</strong>
				</a>
			</li>
			</c:if>
		</ul>

	</body>
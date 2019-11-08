<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page  isELIgnored="false"%>
       <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/task11/header.css" type="text/css">


<title>header</title>
</head>
<body>
<ul class="uhdr">
  <li class="lhdr"><a class="ahdr"><img src="images/logo.png" alt="logo" width=40 height=40/>TMS</a></li>
  <li class="lhdr"style="margin-left:75%;"><a class="ahdr">Hi ${username}</a></li>

  <li class="lhdr"><a  class="ahdr" href="logout.do">Logout</a></li>

</ul>
<jsp:include page="sidebar.jsp"/>
</body>
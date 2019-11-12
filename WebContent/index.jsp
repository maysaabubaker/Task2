<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<link rel="stylesheet" href="login.css" type="text/css">

<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<div class="login-page">
  <div class="form">

<html:form action="Login" name="loginForm" type="form.LoginForm">
 Username: <html:text property="username"/><br/>
Password: <html:password property="password"/><br/>
<html:submit value="Login"/>
</html:form>
  </div>
</div>
</body>
</html>
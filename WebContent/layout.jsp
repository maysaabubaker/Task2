<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>
<tiles:getAsString name="title" ignore="true"/>
</title>
</head>
<body>
<tiles:insert attribute="header"></tiles:insert>
<tiles:insert attribute="sidebar"></tiles:insert>
<tiles:insert attribute="body"></tiles:insert>
<tiles:insert attribute="footer"></tiles:insert>

</body>
</html>
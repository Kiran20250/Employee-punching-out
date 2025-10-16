<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Task Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/task.css'/>"/>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img class="img" src="${pageContext.request.contextPath}/img/CRBIXLOGO.png" alt="Logo">
        </div>
        <div class="logout" onclick="window.location='${pageContext.request.contextPath}/logout'">
            <p>LogOut</p>
        </div>
    </header>

<!-

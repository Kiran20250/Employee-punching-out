<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Employee Escalation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/emp-escalation.css'/>"/>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img class="img" src="${pageContext.request.contextPath}/img/CRBIXLOGO.png" alt="Logo">
        </div>

    </header>

    <!-- Main Layout -->
                                 data-priority="${task.priority}"
                             data-assignedby="${task.assignedBy != null ? task.assignedBy.username : 'Admin'}"
                             data-duedate="${task.dueDate != null ? task.dueDate : 'No Deadline'}"
                             data-status="${task.status}">
                            <p><strong>${task.title}</strong></p>
                            <span class="badge">${task.status}</span>
                        </div>
                    </c:forEach>
                    <c:if test="${empty escalatedTasks}">
                        <div class="no-task">No escalated tasks</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/tasks" class="back-btn">Back to Dashboard</a>

    <!

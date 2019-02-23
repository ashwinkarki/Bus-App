<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Training</title>
</head>

<body>
<g:form method="post" action="update">
    <g:hiddenField name="id" value="${editTraining.id}"/>

    <g:textField name="name" value="${editTraining.name}"/><br>
    <g:textField name="startDate" value="${editTraining.startDate}"/><br>
    <g:textField name="endDate" value="${editTraining.endDate}"/><br>
    <g:textField name="cost" value="${editTraining.cost}"/><br>
    <g:submitButton name="Update" value="Update"/>
</g:form>

</body>
</html>
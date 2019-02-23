<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Organization</title>
</head>

<body>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>List Organization</title>
</head>

<body>
<table>
    <tr>
        <th>S.N</th>
        <th>Organization Name</th>
        <th>Organization Establishmten</th>
        <th>Organization Logo</th>
        <th>Organization Description</th>
        <th>Organization Location</th>

        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <g:each in="${orgLists}" var="org" status="orgCount">
        <tr>
            <td>${orgCount+1}</td>
            <td>${org.orgName}</td>
            <td>${org.orgEsta}</td>
            <td>${org.orgLogo}</td>
            <td>${org.orgDesc}</td>
            <td>${org.orgLoc}</td>
            <td><g:link action="edit" id="${org.id}">edit</g:link> </td>
            <td><g:link action="delete" id="${org.id}" onclick="return confirm('Are you sure?')">delete</g:link> </td>
        </tr>
    </g:each>
</table>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<h1><font color="red">You are able to apply now</font></h1>
<div class="container">
<g:each in="${trainingLists}" var="training">
    <div class="card">
        <div class="card-header">
            <h3>Organization Name:</h3>${training.organization.orgName}</div>
        <div class="card-body">
            <h3>Organization Description:</h3>${training.organization.orgDesc}</div>
        <div class="card-body">
          <h3>Training Available:</h3>${training.name}</div>
    <sec:ifNotLoggedIn>
        <g:link controller="organization" action="notconfirmed">Apply</g:link>
    </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <g:link controller="organization" action="confirmed">Apply</g:link>
        </sec:ifLoggedIn>
    </div>
    <br>
</g:each>
</div>

</body>
</html>
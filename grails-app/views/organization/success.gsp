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

<div class="container">
    <h1>You have Currently Applied!!!</h1>
    <h1>Selected candidate are called or Emailed!!</h1>
    <div class="card">
        <div class="card-header">
            <h3>Organization Name:</h3>${trainApp.organization.orgName}</div>
        <div class="card-body">
            <h3><img src="${application.contextPath
            }/static/assets/images/${trainApp.organization.orgLogo}" height="150px" width="150px"/></h3>
            <h3>Organization Description:</h3>${trainApp.organization.orgDesc}</div>
        <div class="card-body">
            <h3>Training Available:</h3>${trainApp.name}
            <h4>Views</h4><h4>${trainApp.views}</h4>
            <h4>MaxID:</h4><h4>${maxTrain.id}</h4>
            <g:link controller="organization" action="cancel" class="btn btn-danger" id="${maxTrain.id}" onclick="return confirm('Do you sure want to perform?')">Cancel</g:link>
        </div>

    </div>
    <br>
</div>
</body>
</html>
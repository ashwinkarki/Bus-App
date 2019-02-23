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
<h1><div class="alert alert-danger">Please Login First To Apply!!!!</div></h1>
<div class="container">
    <h2 class="section-title">Current Trainings To Apply</h2>
    <g:each in="${trainingLists}" var="training" status="count">
        <div class="row">
            <div class="col-md-12">
                <div class="job-list">
                    <div class="thumb">
                        <a href=""><img src="${application.contextPath
                        }/static/assets/images/${training.organization.orgLogo}" height="100px" width="100px"/></a>
                    </div>
                    <div class="job-list-content">
                        <h4>${training.organization.orgName}</h4>
                        <p>Training Available:<h5>${training.name}</h5></p>
                        <p>No of Vacancy:<b>${training.vacancy}</b></p>
                        <p>Views:<span class="glyphicon glyphicon-eye-open"></span><b>&nbsp;${training.views}</b></p>
                        <p>Organization Description:${training.organization.orgDesc}</p>

                        <div class="job-tag">
                            <div class="pull-right">
                                <div class="icon">
                                    <i class="ti-heart"></i>
                                </div>
                                <button type="button" class="btn btn-common btn-rm" data-toggle="modal" data-target="#myModal_${training.id}">
                                    More Detail
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>



        <!-- Modal -->
        <div class="modal fade" id="myModal_${training.id}" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">${training.organization.orgName}</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">

                        <h3>Training Available:</h3><p>${training.name}</p>
                        <h3>Training Start Date:</h3><p>${training.startDate}</p>
                        <h3>Training End Date:</h3><p>${training.endDate}</p>
                        <h3>Training Cost:</h3><p>Rs.${training.cost}</p>
                    </div>
                    <div class="modal-footer">
                        <sec:ifNotLoggedIn>
                            <g:link controller="organization" action="notconfirmed" class="btn btn-success">Apply</g:link>
                        </sec:ifNotLoggedIn>
                        <sec:ifLoggedIn>
                            <g:link controller="organization" action="confirmed" id="${training.id}" class="btn btn-success">Apply</g:link>
                        </sec:ifLoggedIn>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
                    </div>
                </div>

            </div>
        </div>

    </g:each>

</div>

</body>
</html>
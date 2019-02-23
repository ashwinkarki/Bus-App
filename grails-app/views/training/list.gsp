<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>List Training</title>
    %{--<export:resource />--}%
</head>

<body>
%{--<g:link action="subscribe"-->Subscribe</g:link>
<g:link action="uploadImage">Upload Image</g:link>--}%


<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close">
                            </span>Organization</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <g:each in="${com.ashwin.Organization.list()}" var="qc">
                                    <tr>
                                        <td>
                                            <span class="glyphicon glyphicon-pencil text-primary"></span><g:link action="list" id="${qc.id}">${qc.orgName}</g:link>
                                        </td>
                                    </tr>
                                </g:each>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-9 col-md-9">
            <g:form action="list" method="GET">
                <div class="fieldcontain">
                    <label for="query">Search for tasks:</label>
                    <g:textField name="query"/>
                </div>
            </g:form>

            <table class="table table-hover">
                <tr>
                    <th>S.N</th>
                    <th>Training Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Cost</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <g:each in="${trainingList}" var="q" status="count">
                    <tr>
                        <td>${count+1}</td>
                        <td>${q.name}</td>
                        <td>${q.startDate}</td>
                        <td>${q.endDate}</td>
                        <td>${q.cost}</td>
                        <td><g:link action="edit" id="${q.id}">Edit</g:link></td>
                        <td><g:link action="delete" id="${q.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
                    </tr>
                </g:each>
            </table>

            <div class="pagination">
                <g:paginate total="${count}"/>
            </div>
            <!--export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" /-->
        </div>
        <g:each in="${com.ashwin.TrainUser.list()}" var="qc">
            <tr>
                <td>
                    <span class="glyphicon glyphicon-pencil text-primary"></span><g:link action="list" id="${qc.id}">${qc.date}</g:link>
                </td>
            </tr>
        </g:each>
    </div>

    <!--to See the job-->

</div>
</body>
</html>
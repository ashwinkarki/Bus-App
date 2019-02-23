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

                            </span>Vacancy Applied<br>
                                <h4>  ${trainUsers.training.id}</h4></a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <g:each in="${trainUsers}" var="qc">
                                    <tr>
                                        <td>
                                            <span class="glyphicon glyphicon-pencil text-primary"></span><g:link action="list" id="${qc.training.id}">${qc.training.name}</g:link>
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


            <table class="table table-striped">
                <tr>
                    <th>S.N</th>
                    <th>Date Applied</th>
                    <th>Training Applied</th>
                    <th>Admin Viewed</th>
                    <th>Action</th>

                </tr>

                <g:each in="${trainUsers}" var="q" status="count">

                    <tr>
                        <td>${count+1}</td>
                        <td>${q.date}</td>
                         <td>${q.training.name}</td>
                        <g:if test="${q.status}">
                            <td><span class="glyphicon glyphicon-eye-open"></span>Seen</td>
                        </g:if>
                        <g:else>
                            <td><span class="glyphicon glyphicon-eye-close"></span>Not Seen</td>
                        </g:else>

                     <td>  <g:link action="delete" id="${q.id}" onclick="return confirm('Are you sure?')" class="btn btn-sm btn-danger">Cancel</g:link></td>
                    </tr>
                </g:each>
            </table>


        </div>

    </div>

</div>

</div>
</body>
</html>
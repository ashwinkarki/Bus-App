<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <title>List Training</title>
    %{--<export:resource />--}%
</head>

<body>




<div class="container">
    <div class="alert alert-info" role="alert">
Welcome<br>
    <h4>  ${organ.orgName}- :)</h4>
        <a href=""><img src="${application.contextPath
        }/static/assets/images/${organ.orgLogo}" height="100px" width="100px"/></a>
     <p>Estab:${organ.orgEsta}</p>
        <p>Location:${organ.orgLoc}</p>
        <g:link controller="organization" action="edit" id="${organ.id}" class="btn btn-default btn-sm">Edit</g:link>
        <g:link controller="organization" action="delete" onclick="return confirm('Are you sure?')" id="${organ.id}" class="btn btn-default btn-sm">Delete</g:link>
        <g:link controller="training" action="history" id="${organ.id}" class="btn btn-default btn-sm">History Training</g:link>
    </div>
    </div>
    <div class="row">


        <div class="col-sm-12 col-md-12">


            <table class="table table-bordered">
                <tr>
                    <th>S.N</th>
                    <th>Date Applied</th>
                    <th>Email</th>
                    <th>Training Applied</th>
                    <th>CV</th>
                    <th>Action</th>


                </tr>

                <g:each in="${trainuserLists}" var="q" status="count">
                    <tr>
                        <td>${count+1}</td>
                        <td>${q.date}</td>
                        <td>${q.user.username}</td>
                        <td>${q.training.name}</td>
                        <td><a href="${application.contextPath
                        }/static/assets/cv/${q.cvName}" download>
                            View CV
                        </a></td>
                    <td><g:link action="confirm" id="${q.id}" class="btn btn-sm btn-success">Confirm</g:link>

                    <g:link action="delete" id="${q.id}" onclick="return confirm('Are you sure?')" class="btn btn-sm btn-danger">Reject</g:link></td>
                    </tr>
                </g:each>
            </table>

            <div class="pagination">
                <g:paginate total="${count}"/>
            </div>
            <!--export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" /-->
        </div>

    </div>




    </div>


</body>
</html>
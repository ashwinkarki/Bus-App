<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
    </head>
    <body>

    <div class="container">
            <table class="table table-striped">
                <tr>
                    <th>Start Date</th>
                    <th>Training Name</th>
                    <th>Vacancy</th>
                    <th>Views</th>
                    <th>Cost</th>
                    <th>End Date</th>
                    <th>Action</th>


                </tr>

                <g:each in="${training}" var="q" >
                    <tr>
                        <td>${q.startDate}</td>
                        <td>${q.name}</td>
                        <td>${q.vacancy}</td>
                        <td>${q.views}</td>
                        <td>${q.cost}</td>
                        <td>${q.endDate}</td>
                        <td><g:link action="editorgtrain" id="${q.id}" class="btn btn-sm btn-success">Edit</g:link>

                            <g:link action="delorgtrain" id="${q.id}" onclick="return confirm('Are you sure?')" class="btn btn-sm btn-danger">Delete</g:link></td>
                    </tr>
                </g:each>
            </table>


        </div>

    </div>
    </div>
    </body>
</html>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

        <title>Upload a CV</title>
    </head>
    <body>

    <h1>Upload a CV:</h1>

    <hr>

    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-md-5">
                    <div class="well">
                        <h4 class="text-danger"><span class="label label-danger pull-right"></span>

                            <g:uploadForm action="savecv">
                                <input type="file" name="getFile" placeholder="choose CV"/>
                                <h3>Please Upload the .pdf file only</h3>
                                <g:submitButton name="upload" value="upload"/>
                            </g:uploadForm> </h4>
                    </div>
                </div>

            </div><!--/row-->
        </div><!--/col-12-->
    </div>
    <br>

    <h2>Your Recent Uploaded CV</h2>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>CV Name</th>
            <th>Action</th>

        </tr>
        </thead>
    <g:each in="${cv}" var="q">
        <tbody>
        <tr>
            <td>${q.cvName}</td>
            <td><g:link action="delete" id="${q.id}" onclick="return confirm('Are you sure?')" class="btn btn-sm btn-danger">Cancel</g:link></td>

        </tr>
        </tbody>
    </table>
</g:each>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <style>
   #txtbox
   {
       font-size:18pt;
       height:300px;
       width:500px;
   }

   #txtbox1
   {
       font-size:11pt;
       height:20px;
       width:250px;
   }


   </style>


    <title>List Training</title>


</head>

<body>

<div class="container">
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Conforming for the Interview</h4>
            </div>
            <div class="modal-body">
                <g:form action="send">
                    <h4>Email to:</h4><g:textField name="email" placeholder="Enter email" value="${trainuser.user.username}" readonly="readonly"/><br>
                    <h4>Subject:</h4><g:textField id="txtbox1" name="subject" placeholder="Enter subject" value="Further Details Regarding Interview"/><br>
                    <h4>Message:</h4><g:textArea  id="txtbox" name="body" placeholder="Enter message" value="You have currently applied
to our organization ${organiza.orgName} for the training ${train.name}.You have been selected for interview.You will be called for interview at date-.Please review our website for further information."/><br>
                    <g:submitButton name="send" value="send" class="btn btn-success"/>
                </g:form>
            </div>
            <div class="modal-footer">
                <g:link controller="trainUser" action="list" class="btn btn-danger">Back</g:link>
            </div>
        </div>

    </div>
</div>
</div>





<script type="text/javascript">

    $(document).ready(function() {
        $('#myModal').modal('show');
    });


</script>
</body>
</html>
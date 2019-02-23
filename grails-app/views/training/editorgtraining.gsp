<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/3.3.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $( function() {
            var dates = $( "#dp , #dp1" ).datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                minDate : 0,
                maxDate : "+3Y",
                onSelect: function( selectedDate ) {
                    var option = this.id == "dp" ? "minDate" : "maxDate",
                        instance = $( this ).data( "datepicker" );
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                        $.datepicker._defaults.dateFormat,
                        selectedDate, instance.settings );
                    dates.not( this ).datepicker( "option", option, date );
                }
            });
        });
    </script>
    <title>Create Training According to Organization</title>
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
                    <h4 class="modal-title"><h3>Edit Training - ${training.name}</h3><br></h4>
                </div>
                <div class="modal-body">
                    <g:form method="post" action="updateorgTrain" class="form-horizontal">
                        <g:hiddenField name="id" value="${training.id}"/>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Training Name</label>
                            <div class="col-xs-10">
                                <g:textField name="name" value="${training.name}"/><br>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-xs-2">Enter training start date</label>
                            <div class="col-xs-10">
                                <g:textField name="startDate" id="dp"/><br>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-xs-2">Enter training end date</label>
                            <div class="col-xs-10">
                                <g:textField name="endDate" id="dp1" /><br>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-xs-2">Enter training cost</label>
                            <div class="col-xs-10">
                                <g:textField name="cost" placeholder="Enter training cost" value="${training.cost}"/><br>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-xs-2">Enter No of vancancy</label>
                            <div class="col-xs-10">
                                <g:textField name="vacancy" placeholder="Enter No of vancancy" value="${training.vacancy}"/><br>

                            </div>
                        </div>



                        <g:link controller="trainUser" action="list">
                            <button type="button" class="btn btn-danger">Cancel</button>
                        </g:link>
                        <g:submitButton name="updateorgTrain" value="Update" class="btn btn-success"/>

                    </g:form>
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
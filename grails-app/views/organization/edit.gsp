<html>
<head>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style>
    body {font-family: Arial, Helvetica, sans-serif;}
    * {box-sizing: border-box}
    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    /* Add a background color when the inputs get focus */
    input[type=text]:focus, input[type=password]:focus {
        background-color: #ddd;
        outline: none;
    }

    /* Set a style for all buttons */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity:1;
    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        padding: 14px 20px;
        background-color: #f44336;
    }

    /* Float cancel and signup buttons and add an equal width */
    .cancelbtn, .signupbtn {
        float: left;
        width: 50%;
    }

    /* Add padding to container elements */
    .container {
        padding: 16px;
    }

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: #474e5d;
        padding-top: 50px;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* Style the horizontal ruler */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }

    .close:hover,
    .close:focus {
        color: #f44336;
        cursor: pointer;
    }

    /* Clear floats */
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Change styles for cancel button and signup button on extra small screens */
    @media screen and (max-width: 300px) {
        .cancelbtn, .signupbtn {
            width: 100%;
        }
    }
    </style>

</head>

<body>


<div id="id01" class="modal">
    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    <g:uploadForm method="post" action="update" class="modal-content">
        <div class="container">
            <g:hiddenField name="id" value="${editOrg.id}"/>
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an organization.</p>
            <hr>
            <label><b>Organization Name</b></label>
            <g:textField name="orgName" value="${editOrg.orgName}"/>

            <label><b>Organization Establishment</b></label>
            <g:textField name="orgEsta" value="${editOrg.orgEsta}" />

            <label><b>Choose Organization image</b></label><br/><br/>
            <input type="file" name="getFile" value="${editOrg.orgLogo}" /><br/><br/>

            <label for="orgDesc"><b>Organization Description</b></label><br/>
            <g:textArea name="orgDesc" value="${editOrg.orgDesc}" /><br/><br/>

            <label for="orgLoc"><b>Organization Location</b></label>
            <g:textField name="orgLoc" value="${editOrg.orgLoc}" />

            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

            <div class="clearfix">
                <g:link controller="trainUser" action="list">
                    <button type="button" class="cancelbtn">Cancel</button>
                </g:link>
                <button type="submit" name="save" class="signupbtn">Sign Up</button>

            </div>
        </div>
    </g:uploadForm>
</div>
<script>
    var modal1 = document.getElementById('id01');

    $(window).on('load',function(){
        $('#id01').modal('show');
    });
    window.onclick = function(event) {
        if (event.target == modal1) {
            modal1.style.display = "none";
        }
    }
</script>


</body>
</html>
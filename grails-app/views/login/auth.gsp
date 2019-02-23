<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style>

    body {font-family: Arial, Helvetica, sans-serif;}

    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 16px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
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
    }

    button:hover {
        opacity: 0.8;
    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }

    img.avatar {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
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
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        padding-top: 60px;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        -webkit-animation: animatezoom 0.6s;
        animation: animatezoom 0.6s
    }

    @-webkit-keyframes animatezoom {
        from {-webkit-transform: scale(0)}
        to {-webkit-transform: scale(1)}
    }

    @keyframes animatezoom {
        from {transform: scale(0)}
        to {transform: scale(1)}
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 100px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 50%;
        }
    }
    </style>
</head>
<body>



%{--<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>--}%
<div class="container">
<div id="id01" class="modal">

    <form class="modal-content animate" method="POST" action="${postUrl ?: '/login/authenticate'}">
        <div class="imgcontainer">
            <g:link controller="organization" action="index"> <span class="close" title="Close Modal">&times;</span></g:link>
            <asset:image src="oldman.png" width="200" height="200" />
        </div>

        <div class="container">
            <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
            <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>

            <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
            <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>


            <label>
                <input type="checkbox" class="chk" name="remember-me" id="remember_me"/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </label>
        </div>
    <button type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}">Login</button>

        <div class="container" style="background-color:#f1f1f1">
            <g:link controller="organization" action="index">
                <button type="button" class="cancelbtn">Cancel</button>
            </g:link>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </form>
</div>
</div>
<script>
    // Get the modal
    var modal1 = document.getElementById('id01');

    $(window).on('load',function(){
        $('#id01').modal('show');
    });

</script>

</body>
</html>

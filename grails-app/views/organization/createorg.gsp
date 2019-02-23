<!DOCTYPE html>
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
            width: 30%; /* Could be more or less, depending on screen size */
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
        <g:link controller="organization" action="index"> <span class="close" title="Close Modal">&times;</span></g:link>
        <g:form class="modal-content" action="saveorg" method="POST">
            <div class="container">
                <h1>Sign Up</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>
                <label for="email"><b>Email</b></label>
                <g:textField name="username" placeholder="Enter UserName"/>
                <label for="psw"><b>Password</b></label>
                <g:passwordField name="password1" id="pass1" placeholder="Enter Password" />

                <label for="psw-repeat"><b>Repeat Password</b></label>
                <g:passwordField name="password" id="pass2" placeholder="Confirm Password" onkeyup='check();'/>

                <label>
                    <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
                </label>

                <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
                <div class="alert alert-success" style="display: none" id="showAlert">
                    <strong><span id='message'></span></strong>
                </div>
                <div class="alert alert-success" style="display: none" id="showAlert1">
                    <strong><span id='message1'></span></strong>
                </div>

                <div class="clearfix">
            <g:link controller="organization" action="index">
                <button type="button" class="cancelbtn">Cancel</button>
            </g:link>
                    <button type="submit"  name="saveorg" class="signupbtn" id="submit">Sign Up</button>
                </div>
            </div>
        </g:form>>
    </div>
        <script>
            var check = function() {
                if (document.getElementById('pass1').value ==
                    document.getElementById('pass2').value) {
                    document.getElementById('showAlert').style.display = 'block';
                    document.getElementById('message').style.color = 'green';
                    document.getElementById('message').innerHTML = 'Password Finally Matched';
                    document.getElementById('submit').disabled = false;
                    if(document.getElementById('pass1').value.length<5 && document.getElementById('pass2').value.length<5){
                        document.getElementById('showAlert').style.display = 'block';
                        document.getElementById('message').style.color = 'red';
                        document.getElementById('message').innerHTML = 'Pasword Minimum Length must be 5character';
                        document.getElementById('submit').disabled = false;
                    }
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'Passpord Not Matching';
                    document.getElementById('submit').disabled = true;
                }
            }
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

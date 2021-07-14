<%-- 
    Document   : loginsuccess
    Created on : May 14, 2021, 11:43:00 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Login - Bootstrap Admin Template</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0,
              maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"
              />

        <link href="css/font-awesome.css" rel="stylesheet">
        <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
            rel="stylesheet">

        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="css/pages/signin.css" rel="stylesheet" type="text/css">

    </head>
    <style>

    </style>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container"> <a class="btn btn-navbar" data-toggle="collapse"
                                           data-target=".nav-collapse"><span
                            class="icon-bar"></span><span class="icon-bar"></span><span
                            class="icon-bar"></span> </a><a class="brand" href="GetDeviceController">Sharing Device</a>

                    <!--/.nav-collapse -->
                </div>
                <!-- /container -->
            </div>
            <!-- /navbar-inner -->
        </div>
        <div class="account-container register">
            <div class="content clearfix">
                <form action="MainController" method="post">
                    <h1>OTP Verification</h1>
                    <div class="login-fields">
                        <div><h4>We've sent a verification code to your email - ${requestScope.Email} - Please check your email</h4> <br></div>
                            <%
                                String error = (String) request.getAttribute("Error");
                                if (error != null) {
                            %>
                        <h4><font style=" background-color: pink; margin-bottom: 20px; border-radius: 1px" color="red" >${requestScope.Error}</font>
                        </h4><br>
                        <%}%>
                        <div class="item">
                            <p>The OTP code will expire in: <span id="seconds">60</span>s </p>

                        </div>

                        <div class="field">
                            <input type="text" name="txtVerification" value=""
                                   placeholder="Enter verification code"  class="login" />
                        </div> <!-- /field -->

                    </div> <!-- /login-fields -->
                    <div class="login-actions" > 

                        <input type="submit" id="verify" name="action" value="Verify"  class="button btn btn-primary btn-large" >
                    </div> <!-- .actions -->

                </form>

            </div> <!-- /content -->

        </div> <!-- /account-container -->


        <div class="login-extra">
            Don't have an account? <a href="signup.jsp">Signup to your account</a>
        </div> <!-- /login-extra -->


        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/bootstrap.js"></script>

        <script src="js/signin.js"></script>

    </body>
    <script>
        var time = 60;
        var myVar = setInterval(function () {
            var noW = time--;

            if (noW > -1) {
                document.getElementById("seconds").innerText = noW;
            } else {
                var html = document.getElementById("verify");

                html.setAttribute("disabled","true");
                console.log(html);
                clearInterval(myVar);
            }
        }, 1000);

    </script>
</html>



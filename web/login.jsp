<%-- 
    Document   : login
    Created on : May 12, 2021, 3:19:36 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Login</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0,
              maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="487259664764-u00t7ebkomi4clinkebl82c7hki946ih.apps.googleusercontent.com">

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"
              />

        <link href="css/font-awesome.css" rel="stylesheet">
        <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
            rel="stylesheet">

        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="css/pages/signin.css" rel="stylesheet" type="text/css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <style>
        p.error{

            width: 300px;
            padding: 15px; 
            margin: auto;
            margin-bottom: 10px;
            margin-top: 10px;
        }
        div{
            border-radius: 5px;
        }
        h1{
            text-align: center;
        }
        .social_login .social_box {
            display: block;
            clear: both;
            padding: 10px;
            margin-bottom: 10px;
            background: #F4F4F2;
            overflow: hidden;
        }
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
        <div class="account-container">
            <div class="content clearfix">
                <form action="LoginController" method="post">
                    <h1>Member Login</h1>
                    <div class="login-fields">
                        <div style="background-color: pink;">
                            <c:if test="${requestScope.error.length() > 0}">
                                <p class="error"><font color="red">${requestScope.error}</font></p>
                            </c:if></div>

                        <p>Please enter your User and Password</p>
                        <div class="field">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="txtUsername" value="${requestScope.id.length()>0 ? requestScope.id : '' }"
                                   placeholder="Username" class="login username-field" />
                        </div> <!-- /field -->

                        <div class="field">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="txtPassword" value="${requestScope.pass.length()>0 ? requestScope.pass : '' }"
                                   placeholder="Password" class="login password-field" />
                        </div> <!-- /password -->
                    </div> <!-- /login-fields -->
                    <div class="g-recaptcha" data-sitekey="6LeRWtYaAAAAAAhG6WWGnSGcNLheCZwn8D3Vn8h9 "></div>


                    <br>
                    <div class="social_login">
                        <div class="">

                           
                            <a  href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8181/J3.L.P0016.ResourceSharing/LoginGoogleController&response_type=code
                                &client_id=487259664764-u00t7ebkomi4clinkebl82c7hki946ih.apps.googleusercontent.com&approval_prompt=force" class="social_box google">
                                <span class="icon"><i class="fa fa-google-plus"></i></span>
                                <span class="icon_title">Connect with Google</span>
                            </a>
                        </div> 


                    </div>



                    <div class="login-actions">
                        <input type="submit" name="action" value="Login" class="button btn btn-primary btn-large">

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

    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
            async defer>
    </script>




</html>


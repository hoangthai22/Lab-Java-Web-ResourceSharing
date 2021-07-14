<%-- 
    Document   : signup
    Created on : May 12, 2021, 3:21:31 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Signup - Bootstrap Admin Template</title>

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
            }</style>
    </head>
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
                    <h1>Signup for Free Account</h1>
                    <div class="login-fields">
                        <c:if test="${requestScope.errorRes.length() > 0}">
                            <div style="background-color: pink;">
                                <p class="error"><font color="red">${requestScope.errorRes}</font></p>
                            </div> </c:if>
                            <p>Create your free account:</p>
                            <div class="field">
                                <input type="text" name="txtFullName" value="${ not empty requestScope.regisError.fullName ? requestScope.regisError.fullName : '' }"
                                   placeholder="Full Name" class="login" />
                        </div> <!-- /field -->

                        <div class="field">
                            <input type="text" name="txtUserID" value="${not empty requestScope.regisError.userId ? requestScope.regisError.userId : '' }" placeholder="Email"
                                   class="login" />
                        </div> <!-- /field -->

                        <div class="field">
                            <input type="password" name="txtPassword" value="${not empty requestScope.regisError.password ? requestScope.regisError.password : '' }"
                                   placeholder="Password" class="login" />
                        </div> <!-- /field -->

                        <div class="field">
                            <input type="password"  name="txtConfirmPassword"
                                   value="" placeholder="Confirm Password" class="login" />
                        </div> <!-- /field -->

                        <div class="field">
                            <input type="text"  name="txtPhone"
                                   value="${not empty requestScope.regisError.phoneNumber ? requestScope.regisError.phoneNumber : '' }" placeholder="Phone Number" class="login" />
                        </div> <!-- /field -->

                        <div class="field">
                            <input type="text"  name="txtAddress"
                                   value="${not empty requestScope.regisError.address ? requestScope.regisError.address : '' }" placeholder="Address" class="login" />
                        </div> <!-- /field -->
                        <div class="field">
                            <select name="txtRole">
                                <option value="LE">Leaders</option>
                                <option value="EM">Employees</option>
                            </select>
                        </div> <!-- /field -->
                    </div> <!-- /login-fields -->
                    <div class="login-actions">

                        <input type="submit" name="action" value="Register" class="button btn btn-primary btn-large">

                    </div> <!-- .actions -->

                </form>

            </div> <!-- /content -->

        </div> <!-- /account-container -->


        <!-- Text Under Box -->
        <div class="login-extra">
            Already have an account? <a href="login.jsp">Login to your account</a>
        </div> <!-- /login-extra -->


        <script src="js/jquery-1.7.2.min.js"></script>
        <script src="js/bootstrap.js"></script>

        <script src="js/signin.js"></script>

    </body>

</html>


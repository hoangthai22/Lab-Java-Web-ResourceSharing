<%-- 
    Document   : menu
    Created on : May 12, 2021, 8:45:21 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container"> <a class="btn btn-navbar" data-toggle="collapse"
                                           data-target=".nav-collapse"><span
                            class="icon-bar"></span><span class="icon-bar"></span><span
                            class="icon-bar"></span> </a><a class="brand" href="GetDeviceController">Sharing Device</a>

                    <div class="nav-collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown">${sessionScope.user.userId}</a>
                            <li class="dropdown"><a href="#" class="dropdown-toggle"data-toggle="dropdown"><i class="icon-cog">Account</i><b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="javascript:;">Profile</a></li>
                                    <li><a href="LogoutController">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!-- /container -->
            </div>
            <!-- /navbar-inner -->
        </div>
        <!-- /navbar -->
        <div class="subnavbar">
            <div class="subnavbar-inner">
                <div class="container">
                    <ul id="myUL" class="mainnav">

                        <c:if test="${sessionScope.user.roleId == 'MA'}">
                            <li class="item"><a href="MainController?action=Get  All"><i class="icon-list-alt"></i><span>Manager Request</span>
                                </a> </li>
                            </c:if>

                        <c:if test="${sessionScope.user.roleId == 'EM' || sessionScope.user.roleId == 'LE'}">
                            <li class="item"><a href="GetDeviceController"><i class="icon-home"></i><span>Home</span>
                                </a> </li>
                            <li class="item"><a href="MainController?action=GetAllHistory"><i class="icon-list-alt"></i><span>Request History</span>
                                </a> </li>
                            </c:if> 
                    </ul>
                </div>
                <!-- /container -->
            </div>
            <!-- /subnavbar-inner -->
        </div>
        <!-- /subnavbar -->

    </body>
    
</html>

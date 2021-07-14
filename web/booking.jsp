<%-- 
Document   : booking
Created on : May 13, 2021, 8:57:25 PM
Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Account - Bootstrap Admin Template</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0,
              maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">

        <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
            rel="stylesheet">
        <link href="css/font-awesome.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
    </head>
    <style>
        .table th{
            text-align: center;
            font-size: 12px;
        }
        .table td{
            text-align: center;
        }
        .error{
            background-color: rgb(255, 210, 218);
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="main">
                <div class="main-inner">
                    <div class="container">
                        <div class="row">
                            <div class="span12">
                                <div class="widget">
                                    <div class="widget-header">
                                        <i class="icon-user"></i>
                                        <h3>Your Account</h3>
                                    </div> <!-- /widget-header -->
                                    <form action="MainController" method="post" id="edit-profile" class="form-horizontal">
                                        <div class="widget-content">
                                            <div class="tabbable">
                                                <ul class="nav nav-tabs">
                                                    <li>
                                                        <h3><i class="icon-user"></i>&ensp;User Information</h3>
                                                        </div> <!-- /widget-header -->
                                                    </li>
                                                </ul>
                                                <div class="tab-content">

                                                    <fieldset>
                                                        <div class="form-actions">
                                                            <div class="control-group" style="margin-left: -200px" >

                                                                <label class="control-label">UserID:</label>
                                                                <div class="controls">
                                                                    <input type="text" class="span3 disabled" name="txtUserId" value="${sessionScope.user.userId}" readonly="true">
                                                            </div> <!-- /control-group -->
                                                            <br>    
                                                            <div class="control-group">
                                                                <label class="control-label">Role:</label>
                                                                <div class="controls">
                                                                    <input type="text" class="span2" name="txtRole" value="${sessionScope.user.roleId == 'EM' ? 'Employees' : 'Leaders'}" readonly="true">
                                                                </div> <!-- /controls -->
                                                            </div> <!-- /control-group -->
                                                            <div class="control-group">
                                                                <label class="control-label">Request Date:</label>
                                                                <div class="controls">
                                                                    <input type="date" class="form-control" name="txtDateNow" value="${requestScope.txtRequestDate}">
                                                                </div> <!-- /controls -->
                                                            </div> <!-- /control-group -->
                                                            <div class="control-group">
                                                                <label class="control-label">Pay Date:</label>
                                                                <div class="controls">
                                                                    <input type="date" class="form-control" name="txtPayDate" value="${requestScope.txtPayDate}">
                                                                </div> <!-- /controls -->
                                                            </div> <!-- /control-group -->
                                                            <label style="margin-left: 160px; font-size: 14px; color: red;">${requestScope.errorDate}</label>
                                                        </div> <!-- /control-group --></div>
                                                    <br>
                                                    <ul class="nav nav-tabs">
                                                        <li>
                                                            <h3><i class="icon-user"></i>&ensp;List of Booking Device</h3>
                                                            </div> <!-- /widget-header -->
                                                        </li>
                                                    </ul>

                                                    <div class="table">

                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr >
                                                                    <th>STT</th>	
                                                                    <th>Device Name</th>
                                                                    <th>Color</th>
                                                                    <th>Category</th>
                                                                    <th style="width: 20%" >Quantity  |  Remain</th>


                                                                </tr>
                                                            </thead> 
                                                            <tbody>

                                                                <c:set var = "count" scope="page" value = "0"/>
                                                                <c:forEach items="${requestScope.listDetail}" var="i">
                                                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                                                    <tr class="clsRow">
                                                                        <td>${count}</td>
                                                                        <td>${i.deviceName}</td>
                                                                        <td>${i.deviceColor}</td>
                                                                        <td>${i.categoryName}</td>
                                                                        <td><input type="text" class="form-control ${!i.error ? 'error' : ''}" name="txtQuantity" style="width: 35%; text-align: center; border-radius: 5px" value="1">
                                                                            <input type="text" disabled="" class="form-control" name="txtQuantity" style="width: 35%; text-align: center; border-radius: 5px" value="< ${i.deviceQuantity}">
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <c:if test="${not empty requestScope.errorQuantity}">
                                                            <span style="color: red;
                                                                  margin-left: 810px;
                                                                  font-size: 15px;">${requestScope.errorQuantity}</span>
                                                        </c:if>
                                                        <br>
                                                        <br>
                                                        <div class="controls" style="text-align: right; margin-right: 50px;">

                                                            <input type="submit" name="action" value="Book" class="btn btn-info" style=" width: 90px;" >
                                                            <input type="submit"  name="action" value="Cancel"class="btn btn-danger" style=" width: 90px" >
                                                        </div>
                                                    </div>


                                            </div>
                                            </form>

                                        </div>

                                    </div>
                            </div> <!-- /widget-content -->

                        </div> <!-- /widget -->

                    </div> <!-- /span8 -->
                </div> <!-- /row -->

            </div> <!-- /container -->

        </div> <!-- /main-inner -->

    </div> <!-- /main -->




    <div class="extra">

        <div class="extra-inner">

            <div class="container">

                <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div> <!-- /row -->

            </div> <!-- /container -->

        </div> <!-- /extra-inner -->

    </div> <!-- /extra -->

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="js/jquery-1.7.2.min.js"></script>

    <script src="js/bootstrap.js"></script>
    <script src="js/base.js"></script>


</body>

</html>


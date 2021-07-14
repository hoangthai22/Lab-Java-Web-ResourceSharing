<%-- 
    Document   : request
    Created on : May 12, 2021, 3:22:02 PM
    Author     : ASUS
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        .form-actions{
            background-color: linen;
            border-radius: 20px;
        }
        .table-bordered thead:first-child tr:first-child th {
            text-align: center

        }
        .table td{
            text-align: center
        }
        .label {
            padding: 3px 11px 3px;
            font-size: 12.998px;
        }
        .pagination {
            margin-left: 920px;
        }
        .pagination .active{
            color: white;
            background-color: #00ba8b !important
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
                                        <i class="icon-list-ol"></i>
                                        <h3>Manager Request</h3>
                                    </div> <!-- /widget-header -->
                                    <div class="widget-content">
                                        <div class="tabbable">

                                            <br>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="formcontrols">
                                                    <form id="edit-profile" class="form-horizontal" action="MainController" method="post">
                                                        <fieldset>
                                                            <div class="control-group">
                                                                <div class="table">
                                                                    <input type="text" name="txtSearchByKey" id="input" class="form-control" value="${requestScope.txtSearchByKey}" >
                                                                <input type="submit" class="btn btn-info"  name="action" value="Search By Key">
                                                                <select style="width: 125px;" name="txtSearchByStatus" class="btn btn-linkedin-alt" >
                                                                    <option value="All">All</option>
                                                                    <option value="New">New</option>
                                                                    <option value="Delete">Delete</option>
                                                                    <option value="Accept">Accept</option>

                                                                </select>
                                                                &ensp;&ensp;&ensp;&ensp;
                                                                <br>
                                                                <label style="margin-left: 828px; color: red">${error}</label>
                                                                <div style=" margin-left: 588px;">
                                                                    <input type="submit" class="btn btn-info" name="action" value="Search By">
                                                                    <select style="width: 142px;" name="txtSearchByDate" class="btn btn-linkedin-alt">

                                                                        <option value="requestDate"><a>Request Date</a></option>
                                                                        <option value="payDate">Pay Date</option>
                                                                    </select>
                                                                    <input style="width: 140px" type="date" name="txtRequestDate" value="${requestScope.requestDate}">
                                                                    <input style="width: 140px" type="date" name="txtPayDate" value="${requestScope.payDate}" >
                                                                </div>
                                                                <input type="submit" name="action" class="btn btn-info" value="Get  All">
                                                                <br>
                                                                <br>
                                                                <table class="table table-bordered">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>STT</th>	
                                                                            <th>User ID</th>
                                                                            <th>list of devices</th>
                                                                            <th style="width: 80px">Request Date</th>
                                                                            <th style="width: 80px">Pay Date</th>
                                                                            <th>Status</th>
                                                                            <th style="width: 143px">Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:if test="${not empty requestScope.listBooking}">
                                                                            <c:set var = "count" scope="page" value = "${not empty requestScope.index ? ((requestScope.index - 1)* 20) : 0}"/>

                                                                            <c:forEach items="${requestScope.listBooking}" var="i">

                                                                                <c:set var="count" value="${count + 1}" scope="page"/>
                                                                                <tr>

                                                                                    <td>${count}</td>
                                                                                    <td>${i.userId}</td>
                                                                                    <td>
                                                                                        ${i.description}
                                                                                    </td>   


                                                                                    <td>${i.requestDate}</td>
                                                                                    <td>${i.payDate}</td>
                                                                                    <c:set var = "status" scope="page" value = "${i.bookingStatus}"/>
                                                                                    <td>

                                                                                        <c:if test="${status == 'Delete    '}">
                                                                                            <span class="label label-important">${i.bookingStatus}</span>
                                                                                        </c:if>
                                                                                        <c:if test="${status == 'New       '}">
                                                                                            <span class="label label-warning">${i.bookingStatus}</span>
                                                                                        </c:if>
                                                                                        <c:if test="${status == 'Accept    '}">
                                                                                            <span class="label label-success">${i.bookingStatus}</span>
                                                                                        </c:if>
                                                                                        <c:if test="${status == 'Done      '}">
                                                                                            <span class="label label-inverse">${i.bookingStatus}</span>
                                                                                        </c:if>

                                                                                    </td>

                                                                                    <td>

                                                                                        <c:if test="${status == 'New       '}">
                                                                                            <a class="btn btn-danger" href="MainController?action=Delete&txtBookingID=${i.bookingId}">Cancel</a>
                                                                                            <a class="btn btn-success" href="MainController?action=Accept&txtBookingID=${i.bookingId}">Accept</a>
                                                                                        </c:if>
                                                                                        <c:if test="${status == 'Accept    '}">
                                                                                            <a class="btn btn-inverse" href="MainController?action=Done&txtBookingID=${i.bookingId}">Done</a>

                                                                                        </c:if>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:if>

                                                                    </tbody>
                                                                </table>
                                                                <c:if test="${empty requestScope.listBooking}">
                                                                    <span style="color: red;
                                                                          margin-left: 518px;
                                                                          font-size: 17px;">No devices found</span>
                                                                </c:if>
                                                            </div>
                                                        </div> <!-- /control-group -->
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <ul class="pagination controls">
                                                <c:if test="${requestScope.index > 1}">
                                                    <li class="page-item"><a href="MainController?action=pagingBooking&index=${index-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${requestScope.indexCount}" var="i">

                                                    <li class="page-item ${index == i ? "active" : ""}"><a href="MainController?action=pagingBooking&index=${i}">${i}</a></li>

                                                </c:forEach>
                                                <c:if test="${requestScope.index < requestScope.indexCount}">
                                                    <li class="page-item"><a href="MainController?action=pagingBooking&index=${index+1}">Next</a></li>
                                                    </c:if>
                                            </ul>

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

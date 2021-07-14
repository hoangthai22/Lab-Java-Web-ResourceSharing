<%-- 
    Document   : index.jsp
    Created on : May 12, 2021, 3:08:22 PM
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="thai.dtos.DeviceObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Resource Sharing</title>
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
        <link href="css/pages/dashboard.css" rel="stylesheet">
    </head>
    <style>
        .table {
            width: 150%
        }
        .pagination {
            margin-left: 920px;
        }
        .pagination .active input[type="submit"] {
            color: white;
            background-color: #00ba8b !important
        }
        input[type="submit"] {
            height: 32px;
            margin-left: -7px;
        }

    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="main">
                <div class="main-inner"></div>
                <div class="container">
                    <div class="row">
                        <form action="MainController" method="post">
                            <div class="span12">
                                <div class="widget">
                                    <div class="widget-header">
                                        <i class="icon-list"></i>
                                        <h3>List of devices</h3>
                                    </div> <!-- /widget-header -->
                                    <div class="widget-content">
                                        <div class="tabbable">
                                            <div class="controls" style="text-align: right">
                                                <input type="submit" name="action" value="Get All" class="btn-inverse" style="width: 80px; margin-right: 550px">
                                                <input type="submit" name="action" value="Search" class="btn-inverse" style="width: 80px">
                                                <input type="text" name="txtSearchByName" id="input" class="form-control" value="${not empty requestScope.searchByName ? searchByName : ''}">
                                            &ensp;&ensp;
                                            <select class="span2" name="txtSearchByCategory" >
                                                <option value="0">All</option>
                                                <c:forEach items="${requestScope.listC}" var="i">
                                                    <option value="${i.categoryName}" ${requestScope.searchByCategory == i.categoryName ? 'selected' : ''}><a href="GerDeviceController">${i.categoryName}</a></option>
                                                </c:forEach>
                                            </select> 
                                            &ensp;&ensp;&ensp;&ensp;

                                        </div>

                                        <div>
                                            <label style="color: red;
                                                   font-size: 14px;">${requestScope.error}</label>
                                            <input style="width: 140px" type="date" name="txtDateStart" value="${requestScope.txtDateStart}">
                                            <input style="width: 140px" type="date" name="txtDateEnd" value="${requestScope.txtDateEnd}" >
                                            <input type="submit" name="action" value="Search By Date" class="btn-inverse" style="width: 106px; margin-left:  8px">

                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="jscontrols">
                                                <form id="edit-profile2" class="form-vertical">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>STT</th>	
                                                                            <th>Name</th>
                                                                            <th>Quantity</th>
                                                                            <th>Color</th>
                                                                            <th>Category</th>

                                                                            <th>Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:set var = "count" scope="page" value = "${not empty requestScope.index ? ((requestScope.index - 1)* 20) : 0}"/>
                                                                        <c:forEach items="${requestScope.listD}" var="i">

                                                                            <c:set var="count" value="${count + 1}" scope="page"/>
                                                                            <tr>
                                                                                <td>${count}</td>
                                                                                <td>${i.deviceName}</td>
                                                                                <td>${i.deviceQuantity}</td>
                                                                                <td>${i.deviceColor}</td>
                                                                                <td>${i.categoryName}</td>

                                                                                <td><input type="checkbox" id="Cbox" onclick="Check()" style="width: 20px;
                                                                                           height: 20px" ${i.checked ? 'checked' : ''} name="txtCheck" value="${i.deviceId}"></td>

                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>

                                                                <ul class="pagination controls">
                                                                    <c:if test="${requestScope.index > 1}">

                                                                        <li class="page-item "><input type="hidden" name="indexPagePrevious" value="${requestScope.index-1}"</li>
                                                                        <li class="page-item "><input style="width: 80px;" type="submit" name="action" value="Previous"</li>
                                                                        </li>
                                                                    </c:if>
                                                                    <c:forEach begin="1" end="${requestScope.indexCount}" var="i">
                                                                        <li class="page-item ${index == i ? "active" : ""}"><input style="width: 38px;" type="submit"  name="action" value="${i}"></li>
                                                                        <li><input style="width: 38px;" type="hidden"  name="indexClear" value="${requestScope.index}"></li>

                                                                    </c:forEach>

                                                                    <c:if test="${requestScope.index < requestScope.indexCount}">
                                                                        <li class="page-item "><input type="hidden" name="indexPageNext" value="${requestScope.index+1}"</li>
                                                                        <li class="page-item "><input style="width: 45px;"type="submit" name="action" value="Next"</li>
                                                                        </c:if>
                                                                </ul>

                                                                <br>
                                                                <div class="controls" style="text-align: right; margin-right: 50px;">

                                                                    <input id="next" type="submit" ${sessionScope.Cart.cart.size() > 0 ? '' : 'disabled'} name="action" value="Next Step" class="btn btn-info" style=" width: 90px;" >
                                                                    <input type="submit" name="action" value="Clear"class="btn btn-warning" style=" width: 90px; margin-left: 10px" >
                                                                </div>

                                                            </div>
                                                        </div> <!-- /control-group -->
                                                    </fieldset>


                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- /widget-content -->
                        </div> <!-- /widget -->
                </div> <!-- /span8 -->
                </form>
            </div> <!-- /row -->
        </div> <!-- /container -->
    </div> <!-- /main-inner -->
</div> <!-- /main -->

<!-- /main -->
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
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /extra-inner -->
</div>
<!-- /extra -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/excanvas.min.js"></script>
<script src="js/chart.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script language="javascript" type="text/javascript"
src="js/full-calendar/fullcalendar.min.js"></script>

<script src="js/base.js"></script>
<script>
                                                                                    Check = () => {
                                                                                        var checkBox = document.querySelectorAll("#Cbox");
                                                                                        var next = document.getElementById("next");
                                                                                        next.setAttribute("disabled", "true");
                                                                                        for (let i = 0; i < checkBox.length; i++) {
                                                                                            if (checkBox[i].checked) {
                                                                                                console.log(checkBox[i]);
                                                                                                next.removeAttribute("disabled");
                                                                                            }
                                                                                        }

                                                                                    }

</script>

</body>
</html>


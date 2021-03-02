<%-- 
    Document   : login
    Created on : 03 5, 20, 11:55:48 AM
    Author     : Jinno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.myChecker"%>
<%@ page import="java.util.*" %>
<%@ page import=" javax.servlet.jsp.JspWriter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SITE Finance System</title>
        <!-- Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Bootstrap --> 

    </head>
    <style>
        .SITENavbar{
            background-color: #057D2D;

        }
        .SITEJumbotron{
            background-color: white;
            padding-bottom: 0px
        }
        body{
            padding-top: 50px;
            padding-bottom: 60px;
        }
        a:link {
  text-decoration: none;
  color:black;
}

a:visited {
  text-decoration: none;
  color:black;
}

a:hover {
  text-decoration: none;
  color:black;
}

a:active {
  text-decoration: none;
  color:black;
  .list-group-hover .list-group-item:hover {
    background-color: #f5f5f5;
}
}

    </style>
    <body>
        <script>
function myFunction() {
  var x = document.getElementsByClassName("mySPAN");
  for (var i = 0; i < x.length; i++){
  if (x[i].style.display === "none") {
    x[i].style.display = "block";
  } else {
    x[i].style.display = "none";
  }
  }
}
</script>
        <!--TOP NAVBAR-->

        <div>
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
                <!--LEFT MENU-->

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#CollapsedLeft" aria-controls="CollapsedLeft" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon" ></span>
                </button>
                <!--TITLE-->
                <a class="navbar-brand text-left text-white" href="showYearSelect">Back</a>
                <a class="navbar-brand mx-auto text-center" href="#">SITE</a>
                <!--RIGHT SEARCH-->

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#CollapsedRight" aria-controls="CollapsedRight" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="text-white" id="basic-addon1">Q</span>
                </button>
            </nav>
            <!--SEARCH FUNCTION-->
            <div class="collapse SITENavbar" id="CollapsedRight">
                <div class=" p-4">
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search Event" aria-label="Search">
                    </form>
                </div>
            </div>

            <!--MENU FUNCTION-->
            <div class="collapse SITENavbar" id="CollapsedLeft">
                <div class=" p-4">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Menu Item 1</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Menu Item 2</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Menu Item 3</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <%
            ResultSet results1 = (ResultSet) request.getAttribute("results1");
            results1.next();
        %>
        <!--RUNNING BALANCE-->
        <div class="jumbotron jumbotron-fluid SITEJumbotron text-center">
            <div class="container">
                <p class="lead">Running Balance</p>
                <div>
                    <h1 class="display-4 DisplayedMoney"><u>Php <%=results1.getString("AMOUNT")%></u></h1>
                </div>
                <p class="">This is the current amount of money that the organization is capable of spending!</p>
            </div>
        </div>


        <!--EVENTS SIDENOTE: CAN DISABLE SOME BUTTONS DEPENDING ON EVENT-->
        <div>
            <h3 class="eventsTitle pl-3">Events</h3>
        </div>
        <%
            ResultSet results = (ResultSet) request.getAttribute("results");
            String role = (String) session.getAttribute("role");
        %>
        <ul class="list-group">
            <% while (results.next()) {
            %>
            <div>
                <li class="list-group-item list-group-item-action list-group-hover">  
                    <a href="ViewEvent?eventname=<%=results.getString("EVENT_NAME")%>" class="text-left ">
                        <%=results.getString("EVENT_NAME")%>
                    </a>
                    <span class ="mySPAN float-right py-auto my-auto" style="display:none">
                        <a class="btn btn-primary" href="deleteEvent?eventname=<%=results.getString("EVENT_NAME")%>" role="button">DELETE</a>
                        <a class="btn btn-primary"  role="button">EDIT</a>
                    </span>
             </li>
             </div>
                        <%}%>
    </ul>





    <!--BOTTOM NAVBAR-->
    <nav class="navbar fixed-bottom SITENavbar">
        <%if (role.contentEquals("financeadmin")) {
        %>
        <a class="navbar-brand text-left text-white" href="addevent.jsp">ADD</a>
        <a class="navbar-brand text-right text-white" href="editevent">EDIT</a>
        <%}else if(role.contentEquals("superadmin")){%>
            <a class="navbar-brand float-center text-white" href="viewAccounts">accounts</a>
        <%}%>
    </nav>


</body>

</html>

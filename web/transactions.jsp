<%-- 
    Document   : eventPage
    Created on : 04 21, 20, 5:39:31 PM
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
        .SITENavbarBottom{
             background-color: #FFFFFF;
             border-top: 2px solid lightgray;
        }
        .EventJumbotron{
            background-color: lightgray;
            padding-top: 2%;
            padding-bottom: 1%;
            margin-bottom: 0;
        }
        body{
            padding-top: 50px;
            padding-bottom: 60px;
        }
        .myBotText{
             color: #057D2D;
        }
        .myBorder{
            border: 2px solid red;
            margin-right: 0;
        }
        .myList{
            margin-bottom: 125px;
        }
        .myCardmargin{
            margin-bottom: 50px;
        }
       
    </style>
    <body>
               <!--TOP NAVBAR-->
               
    <div>
       <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
           <a class="navbar-brand text-left text-white" href="backevent">BACK</a>
               <!--LEFT MENU-->

               <!--TITLE-->
               
       <a class="navbar-brand mx-auto text-center " href="#">SITE</a>
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
        
               
    </div>
            
               
    <div class="jumbotron jumbotron-fluid EventJumbotron text-center">
        <div class="container">
            <%
            ResultSet results = (ResultSet) request.getAttribute("results");
            ResultSet results1 = (ResultSet) request.getAttribute("results1");
            results1.next();
            ResultSet results2 = (ResultSet) request.getAttribute("results2");
            results2.next();
             %>
            <p class="lead"><%=results1.getString("CREATED_BY")%></p>
            <div>
                <h1 class="display-4"><%=results1.getString("EVENT_NAME")%></h1>
            </div>
            <p class="">Budget Breakdown</p>
        </div>
    </div>

<div class="list-group myList">
    <%while(results.next()){%>
    <a href="viewtransaction?transactiontitle=<%=results.getString("Title")%>&eventname=<%=results1.getString("EVENT_NAME")%>" class="list-group-item list-group-item-action"><%=results.getString("Title")%> <h4 class="text-right">P<%=results.getString("AMOUNT")%></h4></a>
      <%}%>
                </div>
               
               
               <div class="card fixed-bottom myCardmargin">
  <div class="card-header">
    Sum of all expenses listed above.
  </div>
  <div class="card-body">
  <div class="row">
    <div class="col">
        <h4 class="text-left">Total</h4>
    </div>
    <div class="col">
        <%String total = results2.getString(1);
        if(results2.wasNull()){
            total = "0";
        }
        %>
        <h3 class="text-right">P<%=total%></h3>
    </div>
  </div>
  </div>
</div>
        
        <!--BOTTOM NAVBAR-->
     <nav class="navbar fixed-bottom SITENavbarBottom">
      <a class="navbar-brand text-left myBotText" href="addtransactions.jsp?eventname=<%=results1.getString("EVENT_NAME")%>">ADD</a>
      <a class="navbar-brand text-right myBotText" href="#">EDIT</a>

    </nav>
       
        
    </body>

</html>

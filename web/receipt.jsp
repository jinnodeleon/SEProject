<%-- 
    Document   : receipt
    Created on : 04 23, 20, 12:31:28 PM
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
             background-color: red;
        }
        .EventJumbotron{
            background-color: #057D2D;
            margin-bottom: 0;
            padding-top: 0px;
            margin-top: 56px;
            height: 100px;
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
            margin-top: 140px;
            padding-left: 60px;
            padding-right: 60px;
            color: #057D2D;
        }
        .myCardmargin{
            margin-bottom: 50px;
        }
        .blankNavbar{
            height: 50px;
        }
        .jumbotronTextMargins{
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .myBorderlessList{
            border-top: none;
            border-left: none;
            border-right: none;
        }
        .receiptHeader{
            background-color: #057D2D;
            margin-bottom: 0;
            padding-top: 0px;
            margin-top: 55px;
            height: 105px;
            text-align: center;
        }
        .myRow{
           padding-left: 30px;
           padding-top: 30px;
        }
        /* If the screen size is 601px wide or more, set the font-size of <div> to 80px */
@media screen and (min-width: 601px) {
  .textHeader {
    font-size: 30px;
  }
  .label{
     font-size: 5px; 
  }
    .myBorderlessList{
      font-size: 35px;
  }
}

/* If the screen size is 600px wide or less, set the font-size of <div> to 30px */
@media screen and (max-width: 600px) {
  .textHeader {
    font-size: 20px;
  }
    .label{
      font-size: 15px;
  }
  .myBorderlessList{
      font-size: 20px;
  }
}
.confButton{
    height:55px;
}
    </style>
    <body>
               <!--TOP NAVBAR-->
     <%
            ResultSet results = (ResultSet) request.getAttribute("results");
            String eventname = request.getParameter("eventname");
            results.next();
             %>           
    <div>
       <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
           <a class="navbar-brand text-left text-white" href="ViewEvent?eventname=<%=eventname%>">BACK</a>
               

               <!--LEFT MENU-->

               <!--TITLE-->
               
       <a class="navbar-brand mx-auto text-center " href="#">TRANSACTION</a>
               <div style="float: right; width: 60px;"></div>
        
               
    </div>
            
               
               <div class="receiptHeader fixed-top">
                     <div class="row myRow">
    <div class="col">
        <h4 class="text-left text-white textHeader">Receipt for</h4>


        <h3 class="text-left text-white textHeader"><%=eventname%></h3>
    </div>
  </div>

               </div>       

<div class="list-group myList">
    <ul class="list-group ">
   <label for="title">Title</label>
  <li class="list-group-item myBorderlessList" id="title"> <%=results.getString("TITLE")%></li>
     <label for="description">Description</label>
  <li class="list-group-item myBorderlessList" id="description"><%=results.getString("DESCRIPTION")%></li>
     <label for="date">Date of Purchase</label>
  <li class="list-group-item myBorderlessList" id="date"><%=results.getString("DATE_TIME")%></li>
     <label for="issuer">Issuer</label>
  <li class="list-group-item myBorderlessList" id="issuer"><%=results.getString("ISSUER")%></li>
     <label for="amount">Amount in Php</label>
  <li class="list-group-item myBorderlessList" id="amount"><%=results.getString("AMOUNT")%></li>
       <label for="orderNo">Order Number</label>
  <li class="list-group-item myBorderlessList" id="orderNo"></li>
  
</ul>
                </div>
               
        <!--BOTTOM NAVBAR-->
     <a class="navbar fixed-bottom SITENavbarBottom confButton">
      <p class="navbar-brand text-white myBotText mx-auto" href="#">Confirm</p>

    </a>
       
        
    </body>

</html>

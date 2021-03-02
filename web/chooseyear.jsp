<%-- 
    Document   : addBudget
    Created on : 04 23, 20, 4:01:57 PM
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
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
        .myForm{

            margin: 30px 5% auto 5%;
        }
        .myFormMargins{
            margin-bottom: 10px;
        }
        .myButton
        {
            background-color: #057D2D;
            color: white;
        }
        .dropdown-menu-center{
            left: 50% !important;
            transform: translateX(-50%) !important;
            top: 100% !important;
        }
        .myDropdownText{
            color: #057D2D;
        }
        .dropdownBorder{
            border: 2px solid #057D2D;
        }
        .dropdownMenuBG{
            background-color: #F3F1F1;
        }
    </style>
    <body>
        <!--TOP NAVBAR-->
<%
            ResultSet results = (ResultSet) request.getAttribute("results");
             String role=(String)session.getAttribute("role");  
             %>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
                <!--LEFT MENU-->

                <!--TITLE-->

                <a class="navbar-brand mx-auto text-center " href="#">SITE</a>

            </nav>

            <div class="dropdown text-center" style="margin-top: 150px; margin-left: 15%; margin-right: 15%;">
                <button class="btn btn-block btn-lg dropdown-toggle myDropdownText dropdownBorder" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select School Year
                </button>
                <div class="dropdown-menu dropdown-menu-center myDropdownText dropdownMenuBG" style="width: 95%;" aria-labelledby="dropdownMenuButton">   
                    <% while(results.next()){
                    %>
                    <div class="container dropdown-item  myDropdownText " >
                        <div class="row  justify-content-between" style="padding-right: 15px;">
                            <div class="col-2  text-left"><a href="showEventPage"><%=results.getString("YEAR1")%></a></div>

                        </div>
                    </div>
                    <%}%>
                </div>
            </div>

            <!--BOTTOM NAVBAR-->
            <nav class="navbar fixed-bottom SITENavbar">
                <a class="navbar-brand mx-auto text-white" href="#">ADD</a>

            </nav>


    </body>

</html>

<%-- 
    Document   : searchAccount
    Created on : 04 24, 20, 2:21:35 PM
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
        .myBorder{
            border: 2px solid red;
            margin-right: 0;
        }
        .blankNavbar{
            height: 50px;
        }
        .myRow{
            padding-left: 30px;
            padding-top: 30px;
        }
        .searchHeader{
            height: 80px; 
            margin-top: 56px;
            background-color: #057D2D;
        }
        .contactsList{
            margin-top: 56px;

        }
        .myContact{
            border-bottom: 1px solid lightgray;
        }
        .bottomBuffer{
            margin-bottom: 60px;
        }
        .contactHeader{
            background-color: #EAEAEA;
        }
        /* If the screen size is 601px wide or more, set the font-size of <div> to 80px */
        @media screen and (min-width: 601px) {
            .searchText {
                font-size: 25px;
            }
            .contactsText{
                font-size: 35px;
            }
        }
        @media screen and (max-width: 600px) {
            .contactsText{
                font-size: 20px;
            }
        }
    </style>
    <body>
        <!--TOP NAVBAR-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
            <a class="navbar-brand text-left text-white" href="showEventPage">Back</a>
            <!--LEFT MENU-->

            <!--TITLE-->

            <a class="navbar-brand mx-auto text-center " href="#">SITE</a>
            <div style="float: right; width: 60px;"></div>
        </nav>

        <!--
        <div class="container-fluid searchHeader fixed-top px-0">
            <div class="row mx-auto align-items-center w-100 h-100">
                <div class="col-sm-12 col-md-8 col-lg-6 mx-auto">
                    <form class="form-inline justify-content-center w-100">
                        <input class="form-control w-100 searchText" type="search" placeholder="Q      Search" aria-label="Search">
                    </form>
                </div>
            </div>
        </div> 
        -->
        <%
            ResultSet results = (ResultSet) request.getAttribute("results");
            String role = (String) session.getAttribute("role");
            ResultSet results1 = (ResultSet) request.getAttribute("results1");
        %>

        <div class="container-fluid contactsList px-0 ">
            <div class="row mx-auto bottomBuffer" >
                <div class="col contactHeader ">
                    <h3 class="contactsText mt-2 mb-2">Finance</h3>
                </div>
                <div class="w-100"></div>
                <%while (results.next()) {%>
                <div class="col myContact">
                    <a class="contactsText text-dark" href="#"><%=results.getString("NAME")%> <i class="text-muted contactsText">(<%=results.getString("POSITION")%>)</i></a>
                </div>
                <div class="w-100"></div>
                    <%}%>
                
            </div>
            <div class="row mx-auto bottomBuffer">
                <div class="col contactHeader ">
                    <h3 class="contactsText mt-2 mb-2">Audit & Logistics</h3>
                </div>
                <div class="w-100"></div>
                <%while (results1.next()) {%>
                <div class="col myContact ">
                    <a class="contactsText text-dark" href="#"><%=results1.getString("NAME")%> <i class="text-muted contactsText">(<%=results1.getString("POSITION")%>)</i></a>
                </div>
                <div class="w-100"></div>
                <%}%>
                
            </div>
        </div>

        <!--BOTTOM NAVBAR-->
        <nav class="navbar fixed-bottom SITENavbar">
            <a class="navbar-brand text-left text-white" href="addAccount.jsp">ADD</a>
            <a class="navbar-brand text-right text-white" href="#">EDIT</a>
        </nav>

    </body>




</html>


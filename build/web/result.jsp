<%-- 
    Document   : result
    Created on : Nov 18, 2010, 4:41:02 PM
    Author     : lawrence
--%>

<%@page import="com.example.model.Champion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Champ Tier List</title>
         <link href="design/bootstrap.min.css" type="text/css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            img {
                max-width: 50%;
                height: auto;
                
            }
            hr {
                border-top: 2px solid #122B49;
            }
            .mycard {
                margin-bottom: 10px;
               
                max-width: 280px;
                min-width: 200px;
                max-height: 200px;
                min-height: 200px;
                border: 2px solid #B48944;
            }
            .mywinrate {
                color: green;
            }
            .mypickrate {
                color: blue;
            }
            .myheader{
                padding: 20px;
            }
            .mycardheader{
                color: white;
                background-color: #122B49;
                border-bottom: 2px solid #B48944;
            }
            .myFooter{
                padding: 5px;
                background-color: #f5f5f5;
                
            }
            .myrow1 {
                padding-bottom: 50px;
            }
            .mytitle {
                color: #122B49;
            }
           
        </style>
    </head>
    <body>
        <%
          List styles = (List)request.getAttribute("styles");
          Iterator it = styles.iterator(); 
          Champion p = (Champion)it.next();
        %>
        <div class="container-xl">
            <div class="row justify-content-center myheader">
                <center><a href="index.jsp"> <img src="design/logo.jfif"></a>
        <hr>
            </div>       
            <div class="row justify-content-center">
                <center><div class="text-responsive mytitle"><h1>LoL Champion Tier List </h1></div>
            <br>
            </div>
            <div class="row justify-content-lg-between myrow1">
                <div class="col-xl-2 col-sm-12">
            <center><div class="card w-50 mycard ">
                    <div class="card-header mycardheader"><h3 class="card-title"><%out.print(p.getChampname());%></h3></div>    
                    <div class="card-body bg-light">
                            
                            <h4 class="card-text mywinrate"> <%out.print(p.getWinrate());%></h4>
                            <h4 class="card-text mypickrate"> <%out.print(p.getPickrate());%></h4>
                         </div>
                    </div></center>
                </div>    
                <%p = (Champion)it.next();%>
                <div class="col-xl-2 col-sm-12">
            <center><div class="card w-50 mycard bg-secondary">
                    <div class="card-header mycardheader"><h3 class="card-title"><%out.print(p.getChampname());%></h3></div>    
                    <div class="card-body bg-light">
                            
                            <h4 class="card-text mywinrate"> <%out.print(p.getWinrate());%></h4>
                            <h4 class="card-text mypickrate"> <%out.print(p.getPickrate());%></h4>
                         </div>
                    </div></center>
                </div>    
                <%p = (Champion)it.next();%>
                <div class="col-xl-2 col-sm-12">
            <center><div class="card w-50 mycard bg-secondary">
                    <div class="card-header mycardheader"><h3 class="card-title"><%out.print(p.getChampname());%></h3></div>    
                    <div class="card-body bg-light">
                            
                            <h4 class="card-text mywinrate"> <%out.print(p.getWinrate());%></h4>
                            <h4 class="card-text mypickrate"> <%out.print(p.getPickrate());%></h4>
                         </div>
                    </div></center>
                </div>   
                <%p = (Champion)it.next();%>
                <div class="col-xl-2 col-sm-12">
            <center><div class="card w-50 mycard bg-secondary">
                    <div class="card-header mycardheader"><h3 class="card-title"><%out.print(p.getChampname());%></h3></div>    
                    <div class="card-body bg-light">
                            
                            <h4 class="card-text mywinrate"> <%out.print(p.getWinrate());%></h4>
                            <h4 class="card-text mypickrate"> <%out.print(p.getPickrate());%></h4>
                         </div>
                    </div></center>
                </div>   
                <%p = (Champion)it.next();%>
                <div class="col-xl-2 col-sm-12">
            <center><div class="card w-50 mycard bg-secondary">
                    <div class="card-header mycardheader"><h3 class="card-title"><%out.print(p.getChampname());%></h3></div>    
                    <div class="card-body bg-light">
                            
                            <h4 class="card-text mywinrate"> <%out.print(p.getWinrate());%></h4>
                            <h4 class="card-text mypickrate"> <%out.print(p.getPickrate());%></h4>
                         </div>
                    </div></center>
                </div>
                <div class="row justify-content-center">
                    <footer class="footer fixed-bottom myFooter">
                        <center>2020 Copyright: Charles</div>
                    </footer>
                </div>
            </div>
        </div>    
        
           <%//
             //   List styles = (List)request.getAttribute("styles");
             //   Iterator it = styles.iterator();
             //   while (it.hasNext())
             //   {
             //       out.print("<br>try: " + it.next());
             //   }
            %>
    </body>
</html>

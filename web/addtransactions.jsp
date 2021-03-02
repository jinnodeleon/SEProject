<%-- 
    Document   : addTrans
    Created on : 04 23, 20, 12:04:51 PM
    Author     : Jinno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    </style>
    <body>
               <!--TOP NAVBAR-->
             <% String eventname = request.getParameter("eventname"); %>  
    <div>
       <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
           <a class="navbar-brand text-left text-white" href="ViewEvent?eventname=<%=eventname%>">Cancel</a>
               <!--LEFT MENU-->

               <!--TITLE-->
               
       <a class="navbar-brand mx-auto text-center " href="#">ADD TRANSACTION</a>
       
<!-- Button trigger modal -->

<button type="button" class="btn btn-primary btn-light" data-toggle="modal" data-target="#staticBackdrop">
<span class="myBotText" id="basic-addon1">Done</span>
</button>
       </nav>
        
        <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Are you sure you want to add this Transaction?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        You cannot make any changes once you have confirmed.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
        <button type="submit" form="form1" class="btn myButton">Confirm</button>
      </div>
    </div>
  </div>
</div>      
        
    </div>
               
               <form action="addtransaction" id="form1" class="myForm">    
                   
                <!-- TITLE START -->
                <div class="form-group myFormMargins">
                    <input class="form-control form-control-lg" type="text" id="title" name="transactiontitle" placeholder="Title" required>
                </div>
                <!-- TITLE END -->
                
                <!-- FORM START -->
                <input type="hidden" id="eventname" name="eventname" value="<%=eventname%>">
                <div class="form-group myFormMargins">
                    <input class="form-control form-control-lg" type="text" id="description" name="description" placeholder="Description" required>
                </div>
                
                <div class="form-group myFormMargins">
                    <input class="form-control form-control-lg textbox-n" type="text" id="date" name="date" placeholder="Date of Purchase" onfocus="(this.type='date')" onblur="(this.type='text')" required>
                </div>
                
                <div class="form-group myFormMargins">
                    <input class="form-control form-control-lg" type="text" id="issuer" name="issuer" placeholder="Issuer" required>
                </div>
                
                <div class="form-group myFormMargins">
                    <input class="form-control form-control-lg" type="text" id="amount" name="amount" placeholder="Amount in Php" required>
                </div>
                
                <%//<div class="form-group myFormMargins">
                   // <input class="form-control form-control-lg" type="text" id="orderNo" name="orderNo" placeholder="Order Number" required>
                //</div>%>
                <!-- FORM END-->
            </form>
               
<!--BOTTOM NAVBAR-->
     <nav class="navbar fixed-bottom SITENavbarBottom">

    </nav>
       
        
    </body>

</html>

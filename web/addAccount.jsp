<%-- 
    Document   : addAccount
    Created on : 04 25, 20, 7:58:41 AM
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
        .myFormMargins{
            margin-bottom: 0px;
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
        .contactHeader{
            background-color: #EAEAEA;
        }
                .blankNavbar{
            height: 50px;
        }
        @media screen and (min-width: 601px) {
            .myAccountHeader {
                font-size: 25px;
            }
            .myAccount{
                font-size: 35px;
            }
        }
        @media screen and (max-width: 600px) {
            .myAccount{
                font-size: 20px;
            }
        }
    </style>
    <body>
        <!--TOP NAVBAR-->

        <div>
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top SITENavbar">
                <a class="navbar-brand text-left text-white" href="viewAccounts">Cancel</a>
                <!--LEFT MENU-->

                <!--TITLE-->

                <a class="navbar-brand mx-auto text-center " href="#">ADD ACCOUNT</a>

                <!-- Button trigger modal -->

                <a class="text-white text-right navbar-brand ml-3 mr-0"  data-toggle="modal" data-target="#staticBackdrop">
                    Done
                </a>
            </nav>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Are you sure you want to add this Account?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            You can make changes again later.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                            <button type="submit" form="form1" class="btn myButton">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>      

        </div>


        <div class="container-fluid px-0" style="margin-top: 6px;">
            <form action="addAccount" id="form1"  class="row mx-auto">
                <div class="col contactHeader ">
                    <p class="contactsText mt-1 mb-1 text-muted myAccountHeader">Account details will be set here</p>
                </div>
                <div class="w-100"></div>

                <div class="col px-0">
                    <input class="form-control form-control-lg myAccount" type="text" id="name" name="name" placeholder="Name" required>
                </div>
                <div class="w-100"></div>

                <div class="col px-0">
                    <input class="form-control form-control-lg myAccount" type="text" id="username" name="username" placeholder="Username" required>
                </div>
                <div class="w-100"></div>

                <div class="col  px-0">
                    <input class="form-control form-control-lg myAccount" type="text" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="w-100"></div>
            
            <div class="row mx-auto">
                <div class="col contactHeader ">
                    <p class="contactsText mt-1 mb-1 text-muted myAccountHeader">Account privileges will be set here</p>
                </div>
                <div class="w-100"></div>
                <select name="ROLET" class="col myDropdownText dropdownBorder custom-select custom-select-lg mb-3 myAccount" style="margin-top: 15px; margin-left: 15%; margin-right: 15%;">
                    <option selected class="myDropdownText myAccount">Select Privilege</option>
                    <option value="financeadmin" class="myDropdownText myAccount" >Finance</option>
                    <option value="auditlogadmin" class="myDropdownText myAccount">Audit & Logistics</option>
                </select>
            </div>
                </form>
        </div>




        <!--BOTTOM NAVBAR-->
        <nav class="navbar fixed-bottom SITENavbar blankNavbar">


        </nav>


    </body>

</html>

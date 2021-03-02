<%-- 
    Document   : login
    Created on : 03 5, 20, 11:55:48 AM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Bootstrap --> 
    </head>
    <style>
        body{
            background-color: #057D2D;
        }
        .logo{
            border-radius: 200px;
            max-width: 85%;

        }
        .myContainer{
            margin-top: 4%;
        }

    </style>
    <body>
        <div class="container myContainer">
            <div class="row justify-content-center ">
      <img class="logo img-fluid" src="design\SITELogo.jpg" alt="SITE LOGO" width="375" height="375">
            </div>
            
            <div class="row justify-content-center">

     <form action="processLogin" method="get" class="form-signin">

      <h1 class="h3 mb-3 font-weight-normal text-light">Please sign in</h1>
      <div class="row my-2">
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="text" id="inputEmail" class="form-control" placeholder="example@email.com" name="uname"  required autofocus>
      </div>
      <div class="row my-2">
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="pass" required>
      </div>
      <div class="checkbox mb-3">
        <label class="text-light">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-light">&copy; TEAM LIBRA</p>
    </form>
            </div>

        </div>
        
       
        
    </body>
</html>

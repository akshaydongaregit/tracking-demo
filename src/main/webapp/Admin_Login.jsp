
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <%@include file="Adminmaster.jsp"%>
        <%@include file="database.jsp"%>
        
          <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px;background-color: #f0ad4e">
                <h1><center> Login </center></h1>
            </div>
               <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="text" name="User_Name" class="form-control" placeholder="Enter User Name">
                </div>
                <div class="col-sm-4"></div>
                
            </div>
              <br>
              <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="Password" name="Password" class="form-control" placeholder="Enter Password">
                </div>
                <div class="col-sm-4"></div>
            </div>
              <br>
               <div class="well" style="opacity: 0.5; width: 50%; margin-left: 300px;background-color: highlight;">
                        <center>
                        <input type="submit" name="btn_LogIn" class="btn btn-primary" value="LogIn">
                       
                        <input type="submit" name="btn_SignIn" style="margin-left:50px;" value="SignIn" class="btn btn-primary">
                        </center>
                    </div>
              </div>
    </body>
</html>

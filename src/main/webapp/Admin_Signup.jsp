
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin signup</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <%@include file="Adminmaster.html"%>
        <form name="Admin_Signup" action="Admin_Signup.jsp" method="GET">
          
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.Connection"%>
        
        <%
             st=cn.createStatement();
             if(request.getParameter("btn_SignUp")!=null)
            try
            {
               
                String sql="insert into signup (full_name,contact_no,email,age,gender,username,password) values ('"+request.getParameter("txt_full_name")+"','"+request.getParameter("txt_contact_no")+"','"+request.getParameter("txt_email")+"','"+request.getParameter("txt_Age")+"','"+request.getParameter("Gender")+"','"+request.getParameter("txt_username")+"','"+request.getParameter("txt_password")+"')";
                st.execute(sql);
                %><script language="javascript">alert("SignUp successfull"); window.location="Admin_Login.jsp"; </script><%
                
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("SignUp Failed"); </script><%
            }
            %>
        
        <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px;background-color: #f0ad4e">
                <h1><center>Admin Signup</center></h1>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="text" name="txt_full_name" class="form-control" placeholder="Enter Full Name" onkeypress="javascript:return isString(event)">
                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
             <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="text" name="txt_contact_no" placeholder="Contact no" class="form-control" onkeypress="javascript:return isContact(event)" maxlength="10">
                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
             <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"> 
                    <input type="text" name="email" placeholder="xyz@gmail.com" class="form-control">
            </div>
            <div class="col-sm-4"></div>
            </div>
            <br>
            
            <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"> 
                    <input type="text" name="txt_Age" placeholder="Age" class="form-control" onkeypress="javascript:return isNumber(event)"> 
            </div>
            <div class="col-sm-4"></div>
            </div>
            <br>
            
            <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">         
                    <select name="Gender" class="form-control">
                        <option value="gender">Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <div class="col-sm-4">    
                    </select>
            </div>
            </div>        
            <br>
                <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"> 
                    <input type="text" placeholder="User Name" name="txt_username" class="form-control">
            <div class="col-sm-4"> </div>
            </div>
            </div>
            <br>
            
            <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"> 
                    <input type="password" placeholder="Password" name="txt_password" class="form-control">
            <div class="col-sm-4"> </div>
            </div>
            </div>
            <br>
           
            <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"> 
                <input type="password" placeholder="Confirm Password" name="txt_Confirm_password" class="form-control">
            </div>             
            <div class="col-sm-4"> </div>
            </div>
            <br>
                    
                    <div class="well" style="opacity: 0.5; width: 50%; margin-left: 300px;background-color: highlight;">
                        <center>
                            <input type="submit" name="btn_SignUp" class="btn btn-primary" value="SignUp" onclick="javascript:return.ValidateEmail(document.myform.email)">
                        </center>
                    </div>
                            
                    </div>
                    </form>
    </body>
</html>

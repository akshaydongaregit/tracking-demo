<%-- 
    Document   : Register.jsp
    Created on : Nov 28, 2017, 3:56:34 PM
    Author     : khalidmujawar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <form name="Register" action="Register.jsp" method="GET">
         <%@include file="Adminmaster.html" %>    
       
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.text.SimpleDateFormat" %>
            
        <%-- storing in database --%>
         <%
            
            String latt=request.getParameter("latt");
            String logt=request.getParameter("logt");
            String name=request.getParameter("name");
            
            String SQL_DRIVER="com.mysql.jdbc.Driver";
            String SQL_URL="jdbc:mysql://172.30.95.191:3306/sqldb";
            Connection cn=null;
            Statement st = null;
            
            /*----------------------
            connection to database
            --------------------------*/
            try
            {
                Class.forName(SQL_DRIVER);
                cn=DriverManager.getConnection(SQL_URL,"shridhar","shridhar");
                System.out.print("\n connection successfull ");
            }catch(Exception e)
             {
                out.print("<script type=\"text/javascript\"> alert(\"Error occured while opening database "+e+"\"); </script>");
                out.println("Error occured while opening database : "+e);
             }
             //out.print("<br> connection complete");
             
             if(request.getParameter("txt_full_name")!=null)
             try
            {
                java.text.SimpleDateFormat dformat=new SimpleDateFormat("YYYY-MM-DD hh:mm:ss.SS");
                String sdate=dformat.format(new java.util.Date());
                
                st=cn.createStatement();
                String sql="insert into registration(full_name,contact_no,email_id,age,gender,passward,security_code) values ('"+request.getParameter("txt_full_name")+"','"+request.getParameter("txt_contact_no")+"','"+request.getParameter("txt_email")+"','"+request.getParameter("txt_Age")+"','"+request.getParameter("Gender")+"','"+request.getParameter("txt_password")+"','"+request.getParameter("txt_security_code")+"')";
                st.execute(sql);
                System.out.print("Record Saved");
                %><script language="javascript">alert("Record Saved Successfully"); </script><%
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error while saving record"); </script><%
            }     
         %>
        
        <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px;background-color: #f0ad4e">
                <h1><center>Employee Registration</center></h1>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <select name="Employee" class="form-control">
                        <option value="text">Employee</option>
                        <option value="Driver">Driver </option>
                        <option value="Conductor">Conductor </option>
                    </select></div>
                    <div class="col-sm-4"></div>
                </div>
            <br>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="text" name="txt_Batch ID" placeholder="Batch ID" class="form-control" onkeypress="javascript:return isNumber(event)">
                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
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
                    <input type="text" name="txt_Address" class="form-control" placeholder="Address" onkeypress="javascript:return isAlpha(event)">
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
                    <input type="text" name="txt_email" placeholder="xyz@gmail.com" class="form-control">
                </div>
                <div class="col-sm-4"></div>
                </div>
                <br>
                <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="date" name="txt_Joining Date" class="form-control" placeholder="Joining Date" > <!--onkeypress="javascript:return isAlpha(event)">-->
                </div>
                <div class="col-sm-4"></div>
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
                        <div class="col-sm-4"> </div>  
                    </select>
                </div>
                <br>
                <div class="row">
                     <div class="col-sm-4"></div>
                <div class="col-sm-4"> 
                    <input type="password" placeholder="Password" name="txt_password" class="form-control">
                    <div class="col-sm-4"> 
                        <br>
                    
                </div>
                </div>
                </div>
                    <div class="row">
                        <div class="col-sm-4"></div>
                     <div class="col-sm-4"> 
                     <input type="password" placeholder="Security Code" name="txt_security_code" class="form-control">
                     </div>
                    
                    <div class="col-sm-4"> </div>
                    </div><br>
                    
                    <div class="well" style="opacity: 0.5; width: 50%; margin-left: 300px;background-color: highlight;">
                        <center>
                            <input type="submit" name="btn_Save" class="btn btn-primary" value="Save" onclick="javascript:return.ValidateEmail(document.myform.email)">
                             <input type="Submit" name="btn_Update" style="margin-left: 50px;" class="btn btn-primary" value="Update">
                             <input type="Submit" name="btn_Delete" style="margin-left: 50px;" class="btn btn-primary" value="Delete">
                             <input type="Submit" name="btn_Search"style="margin-left: 50px;" class="btn btn-primary" value="Search">
                        </center>
                    </div>
                          
                            
           
                    <div class="col-sm-4"> 
                        <div class="col-sm-4"> 
                            <div class="col-sm-4"> 
                                
                            </div>
                                <div class="col-sm-4"> 
                                    
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </form>
    </body>
</html>

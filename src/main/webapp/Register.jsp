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
        <%@include file="database.jsp" %>  
        <form name="Register" action="Register.jsp" method="GET">
         <%@include file="Adminmaster.html" %>    
       
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.text.SimpleDateFormat" %>
            
        <%-- storing in database --%>
         <%
                String employee=request.getParameter("Employee");
                 String batch_id=request.getParameter("txt_Batch ID");
                 String employee_name=request.getParameter("txt_full_name");
                 String address=request.getParameter("txt_Address");
                 String contact_no=request.getParameter("txt_contact_no");
                 String joining_date=request.getParameter("txt_Joining Date");
                 String gender=request.getParameter("Gender");
                 String age=request.getParameter("txt_Age");
                 String email=request.getParameter("txt_email");
                 String password=request.getParameter("txt_password");
                 String seccode=request.getParameter("txt_security_code");
                 
             if(request.getParameter("btn_Save")!=null)
            try
            {
                
                st=cn.createStatement();
                String sql="insert into employee_registration (employee,batch_id,full_name,address,contact_no,Joining_date,gender,age,email,password,security_code);
                st.execute(sql);
                
                %><script language="javascript">alert("Record Saved Successfully"); </script><% 
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error while saving record"); </script><%
            }
            %>
            
            <%   
                
                if(request.getParameter("btn_Update")!=null)
            try
           {
                
                 
                 st=cn.createStatement();
                 String sql="Update employee_registration set employee='"+employee+"',employee_Name='"+employee_name+"',Contact_no='"+contact_no+"',Joining_date='"+joining_date+"',address='"+address+"',age='"+age+"',Gender='"+gender+"' where batch_id='"+batch_id+"'";             
                 st.executeUpdate(sql);
                      %><script language="javascript">alert("Record Updated"); </script><% 
               
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Record Not Found"); </script><%
            }
            
            if(request.getParameter("btn_Delete")!=null)
            {
                st=cn.createStatement();
                 String sql="delete from employee_registration where batch_id="+request.getParameter("txt_Batch ID");
                 int r = st.executeUpdate(sql);
                 %><script language="javascript">alert("<%=r%>"+" Record(s) deleted"); </script><%
            }
                %>
                
                <%
                    if(request.getParameter("btn_Search")!=null)
                        try
                    {
                        st=cn.createStatement();
                        String sql="select employee,employee_name,contact_no,Joining_date,address,age,gender from employee_registration where batch_id="+request.getParameter("txt_Batch ID");
                        ResultSet rs = st.executeQuery(sql);
                        if(rs.next())
                        {
                           employee=rs.getString("employee");
                           employee_name=rs.getString("employee_name");
                           contact_no=rs.getBigDecimal("contact_no").toString();
                           joining_date=rs.getDate("Joining_date").toString();
                           address=rs.getString("address");
                           age=rs.getInt("age")+"";
                           gender=rs.getString("age");
                        }else
                        {
                        %><script language="javascript">alert("<%=rs%>"+" Records Not Found"); </script><%
                        }
                    }
                    catch(Exception e)
                    {
                        System.out.print("error :"+e);
                        %><script language="javascript">alert("Error while searching"); </script><%
                            
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
                        <div class="col-sm-4"> </div>  
                    </select>
                 </div>
              <br><br><br>
                    <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4"> 
                    <input type="password" placeholder="Password" name="txt_password" class="form-control">
                    </div>
                    <div class="col-sm-4"></div>
                    </div>
               <br>
                    <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4"> 
                    <input type="password" placeholder="Security Code" name="txt_security_code" class="form-control">
                    </div>   
                    <div class="col-sm-4"> </div>
                    </div>
                <br>
                    <div class="well" style="opacity: 0.5; width: 50%; margin-left: 300px;background-color: highlight;">
                        <center>
                            <input type="submit" name="btn_Save" class="btn btn-primary" value="Save" onclick="javascript:return.ValidateEmail(document.myform.email)">
                             <input type="Submit" name="btn_Update" style="margin-left: 50px;" class="btn btn-primary" value="Update">
                             <input type="Submit" name="btn_Delete" style="margin-left: 50px;" class="btn btn-primary" value="Delete">
                             <input type="Submit" name="btn_Search"style="margin-left: 50px;" class="btn btn-primary" value="Search">
                        </center>
                    </div> 
                                    
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </form>
    </body>
</html>

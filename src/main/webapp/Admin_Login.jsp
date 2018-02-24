
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        
        <% session.setAttribute("NO_LOGOUT","YES"); %>
        <%@include file="Adminmaster.html"%>
        <% session.removeAttribute("NO_LOGOUT"); %>
        <%@include file="database.jsp"%>
        
        <%
        if(request.getParameter("btn_SignIn")!=null)
        {
            response.sendRedirect("Admin_Signup.jsp");
        }
        
        if(request.getParameter("btn_LogIn")!=null)
        try
            {
            
                st=cn.createStatement();
                String sql="select * from signup where username='"+request.getParameter("User_Name")+"' and password='"+request.getParameter("Password")+"'";
                ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                int id=rs.getInt("id");
                String session_id = session.getId();
                sql = "insert into adminCon(id,session_id) values("+id+",'"+session_id+"')";
                st.execute(sql);
                
                System.out.print("Login OK ");
                System.out.print(id+" ");
                System.out.print(session_id+" ");
                response.sendRedirect("index.jsp");
                }else
                {
                System.out.print("NOK ");
                }
                
            }catch(Exception e)
            {
                System.out.print("error :"+e);
                System.out.print("ERROR ");
            }  
        %>
        <form name="loginForm">
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
            </form>
    </body>
</html>

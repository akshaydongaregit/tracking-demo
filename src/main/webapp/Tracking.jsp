

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track</title>
        <link rel="styleshet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <form name="Tracking" action="Tracking.jsp" method="GET">
        <%@include file="Adminmaster.html" %>
        <%@includw file="Authenticate.jsp" %>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Connection"%>
        <%
            
            ResultSet rs;
                    if(request.getParameter("btn_Search")!=null)
                     try
                    {
                        st=cn.createStatement();
                        String sql="select * from employee_registration where contact_no="+request.getParameter("txt_Mobile_No");
                        rs = st.executeQuery(sql);
                        if(rs.next())
                        {
                            int id = rs.getInt("dr_id");
                            rs.close();
                            %> <!-- <script language="javascript"> alert("Redirecting id <%=id%> to Track.jsp"); </script> --> <%
                             %> <script language="javascript"> window.location = "Track.jsp?e_id=<%=id%>" </script> <%
                            
                            //response.sendRedirect("Track.jsp?e_id="+id);
                        }else
                        {
                        %><script language="javascript">alert("Records Not Found"); </script><%
                        }
                    }       
                    catch(Exception e)
                    {
                        System.out.print("error :"+e);
                        %><script language="javascript">alert("Error while searching"); </script><%
                            
                    }
                
        %>
         <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px ;background-color: #f0ad4e">
                <h1><center>Track Bus</center></h1>
            </div>
         </div>
        
          <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <input type="text" name="txt_Mobile_No" placeholder="Mobile No" class="form-control" onkeypress="javascript:return isNumber(event)" maxlength="10">
                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
                <div class="well" style="width: 50%;margin-left:300px;background-color: highlight;">
                    <center>
                    <input type="Submit" name="btn_Search" class="btn btn-primary" value="Search">
                    </center>
                
         </form>
        
    </body>
</html>

<%-- 
    Document   : Schedule
    Created on : Dec 6, 2017, 7:32:59 PM
    Author     : khalidmujawar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
    </head>
    <body>
        <form name="Schedule" action="Schedule.jsp" method="GET">
        <%@include file="Adminmaster.html" %>
        <%@include file="Authenticate.jsp" %>   
        
         <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.Connection"%>
            
        <%
             st=cn.createStatement();
             
             if(request.getParameter("btn_Save")!=null)
            try
            {
               
                String sql="insert into Schedule(route,driver_name,conductor_name,departure,bus_no,distance) values ('"+request.getParameter("txt_Route")+"','"+request.getParameter("txt_Driver Name")+"','"+request.getParameter("txt_Conductor Name")+"','"+request.getParameter("txt_Departure")+"','"+request.getParameter("txt_Bus No")+"','"+request.getParameter("txt_Distance")+"')";
                st.execute(sql);
                %><script language="javascript">alert("Record Saved"); </script><%
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error while saving record"); </script><%
                    
            }
            %>
            
             <%   
                String route=request.getParameter("txt_Route");
                 String driver_name=request.getParameter("txt_Driver Name");
                 String conductor_name=request.getParameter("txt_Conductor Name");
                 String departure=request.getParameter("txt_Departure");
                 String bus_no=request.getParameter("txt_Bus No");
                 String distance=request.getParameter("txt_Distance");
                 
                 
                if(request.getParameter("btn_Update")!=null)
            try
           {
                
                 
                 st=cn.createStatement();
                 String sql="Update Schedule set Route='"+route+"',Driver_Name='"+driver_name+"',Conductor_Name='"+conductor_name+"',Departure='"+departure+"',Distance='"+distance+"' where Bus_no='"+bus_no+"'";             
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
                 String sql="delete from Schedule where bus_no='"+request.getParameter("txt_Bus No")+"'";
                 int r = st.executeUpdate(sql);
                 %><script language="javascript">alert("<%=r%>"+" Record(s) deleted"); </script><%
            }
                %>
                
                <%
                    if(request.getParameter("btn_Search")!=null)
                        try
                    {
                        st=cn.createStatement();
                        String sql="select route,driver_name,conductor_name,departure,distance from Schedule where bus_no='"+request.getParameter("txt_Bus No")+"'";
                        ResultSet rs = st.executeQuery(sql);
                        if(rs.next())
                        {
                           route=rs.getString("route");
                           driver_name=rs.getString("driver_name");
                           conductor_name=rs.getString("conductor_name");
                           departure=rs.getString("Departure");
                           distance=rs.getInt("Distance")+"";
                     
                        }else
                        {
                        %><script language="javascript">alert(" Records Not Found"); </script><%
                        }
                    }
                    catch(Exception e)
                    {
                        System.out.print("error :"+e);
                        %><script language="javascript">alert("Error while searching"); </script><%
                            
                    }
                    %>

        <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px; background-color: #f0ad4e;">
                <h1><center>Schedule</center></h1>
            </div>
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="text" name="txt_Route" class="form-control" value="<%=route==null?"":route%>" placeholder="Route" onkeypress="javascript:return isAlpha(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
             <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="text" name="txt_Driver Name" class="form-control" value="<%=driver_name==null?"":driver_name%>" placeholder="Driver Name" onkeypress="javascript:return isString(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="text" name="txt_Conductor Name" class="form-control" value="<%=conductor_name==null?"":conductor_name%>" placeholder="Conductor Name" onkeypress="javascript:return isString(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
           <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="Time" name="txt_Departure" class="form-control" value="<%=departure==null?"":departure%>" placeholder="Departure" onkeypress="javascript:return isFloat(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
           <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="text" name="txt_Bus No" class="form-control" value="<%=bus_no==null?"":bus_no%>" placeholder="Bus No." onkeypress="javascript:return isAlpha(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
           <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <input type="text" name="txt_Distance" class="form-control" value="<%=distance==null?"":distance%>" placeholder="Distance" onkeypress="javascript:return isAlpha(event)">
                </div>
                  <div class="col-lg-4"></div>
            </div>
            <br>
            <div class="well" style="width: 50%;margin-left: 300px;background-color: highlight;">
                <center>
                    <input type="submit" name="btn_Save" class="btn btn-primary" value="Save">
                    <input type="submit" name="btn_Update" style="margin-left: 50px;" class="btn btn-primary" value="Update">
                    <input type="submit" name="btn_Delete" style="margin-left: 50px;" class="btn btn-primary" value="Delete">
                    <input type="submit" name="btn_Search" style="margin-left: 50px;" class="btn btn-primary" value="Search">
                </center>
            </div>
           
        </div>
        </form>
        
    </body>
</html>

<%-- 
    Document   : View_Position
    Created on : Dec 30, 2017, 9:26:47 AM
    Author     : khalidmujawar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connected Users</title>
        <style type="text/css">
            a
            {
                text-decoration: none;
            }
          
            .panel-link
            {
              height:60px;
              width:60%;
              background:rgba(0,0,140,120);
              color:#FFF;
              margin-left:20%;
              margin-top:2%;
              font:bold 100%/1.5 "Lucida Grande";
              padding:0.4%;
              padding-left:10%;
              border:2px solid rgba(10,10,40,220); 
              box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <%@include file="Adminmaster.html" %>
        <div class="container">
            <div class="well" style="padding-top: 5px;padding-bottom: 5px;background-color: #f0ad4e">
                <h1><center>Connected Employees</center></h1>
            </div>
            </div>
 
        <%@page import="java.util.*"%>
        <%@page import="java.io.*"%>
        <%@include file="database.jsp" %>
         
        <%
            try
            {
                st=cn.createStatement();
                String sql="select e_id,name from connected";
                ResultSet rs = st.executeQuery(sql);
                
                
                while(rs.next())
                {
                    int id=rs.getInt("e_id");
                    String name=rs.getString("name");
                    %>
                        <a href="<%="Track.jsp?e_id="+id%>" >
                        <div class="panel-link">
                            <%=id%> &nbsp;&nbsp;&nbsp;
                            <%=name%>
                        </div>
                        </a>
                     <%
                }
                
                
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error reading record"); </script><%
            }   
            
            /*
            File coordsFile = new File("coords.txt");
            if(!coordsFile.exists())
            {
             System.out.print("coords.txt not found");
             out.print("<br>-- coords.txt file not found");
            }
            
            Scanner in=new Scanner(coordsFile);
            out.print("<br>printing ...");
             out.print("<br>---------------------------<br>");
            while(in.hasNextLine())
            {
                out.print("<br>+ ");
                String data=in.nextLine();
                String ind="";//data.substring(data.indexOf(" ",data.length()));
                String latt="";//ind.substring(0,ind.indexOf(" "));
                String logt="";//ind.substring(ind.indexOf(" ")+1,ind.length());
            
                out.print("<a href=\"Track.jsp?latt="+latt+"&logt="+logt+"\">"+data+"<br>");
            }
            in.close();
            out.print("<br>---------------------------");
            */
            
            %>
    </body>
</html>

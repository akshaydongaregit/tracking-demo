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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tracking Coords</h1>
        <%@page import="java.util.*;"%>
        <%@page import="java.io.*"%>
        
        <%
        
            out.println("<h1>Servlet view_location at " + request.getContextPath() + "</h1>");
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
                out.print(""+in.nextLine()+"<br>");
            }
            in.close();
            out.print("<br>---------------------------");
        
            %>
    </body>
</html>

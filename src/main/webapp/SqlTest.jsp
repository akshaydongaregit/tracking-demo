<html>
<head>
  <title>Sql Test</title>
</head>
<body>
  <%@page import="java.sql.*" %>
  <%
  
            String SQL_DRIVER="com.mysql.jdbc.Driver";
            String SQL_URL="jdbc:mysql://localhost:3306/sqldb";
            Connection cn=null;
            Statement st = null;
            
            /*----------------------
            connection to database
            --------------------------*/

            try
            {
                Class.forName(SQL_DRIVER);
                cn=DriverManager.getConnection(SQL_URL,"shridhar","shridhar");
                //out.print("\n connection successfull ");
            }catch(Exception e)
             {

                out.print("<script type=\"text/javascript\"> alert(\"Error occured while opening database "+e+"\"); </script>");
                //out.println("Error occured while opening database : "+e);
             }
  %>
</body>
</html>

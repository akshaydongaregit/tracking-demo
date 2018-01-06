<%-- 
    Document   : UpdatePosition
    Created on : Dec 30, 2017, 9:17:41 AM
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
        <h1></h1>
         
        <%@page import="java.io.File"%>
        <%@page import="java.io.File"%>
        <%@page import="java.io.IOException"%>
        <%@page import="java.io.PrintWriter"%>
        <%@page import="java.io.FileWriter"%>
        <%@page import="java.util.*"%>
        
        <%@page import="java.sql.*" %>'
        
        //storing in database
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
             out.print("<br> connection complete");
            
            try
            {
                java.text.SimpleDateFormat dformat=new SimpleDateFormat("YYYY-MM-DD hh:mm:ss.SS");
                String sdate=dformat.format(new java.util.Date());
                
                st=cn.createStatement();
                String sql="insert into locations(emp_id,name,latt,logt,utime) values('1' , '"+name+"','"+latt+"','"+logt+"','"+sdate+"')";
                st.execute(sql);
                System.out.print("Record Saved");
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error while saving record"); </script><%
            }     
             
         %>
        
        //sotrage in file
        <% 
            File coordsFile=new File("./coords.txt");
            
            if(coordsFile.exists())
            {
                out.print("<br>--- found coords.txt ");
                //out.print("deleting file "+coordsFile.delete()+"-----");
                
            }
            
            if(!coordsFile.exists())
            {
                coordsFile.createNewFile();
                System.out.print("<br>--File created-- ");
                out.print("<br>-- coords.txt File created --");
            }
            
            
            //creating to temp
            File tempFile = new File("./temp.txt");
            if(tempFile.exists())
            {
                out.print("<br>--- found temp.txt ");
                out.print(" deleting "+tempFile.delete()+" ----");
            }
            if(!tempFile.exists())
            {
                tempFile.createNewFile();
                 out.print("<br>--- created temp.txt ---");
            }
            
           
            out.print("<br>updating coords ... "+name+" "+latt+" "+logt);
            //System.console().printf("coords updated "+latt+" "+logt);
            Scanner in=new Scanner(coordsFile);
            FileWriter fr = null;
            
            try {
                fr = new FileWriter(tempFile);
                while(in.hasNextLine())
                {
                    String l=in.nextLine();
                    fr.write(l+"\n");
                    fr.flush();
                }
                //out.print("<br>writed to file "+name);
                fr.write(""+name+" "+latt+" "+logt);
                fr.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }finally{
                //close resources
                    fr.close();
                
            }
            fr.close();
            in.close();
            
            out.print("<br>delete old : "+coordsFile.delete());
            out.print("<br>old exists : "+coordsFile.exists());
            out.print("<br>renaming temp.txt : "+tempFile.renameTo(coordsFile));
            //out.print("deleting temp.txt : "+tempFile.delete());
            out.print("<br>coords updated "+latt+" "+logt);
        
            %>
    </body>
</html>

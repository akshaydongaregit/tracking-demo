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
            String latt=request.getParameter("latt");
            String logt=request.getParameter("logt");
            String name=request.getParameter("name");
            
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

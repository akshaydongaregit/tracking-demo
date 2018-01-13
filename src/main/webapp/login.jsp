<%@include file="database.jsp" %>
<%
String action=request.getParameter("action");

if(action!=null && action.equalsIgnoreCase("validate"))
try
            {
                st=cn.createStatement();
                String sql="select * from registration where email_id='"+request.getParameter("name")+"' and passward='"+request.getParameter("pwd");
                ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                out.print("OK ");
                out.print(rs.getInt("r_id")+" ");
                out.print(rs.getInt("full_name")+" ");
                }else
                {
                out.print("NOK ")
                }
                
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                out.print("ERROR ");
            }  
%>

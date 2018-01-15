<%@include file="database.jsp" %>
<%
String action=request.getParameter("action");
if(action!=null && action.equalsIgnoreCase("logout"))
try
            {
                st=cn.createStatement();
                String sql="delete from connected where e_id="+request.getParameter("id");
                int d = st.executeUpdate(sql);
                if(d>0)
                {
                  out.print("OK ");
                }else
                {
                  out.print("NOK ");
                }
                
            }catch(Exception e)
            {
                System.out.print("error :"+e);
                out.print("ERROR ");
            }  
%>

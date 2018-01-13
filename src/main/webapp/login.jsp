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
                int id=rs.getInt("r_id");
                String name=rs.getString("full_name");
                
                sql = "insert into connected(e_id,name) values("+id+",'"+name+"')";
                st.execute(sql);
                
                out.print("OK ");
                out.print(id+" ");
                out.print(name+" ");
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

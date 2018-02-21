<%@include file="database.jsp"%>
<%
  String session_id=session.getId();
  try
            {
            
                st=cn.createStatement();
                String sql="delete from adminCon where session_id='"+session_id+"'";
                 st.executeUpdate(sql);
                response.sendRedirect("Admin_Login.jsp");
                System.out.print("Logged Out OK "+session_id);
            }catch(Exception e)
            {
                System.out.print("error :"+e);
            }  
%>

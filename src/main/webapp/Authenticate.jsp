<%@include file="database.jsp"%>
<%
  String session_id=session.getId();
  try
            {
            
                st=cn.createStatement();
                String sql="select * from adminCon where session_id='"+session_id+"'";
                ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                System.out.print("Loged In OK ");
                System.out.print(session_id+" ");
                }else
                {
                response.sendRedirect("Admin_Login.jsp");
                }
                
            }catch(Exception e)
            {
                System.out.print("error :"+e);
            }  
%>

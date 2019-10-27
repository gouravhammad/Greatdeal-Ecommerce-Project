<%-- 
    Document   : DeleteFromCart
    Created on : Feb 16, 2019, 10:23:00 PM
    Author     : Compaq
--%>

<%@page import="util.SqlUtil"%>
<%! String username,productid; int result; %>
<% try
   {
      username = (String)session.getAttribute("username");
     
      if(username==null)
      {
         out.println("<script> alert('Please Login to Continue'); document.location.href='Greatdeal.jsp';</script>"); 
      }
   }
   catch(Exception Ex)
   {
      System.out.printf("Problem in Delete From Cart " + Ex);
   }
%>

<%
        try
        {
            SqlUtil.connectDB();  
            
            productid=request.getParameter("productid");
            
            result = SqlUtil.delete("delete from cart where username='"+username+"' and productid='"+productid+"';");
            
            out.println("<script> alert('Deleted from Cart'); document.location.href='Cart.jsp';</script>");  
            
        }
        catch(Exception Ex)
        {
             System.out.printf("Problem in Deleting " + Ex); 
        }
        
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Server Went Down!!</h1>
    </body>
</html>

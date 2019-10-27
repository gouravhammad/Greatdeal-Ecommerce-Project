<%-- 
    Document   : ChangeQuantity
    Created on : Feb 17, 2019, 10:00:46 PM
    Author     : Compaq
--%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String username,productid,quantity; int result; %>
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
      System.out.printf("Problem in Change Quantity " + Ex);
   }
%>

<%
        try
        {
            SqlUtil.connectDB();  
            
            productid = request.getParameter("productid");
            quantity = request.getParameter("quantity");
            
            result = SqlUtil.update("update cart set quantity='"+quantity+"' where username='"+username+"' and productid='"+productid+"';");
            
            out.println("<script>document.location.href='Cart.jsp';</script>");  
            
        }
        catch(Exception Ex)
        {
             System.out.printf("Problem in Deleting " + Ex); 
        }
        
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Server Went Down!!!</h1>
    </body>
</html>

<%-- 
    Document   : AddToCart
    Created on : Feb 12, 2019, 7:21:32 PM
    Author     : Compaq
--%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String username,productid,category; int result; %>

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
      System.out.printf("Problem in Add To Cart " + Ex);
   }
%>

<%
        productid = request.getParameter("productid"); 
        category = request.getParameter("category"); 
       
        try
        { 
            SqlUtil.connectDB();
            
            if(request.getParameter("productid")!=null)
            {
                result = SqlUtil.insert("insert into cart values('"+username+"','"+productid+"',1);");
            }

            if(result == 1)
            {
                out.println("<script> alert('Added to cart'); document.location.href='Product.jsp?category="+category+"';</script>");  
            }          
        }
        catch(Exception Ex)
        {
              out.println("<script> alert('Already added to cart'); document.location.href='Product.jsp?category="+category+"';</script>"); 
        }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SERVER WENT DOWN!! Please Wait for a while......</h1>
    </body>
</html>

<%-- 
    Document   : BuyAllitems
    Created on : Feb 19, 2019, 10:38:36 PM
    Author     : Compaq
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String username,productid,mode,date,time; int result,quantity=0,price = 0,totalprice=0,counter=0, count =0; %>

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
      System.out.printf("Problem in Buy ALL Items " + Ex);
   }
%>

<!DOCTYPE html>

<%
   
        try
        { 
            if(request.getParameter("totalprice")!=null)
            {
               
                mode = request.getParameter("mode"); 
 
                SqlUtil.connectDB();
                ResultSet rs = SqlUtil.read("select * from cart where username='"+username+"';");

                count = 0;
                while(rs.next())
                {
                    count++;
                }
 
                ResultSet gn = SqlUtil.read("Select curdate(),curtime();");

                if(gn.next())
                {
                    date = gn.getString("curdate()");
                    time = gn.getString("curtime()");
                }
                
                for(counter =0; counter<count; counter++)
                {
                    ResultSet ll = SqlUtil.read("select * from cart natural join product where username='"+username+"';");

                    if(ll.next())
                    {
                        quantity = ll.getInt("quantity");
                        price = ll.getInt("price");
                        totalprice = price*quantity;
                        productid = ll.getString("productid");

                        result = SqlUtil.insert("insert into orders values('"+username+"','"+productid+"',"+quantity+","+totalprice+",'"+mode+"','"+date+"','"+time+"');");   
                        result = SqlUtil.delete("delete from cart where username='"+username+"' and productid='"+productid+"';");
                    }
                }
                
                if(result == 1)
                {
                    out.println("<script> alert('Thanks for Buying'); document.location.href='Home.jsp';</script>"); 
                }
            }
        }
        catch(Exception Ex)
        {
            System.out.print("Problem in Buy All Items" + Ex);
        }   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Server Down!! </h1>
    </body>
</html>


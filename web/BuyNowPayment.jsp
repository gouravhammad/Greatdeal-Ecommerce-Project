<%-- 
    Document   : BuyNowPayment
    Created on : Feb 17, 2019, 2:03:10 PM
    Author     : Compaq
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String username,productid,mode,date,time; int result = 0,price = 0,quantity=0,totalprice=0; %>

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
      System.out.printf("Problem in BuyNow Payment " + Ex);
   }
%>

<%
        try
        { 
            if(request.getParameter("productid")!=null)
            {
                productid = request.getParameter("productid");
                mode = request.getParameter("mode"); 

                SqlUtil.connectDB();
                ResultSet rs = SqlUtil.read("Select curdate(),curtime();");

                if(rs.next())
                {
                    date = rs.getString("curdate()");
                    time = rs.getString("curtime()");
                }
                
                ResultSet ss = SqlUtil.read("select * from cart natural join product where username='"+username+"' and productid='"+productid+"';");

                if(ss.next())
                {
                    quantity = Integer.parseInt(ss.getString("quantity"));
                    price = ss.getInt("price");
                    totalprice = price*quantity;

                    result = SqlUtil.insert("insert into orders values('"+username+"','"+productid+"',"+quantity+","+totalprice+",'"+mode+"','"+date+"','"+time+"');"); 
                    result = SqlUtil.delete("delete from cart where username='"+username+"' and productid='"+productid+"';");

                }
                    
                if(result == 1)
                {
                    out.println("<script> alert('Thanks for Buying'); document.location.href='Home.jsp';</script>"); 
                }
            }
        }
        catch(Exception Ex)
        {
            System.out.print("Problem in BuyNow Payment Single Buy" + Ex);
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

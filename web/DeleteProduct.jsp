<%@page import="util.SqlUtil"%>
<%! String adminname; %>

<% try
   {
      adminname = (String)session.getAttribute("adminname");
     
      if(adminname==null)
      {
         out.println("<script> alert('Please Login to Continue'); document.location.href='Greatdeal.jsp';</script>"); 
      }
   }
   catch(Exception Ex)
   {
      System.out.printf("Problem in DeleteProduct " + Ex);
   }
%>
<!DOCTYPE html>
<html>
<head>
	<title>Greatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/DeleteProduct.css">
</head>
<body>
   <div class="Top">
       <button id="mylogoi">GREATDEAL</button>
        <ul>
          <li><a href="AdminHome.jsp">Admin Home</a></li>
          <li><a href="AddProduct.jsp">Add Product</a></li>
          <li><a class="active">Delete Product</a></li>
          <li><a href="AdminLogout.jsp">Logout</a></li>
        </ul>
   </div>
   <div class="loginbox">
   	<img src="Css/Images/DeleteProduct.ico" class="logo">
   	<br><br>
   	<h1>DROP PRODUCT</h1>
    <br>
    <form action="">
      <br>
      <p>Product ID</p>
      <input type="text" name="productid" placeholder="@product_id" required="">
      <span>Category &nbsp: </span>
      <select name="category" required="">
      <option value="mobile">Mobile</option>
      <option value="laptops">Laptops</option>
      <option value="menswear">Mens Wear</option>
      <option value="shoes">Shoes</option>
      <option value="game">Game</option>
      </select><br>
   	  <input type="checkbox" name="" required=""><span id="accept">I agree to delete the product</span><br>
   	  <input type="submit" name="button" value="DELETE PRODUCT"><br><br>
   	</form>
    </div>
</body>
</html>

<%! String productid,category; int result;%>

<%  productid = request.getParameter("productid");
    category = request.getParameter("category");
   
    try
    { 
      SqlUtil.connectDB();
      
      if(request.getParameter("button")!=null) 
      {       
        result = SqlUtil.delete("delete from product where productid='"+productid+"' and category='"+category+"';");
        
        if(result==1)
        {
%>
            <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      type:"success",
                      title:"Product Removed Successfully!",
                      showConfirmButton : false,
                      footer :'<a href="AdminHome.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script> 
 <%
        }
        else
        {
%>
            <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      type:"error",
                      title:"Invalid Product-ID!",
                      showConfirmButton : false,
                      footer :'<a href="AdminHome.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script> 
 <%
        }
      }
    }
    catch(Exception Ex)
    {
       System.out.printf("Problem in DeleteProduct " + Ex);
    } 
%>
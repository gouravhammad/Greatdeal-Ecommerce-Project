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
      System.out.printf("Problem in AddProduct " + Ex);
   }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Greatdeal</title>
  <link rel="stylesheet" type="text/css" href="Css/AddProduct.css">
</head>
<body>
  <div class="Top">
      <button id="mylogoi">GREATDEAL</button>
      <ul>
        <li><a href="AdminHome.jsp">Admin Home</a></li>
        <li><a class="active">Add Product</a></li>
        <li><a href="DeleteProduct.jsp">Delete Product</a></li>
        <li><a href="AdminLogout.jsp">Logout</a></li>
      </ul>
    </div>
   <div class="loginbox">
    <img src="Css/Images/Product.ico" class="logo">
    <br><br>
    <h1>PRODUCT DETAILS</h1>
    <form action=" ">
      <br><br>
      <p>Product ID</p>
      <input type="text" name="productid" placeholder="@product_id" required="">
      <p>Model Name</p>
      <input type="text" name="model" placeholder="@model_name" required="">
      <p>Price</p>
      <input type="number" name="price" placeholder="@price" required="">
      <p>Brand</p>
      <input type="text" name="brand" placeholder="@brand" required="">
      <p>Color</p>
      <input type="text" name="color" placeholder="@color" required="">
      <p>Image Name</p>
      <input type="text" name="imagename" placeholder="@example : image.jpg" required="">
      <span>Category &nbsp: </span>
      <select name="category" required="">
      <option value="mobile">Mobile</option>
      <option value="laptops">Laptops</option>
      <option value="menswear">Mens Wear</option>
      <option value="shoes">Shoes</option>
      <option value="game">Game</option>
      </select><br>
      <input type="checkbox" name="" required=""><span id="accept">Greatdeal assured and verifed product</span><br>
      <input type="submit" name="button" value="ADD PRODUCT"><br><br>
    </form>
    </div>

<%! String productid,imagename,model,brand,color,category; int price = 0,result = 0;%>

<%   
    try
    { 
      SqlUtil.connectDB();
      
      if(request.getParameter("button")!=null) 
      {       
        productid = request.getParameter("productid");
        model = request.getParameter("model");
        price = Integer.parseInt(request.getParameter("price"));
        brand = request.getParameter("brand");
        color = request.getParameter("color");
        category = request.getParameter("category");
        imagename = request.getParameter("imagename");
        
        result = SqlUtil.insert("insert into product values('"+productid+"','"+model+"',"+price+",'"+brand+"','"+color+"','"+imagename+"','"+category+"');");
        
        if(result ==1)
        {
%>
            <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      type:"success",
                      title:"Product added successfully",
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
%>   
           <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      type:"warning",
                      title:"Product Already Exists",
                      showConfirmButton : false,
                      footer :'<a href="AdminHome.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script> 
<%
      System.out.printf("Problem in AddProduct " + Ex);
    }
%>

</body>
</html>
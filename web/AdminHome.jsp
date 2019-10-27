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
      System.out.printf("Problem in AdminHome " + Ex);
   }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Greatdeal</title>
  <link rel="stylesheet" type="text/css" href="Css/AdminHome.css">
</head>
<body>
    <div class="Top">
        <button id="mylogoi">GREATDEAL</button>
      <ul>
        <li><a class="active">Admin Home</a></li>
        <li><a href="AddProduct.jsp">Add Product</a></li>
        <li><a href="DeleteProduct.jsp">Delete Product</a></li>
        <li><a href="AdminLogout.jsp">Logout</a></li>
      </ul>
    </div>

   <div class="button">
      <a href="AddProduct.jsp">ADD PRODUCT</a>
      <a href="DeleteProduct.jsp">DELETE PRODUCT</a>
   </div> 
</body>
</html>
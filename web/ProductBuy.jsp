<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%! String username,brand,model,color,productid,image,category; int result = 0,count = 0,price = 0; %>

<% 
   try
   {
      username = (String)session.getAttribute("username");
     
      if(username==null)
      {
         out.println("<script> alert('Please Login to Continue'); document.location.href='Greatdeal.jsp';</script>"); 
      }
   }
   catch(Exception Ex)
   {
      System.out.printf("Problem in ProductBuy " + Ex);
   }
%>

<!DOCTYPE html>
<html>
<head>
	<title>Geatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/ProductBuy.css">
</head>
<body>

    <%    
    try
    {
         SqlUtil.connectDB();
         ResultSet rs = SqlUtil.read("select * from cart where username='"+username+"';");
         
         count = 0;
         while(rs.next())
         {
             count++;
         }
    }
    catch(Exception Ex)
    {
        System.out.print("Error in Cart Items" + Ex);
    }
%>
    
       <div class="header"> 
		<span>GREATDEAL</span>
		<form action="Product.jsp">
		<input required="" type="text" placeholder="Search for any products, brands and more" name="search" size="60">
                <button id="searchbutton" type="submit"><img src="Css/Images/SearchIcon.ico">Search</button>
                </form>
		<ul>
			<li><a href="Home.jsp">Home</a></li> 
			<li><a href="Profile.jsp">Profile</a></li>
			<li><a href="Cart.jsp">Cart<button id="carty"><%=count%></button></a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>

	<div class="search">
			<ul class="main">
				<li><a href="Home.jsp">Home</a></li>
			    <li id="abc"><a>Category</a>
			    <ul class="sub">
	                <li>
	                  <a>
	                    <form action="Product.jsp">
	                    <button name="category" value="mobile">Mobile</button>
	                    </form>
	                  </a>
	                </li>
	                <li>
	                  <a>
	                    <form action="Product.jsp">
	                    <button name="category" value="laptops">Laptops</button>
	                    </form>
	                  </a>
	                </li>
	                <li>
	                  <a>
	                    <form action="Product.jsp">
	                    <button name="category" value="menswear">Mens Wear</button>
	                    </form>
	                  </a>
	                </li>
	                <li>
	                  <a>
	                    <form action="Product.jsp">
	                    <button name="category" value="shoes">Shoes</button>
	                    </form>
	                  </a>
	                </li>
	                <li>
	                  <a>
	                    <form action="Product.jsp">
	                    <button name="category" value="game">Game</button>
	                    </form>
	                  </a>
	                </li>
	            </ul>
	                <li><a href="Profile.jsp">Profile</a></li>
	                <li><a href="Cart.jsp">Cart</a></li>
                        <li><a href="Orders.jsp">My Orders</a></li>
		    </ul>
	</div>

<%   
    productid = request.getParameter("productid");     
    
    try
    {
         SqlUtil.connectDB();
         ResultSet rs = SqlUtil.read("select * from product where productid='"+productid+"';");

         if(rs.next())
         { 
             brand = rs.getString("brand");
             model = rs.getString("model");
             price = rs.getInt("price");
             color = rs.getString("color");
             image = rs.getString("imagename");
             category = rs.getString("category");
         }
    }
    catch(Exception Ex)
    {
        System.out.println("Problem in Detailing Products " + Ex);
    }  
%> 

%> 
	<div class="container">
		<div class="productitems">
		    	<div class="model">
		    		<h2><%=model%></h2>
		    	</div>
		    	<div class="properties">
			    	<span id="type">Brand : </span><span><%=brand%></span><br>
			    	<span id="type">Color : </span><span><%=color%></span><br>
			    	<span id="type">Category : </span><span><%=category%></span><br>
		        </div>
		        <div class="details">
		        	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
		        	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
		        	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
		        	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca</p>
		        </div>
		     	<div class="price">
		           <span id="type2">Price : </span><span><%=price%></span>
		        </div>
                        <div class="buttons">
                            <a href="AddToCart.jsp?productid=<%=productid%>&category=<%=category%>">ADD TO CART</a>
                            <a href='BuyNow.jsp?productid=<%=productid%>'>BUY NOW</a>
                        </div>
		</div>
		<div class="display">
			<img src="Css/Product/<%=category%>/<%=image%>">
		</div>
	</div>
                        

</body>

</html>




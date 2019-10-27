<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%! String username; int count = 0; %>

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
      System.out.printf("Problem in Home " + Ex);
   }
%>

<!DOCTYPE html>
<html>
<head>
	<title>Geatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Home.css">
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
			<li><a id="selected">Home</a></li> 
			<li><a href="Profile.jsp">Profile</a></li>
                        <li><a href="Cart.jsp">Cart<button id="cart"><%=count%></button></a></li>
                        <li><a href="Logout.jsp">Logout</a></li>
		
                </ul>    
	</div>

	<div class="search">
                <ul class="main">
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
                    </ul></li>
                    <li><a href="Profile.jsp">Profile</a></li>
                    <li><a href="Cart.jsp">Cart</a></li>
                    <li><a href="Orders.jsp">My Orders</a></li>
                </ul>
	</div>

	<div class="category">
                <a href="Product.jsp?category=mobile">
		<div class="categoryitems">
			<img src="Css/Category/mobile.ico">
			<form action="Product.jsp">
                            <button name="category" value="mobile">Mobile</button>
		        </form>
		</div>
                </a>
               <a href="Product.jsp?category=laptops">
		<div class="categoryitems">
			<img src="Css/Category/laptops.ico">
			<form action="Product.jsp">
			<button name="category" value="laptops">Laptops</button>
			</form>
		</div>
               </a>
               <a href="Product.jsp?category=menswear">
		<div class="categoryitems">
			<img src="Css/Category/menswear.ico">
			<form action="Product.jsp">
                            <button name="category" value="menswear">Mens Wear</button>
			</form>
		</div>
               </a>
               <a href="Product.jsp?category=shoes">
		<div class="categoryitems">
			<img src="Css/Category/shoes.ico">
			<form action="Product.jsp">
			<button name="category" value="shoes">Shoes</button>
			</form>
		</div>
               </a>
               <a href="Product.jsp?category=game">
		<div class="categoryitems">
			<img src="Css/Category/game.ico">
			<form action="Product.jsp">
			<button name="category" value="game">Game</button>
		    </form>
		</div>
               </a>
	</div>

	<div class="container">
	      <div class="sliderbox">
                  <a href="Product.jsp?category=laptops"><img src="Css/Adds/1.jpg" ></a>
                  <a href="Product.jsp?category=menswear"><img src="Css/Adds/2.jpg" ></a>
                  <a href="Product.jsp?category=shoes"><img src="Css/Adds/3.jpg" ></a>
                  <a href="Product.jsp?category=mobile"><img src="Css/Adds/4.jpg" ></a>
                  <a href="Product.jsp?category=game"><img src="Css/Adds/5.jpg" ></a>
	      </div>
	</div>
</body>
</html>


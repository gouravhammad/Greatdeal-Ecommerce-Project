<%@page import="util.SqlUtil"%>
<%@page import="java.sql.ResultSet"%>
<%! String username,brand,model,color,productid,image,category,query,search,order; int count = 0,check = 0,price = 0; %>

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
      System.out.printf("Problem in Product " + Ex);
   }
%>

<!DOCTYPE html>
<html>
<head>
	<title>Geatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Product.css">
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
                        
        <div class="items">
<% 
 if(request.getParameter("category")!=null || request.getParameter("search")!=null)
 {
    try
    {
         category = request.getParameter("category");
        
         if(request.getParameter("search")!=null)
         {
            search = request.getParameter("search");
            
            query = "select * from product where category LIKE '%"+search+"%' or model LIKE '%"+search+"%' or brand LIKE '%"+search+"%' or imagename LIKE '%"+search+"%';"; 
         }
         else
         {
            query = "select * from product where category='"+category+"';";
         }
         
         if(request.getParameter("sortClick")!=null)
        {         
             order = request.getParameter("Order");

             if(request.getParameter("category")!=null || request.getParameter("search")!=null)
             {
                 try
                 {
                      category = request.getParameter("category");

                      if(request.getParameter("search")!=null)
                      {
                         search = request.getParameter("search");

                         query = "select * from product where category LIKE '%"+search+"%' or model LIKE '%"+search+"%' or brand LIKE '%"+search+"%' or imagename LIKE '%"+search+"%' "+order+";"; 
                      }
                      else
                      {
                         query = "select * from product where category='"+category+"' "+order+";"; 
                      }
                 }
                 catch(Exception Ex)
                 {
                     System.out.print("Problem in Sorting Query " + Ex);
                 }
             }
        }
         
         SqlUtil.connectDB();
         
         ResultSet rs = SqlUtil.read(query);
         check = 0;
        
         while(rs.next())
         { 
             check = 1;
             brand = rs.getString("brand");
             model = rs.getString("model");
             price = rs.getInt("price");
             productid = rs.getString("productid");
             color = rs.getString("color");
             image = rs.getString("imagename");   
             category = rs.getString("category");   
%> 
                <a href="ProductBuy.jsp?productid=<%=productid%>">                 
                    <div class="productitems">
                            <img src="Css/Product/<%=category%>/<%=image%>">
                        <div class="details">
                            <div id="model">
                                <h3><a href="ProductBuy.jsp?productid=<%=productid%>"><%=model%></a></h3>
                            </div>
                            <div id="properties">
                            <span id="type">Brand : </span><span><%=brand%></span><br>
                            <span id="type">Color &nbsp: </span><span><%=color%></span>
                            </div>
                            <div id="price">
                               <span id="type">Price &nbsp: </span><span><%=price%>/-</span>
                            </div>
                        </div>
                            <div class="buttons">
                               <a href='AddToCart.jsp?productid=<%=productid%>&category=<%=category%>'>ADD TO CART</a>
                               <a href='BuyNow.jsp?productid=<%=productid%>'>BUY NOW</a>
                            </div>
                    </div></a>
<%    
         }
%>
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
                    </ul></li>
                    <li><a href="Profile.jsp">Profile</a></li>
                    <li><a href="Cart.jsp">Cart</a></li>
                    <li><a href="Orders.jsp">My Orders</a></li>
                </ul>
            
<%          
            if(check!=0)
            {
%>
            <div class="sort">
                <h4>Order by Price:</h4>
                <form action="Product.jsp">
                    <input required="" type="radio" name="Order" value="Order by price ASC"><h5>Low to High</h5><br>
                    <input type="radio" name="Order" value="Order by price DESC"><h5>High to Low</h5>
                    <%
                        if(request.getParameter("category")!=null)
                        {
                           category = request.getParameter("category");          
                    %>
                    <input type="text" name="category" value="<%=category%>">
                    <%
                        }
                        if(request.getParameter("search")!=null)
                        { 
                           search = request.getParameter("search");
                    %>
                    <input type="text" name="search" value="<%=search%>">
                    <%
                        }
                    %>
                    <input type="submit" name="sortClick" value="SORT">
                </form>
            </div>
<%
          }
%>
	</div>
<%          
    }
    catch(Exception Ex)
    {
        System.out.println("Problem in Fetching Products " + Ex);
    }  
 }
 
    if(check == 0)
    {
%>  
           <div class="error">
                <h1>NO SEARCH ITEM FOUND, Please Try Again.</h1>
	   </div>  
<%
    }
%>
</body>
</html>
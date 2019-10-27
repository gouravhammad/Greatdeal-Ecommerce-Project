<%@page import="util.SqlUtil"%>
<%@page import="java.sql.ResultSet"%>

<%! String username,brand,model,total,color,productid,image,category,quantity,date,time,mode; int serial = 1,result, count = 0; %>
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
      System.out.printf("Problem in Orders " + Ex);
   }
%>

<!DOCTYPE html>
<html>
<head>
	<title>Geatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Orders.css">
</head>

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

<body>
	<div class="header"> 
		<span>GREATDEAL</span>
		<form action="Product.jsp">
		<input required="" type="text" placeholder="Search for any products, brands and more" name="search" size="60">
                <button id="searchbutton" type="submit"><img src="Css/Images/SearchIcon.ico">Search</button>
                </form>
		<ul>
			<li><a href="Home.jsp">Home</a></li> 
			<li><a href="Profile.jsp">Profile</a></li>
			<li><a href="Cart.jsp">Cart<button id="cart"><%=count%></button></a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>
    <div class="cartitems">
<%    
    try
    {
         SqlUtil.connectDB();
         ResultSet rs = SqlUtil.read("select * from orders natural join product where username='"+username+"';");
         
         serial = 1;

         while(rs.next())
         {
            brand = rs.getString("brand");
            model = rs.getString("model");
            total = rs.getString("total");
            date = rs.getString("date");
            quantity = rs.getString("quantity");
            time = rs.getString("time");
            color = rs.getString("color");
            image = rs.getString("imagename"); 
            productid = rs.getString("productid"); 
            category = rs.getString("category");
            mode = rs.getString("paymentmode");
%> 
               <div class="items">
			<div class="serial">
				<h1><%=serial++%></h1>
			</div>
			<div class="productimage">
				<img src="Css/Product/<%=category%>/<%=image%>">
			</div>
			<div class="productdetails">
			    <div class="details">
			    	<h1><a id="model" href="ProductBuy.jsp?productid=<%=productid%>"><%=model%></a></h1>
				</div>
				<div class="properties">
				    <span id="type">Brand : </span><span><%=brand%></span>&nbsp&nbsp&nbsp&nbsp<span id="type">Color : </span><span><%=color%></span>&nbsp&nbsp&nbsp&nbsp<span id="type">Category : </span><span><%=category%></span>
				</div>
			</div>
                        <div class="modeandquantity">
                            <div class="quantity">
                              <h1>Qty</h1><label><%=quantity%></label>
                            </div>
                            <div class="mode">
                               <h1>Mode</h1><label><%=mode%></label>  
                            </div> 
		        </div>  
			<div class="price">
				<h1>&nbsp Total</h1>
				<label><%=total%></label>
			</div>
			<div class="dateandtime">
                            <div class="date">
                              <h1>Date</h1><label><%=date%></label>
                            </div>
                            <div class="time">
                               <h1>Time</h1><label><%=time%></label>  
                            </div> 
		        </div>
		</div>    
<%           
         }   
    }
    catch(Exception Ex)
    {
        System.out.println("Problem in Fetching Orders " + Ex);
    } 
%>
<%                
            if(serial==1)
            {
%>

                <div class="buttons">
                        <h1 style="text-align: center; margin-top: 10px;">NO ORDERS TILL DATE!</h1>
		</div>   
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
              </ul>
          <li><a href="Profile.jsp">Profile</a></li>
          <li><a id="active">My Orders</a></li>
        </ul>
    </div>
</body>
</html>
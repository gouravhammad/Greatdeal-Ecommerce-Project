<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<!DOCTYPE html>
<html>
<head>
	<title>Greatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Login.css">
</head>
<body>
   <div class="Top">
       <button id="mylogo">GREATDEAL</button>
        <ul>
          <li><a href="Greatdeal.jsp">Home</a></li>
          <li><a class="active">Login</a></li>
          <li><a href="Signup.jsp">Sign Up</a></li>
          <li><a href="Admin.jsp">ADMIN</a></li>
          <li><a href="Contact.jsp">Contact</a></li>
        </ul>
   </div>
   <div class="loginbox">
   	<img src="Css/Images/LoginLogo.ico" class="logo">
   	<br><br>
   	<h1>USER LOGIN</h1>
        <form action="">
        <br>
   		<p>Username</p>
   		<input type="text" name="username" placeholder="@username" required="">
   		<p>Password</p>
   		<input type="password" name="userpassword" placeholder="@password" required=""><br><br>
   	<input type="submit" name="button" value="Login"><br><br>
   	<a href="Signup.jsp">Don't have an account?</a>
   	</form>
    </div>
    
<%! String username,userpassword,button; %>
<% 
   button = request.getParameter("button");
   if(request.getParameter("button")!=null) 
   {
        username = request.getParameter("username");
        userpassword = request.getParameter("userpassword"); 

        try
        { 
          SqlUtil.connectDB();
          ResultSet rs = SqlUtil.read("Select * from login where username='"+username+"' and password='"+userpassword+"';" ); 

          if(rs.next())
          {
              session.setAttribute("username",username);
              response.sendRedirect("Home.jsp");
          }
          else
          {
%>
            <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      type:"error",
                      title:"Oops...",
                      text:"Invalid Username/Password",
                      showConfirmButton : false,
                      footer :'<a href="Login.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script> 
 <%
          }
        }
        catch(Exception Ex)
        {
              System.out.print("Problem in Login " + Ex);
        }
   }
%> 
</body>
</html>
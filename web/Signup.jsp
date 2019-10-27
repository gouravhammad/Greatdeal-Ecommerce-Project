<%@page import="util.SqlUtil"%>
<!DOCTYPE html>
<html>
<head>
	<title>Greatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Signup.css">
</head>
<body>
  <div class="Top">
      <button id="mylogoi">GREATDEAL</button>
        <ul>
          <li><a href="Greatdeal.jsp">Home</a></li>
          <li><a href="Login.jsp">Login</a></li>
          <li><a class="active">Sign Up</a></li>
          <li><a href="Admin.jsp">ADMIN</a></li>
          <li><a href="Contact.jsp">Contact</a></li>
        </ul>
   </div>
   <div class="loginbox">
   	<img src="Css/Images/SignupLogo.ico" class="logo">
   	<br><br>
   	<h1>Sign Up</h1>
   	<form action="">
        <br><br>
   		<p>Username</p>
   		<input type="text" name="username" placeholder="@username" required="">
   		<p>Password</p>
   		<input type="password" name="userpassword" placeholder="@password" required="">
        <p>Mobile Number</p>
        <input type="number" name="usermobile" placeholder="@mobilenumber" required="" min="0" max="9999999999">
        <p>Email ID</p>
        <input type="Email" name="useremail" placeholder="@email-id" required="">
        <span>Gender :    </span>
        <input type="radio" value="Male" name="gender" required=""><span> Male&nbsp&nbsp</span>
        <input type="radio" value="Female" name="gender" required=""><span> Female </span><br>
        <span>City &nbsp: </span>
   	<select name="usercity" required="">
        <option value="Indore" selected="">Indore</option>
        <option value="Mhow">Mhow</option>
        <option value="Gwalior">Gwalior</option>
        <option value="Ratlam">Ratlam</option>
        </select>
        <input type="checkbox" name="" required=""><span id="accept">I accept the Terms & Conditions.</span><br>
        <input type="submit" name="button" value="Sign Up"><br><br>
   	</form>
    </div>

<%! String username,mobile,email,city,gender,password; 
    int result1,result2;    
%>

<%  username = request.getParameter("username");
    password = request.getParameter("userpassword");
    mobile = request.getParameter("usermobile");
    email = request.getParameter("useremail");
    gender = request.getParameter("gender");
    city = request.getParameter("usercity");
    
    try
    { 
      SqlUtil.connectDB();
      
      if(request.getParameter("button")!=null) 
      {       
        result1 = SqlUtil.insert("insert into profile values('"+username+"','"+mobile+"','"+email+"','"+gender+"','"+city+"');");
        result2 = SqlUtil.insert("insert into login values('"+username+"','"+password+"');");
        System.out.println("RESULT 1 : " + result1);
         System.out.println("RESULT 2 : " + result2);
        
        if(result1 == 1 && result2 == 1)
        {
%>
            <script src="Script/AlertScript.js"></script>
            <script>
                    Swal.fire({
                      title:"Successfully Signed Up",
                      text:"Continue shopping",
                      showConfirmButton : false,
                      type:'info',
                      footer :'<a href="Login.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script> 
 <%
        }
        else
        { 
               System.out.println("Error in insertion");
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
                      title:"Oops...",
                      text:"Username already exists",
                      showConfirmButton : false,
                      footer :'<a href="Signup.jsp" style="color:white; text-shadow:0px 0px 0.5px white ; letter-spacing:2px; font-weight:normal ; padding:10px 20px; border-radius:2px;  background:#3085d6 ; text-decoration:none;">OKAY</a>'
                    });
            </script>
<%
       System.out.printf("Problem in Signup " + Ex);
    }
%>

</body>
</html>
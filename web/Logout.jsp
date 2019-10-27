<%! String username,adminname; %>

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
      System.out.printf("Problem in Logout.JSP " + Ex);
   }
%>

<!DOCTYPE html>
<html>
<head>
	<title>Greatdeal</title>
	<link rel="stylesheet" type="text/css" href="Css/Logout.css">
</head>
<body>
		<div class="confirm">
			<h1>CONFIRM LOGOUT ?</h1>
		</div>
	<div class="button">
			<a href="Logout">YES</a>
	   		<a href="Home.jsp">NO</a>
	</div>
</body>
</html>
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
      System.out.printf("Problem in AdminLogout " + Ex);
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
	   		<a href="AdminHome.jsp">NO</a>
	</div>
</body>
</html>
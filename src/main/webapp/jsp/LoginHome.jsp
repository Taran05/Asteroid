<%@page import="in.co.sunrays.project4.bean.RoleBean"%>
<%@page import="in.co.sunrays.project4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.project4.bean.UserBean"%>
<%@page import="in.co.sunrays.project4.controller.ORSView"%>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
    <title>Welcome to Asteroid</title>
    
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #E9ECEA;">
  <a class="navbar-brand "  href="index.jsp">Asteroid</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.USER_REGISTRATION_CTL%>">Sign Up</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.LOGIN_CTL%>">Sign In</a>
      <a class="nav-item nav-link" style="color: black;" href="AboutUs.jsp">About Us</a>
    </div>
  </div>
</nav>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	
    <img src="<%=ORSView.APP_CONTEXT%>/img/Asteriod_logo.png" class="mx-auto d-block" height="200">
	

   </body>   

<hr>
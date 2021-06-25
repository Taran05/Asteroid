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
	    
  </head>

<%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;
    String welcomeMsg = "Hi, ";
    String role = (String) session.getAttribute("role"); %>
    <% welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    
%>
<title>Welcome <%= userBean.getFirstName() %></title>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #E9ECEA;">
  <a class="navbar-brand "  href="<%=ORSView.MY_PROFILE_CTL%>"><%= userBean.getFirstName() %></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
    <% if (userBean.getRoleId() == RoleBean.STUDENT) { %>
      <a class="nav-item nav-link active" href="<%=ORSView.WELCOME_CTL%>">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.GET_MARKSHEET_CTL%>">View Marksheet</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet Merit List</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.MY_PROFILE_CTL%>">My Profile</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
      
      <% } if (userBean.getRoleId() == RoleBean.FACULTY) { %>
      <a class="nav-item nav-link active" href="<%=ORSView.WELCOME_CTL%>">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.MY_PROFILE_CTL%>">My Profile</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Marksheet
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.GET_MARKSHEET_CTL%>">View Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet Merit List</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Student
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">Add Student</a>
          <a class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a>
        </div>
      </li>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
      
      <% } if (userBean.getRoleId() == RoleBean.ADMIN) { %>
      <a class="nav-item nav-link active" href="<%=ORSView.WELCOME_CTL%>">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.MY_PROFILE_CTL%>">My Profile</a>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Marksheet
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.GET_MARKSHEET_CTL%>">View Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet Merit List</a>
          <a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          User
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.USER_CTL%>">Add User</a>
          <a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>">User List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          College
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>">Add College</a>
          <a class="dropdown-item" href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Student
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">Add Student</a>
          <a class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color: black;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Role
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">Add Role</a>
          <a class="dropdown-item" href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a>
        </div>
      </li>
      <a class="nav-item nav-link" style="color: black;" href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
      <% } %>
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

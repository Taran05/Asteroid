<%@page import="in.co.sunrays.project4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.project4.utility.HTMLUtility"%>
<%@page import="in.co.sunrays.project4.utility.DataUtility"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<html>
<head>
<title>Sign-Up</title>
<style>
table {
        border-collapse: separate;
        border-spacing: 0 15px;
      }


td {
  width: 220px;
  text-align: center;
  padding: 5px;
}


</style>
</head>
<body>
    <form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

        <%@ include file="LoginHome.jsp"%>
        <script type="text/javascript" src="js/calendar.js"></script>
        <jsp:useBean id="bean" class="in.co.sunrays.project4.bean.UserBean"
            scope="request"></jsp:useBean>

        <center>
            <h2>User Registration</h2>
            <br>

            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            <table>

                <tr>
                    <th>First Name*</th>
                    <td><input type="text" name="firstName"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
                        color="red" font size="5"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th>Last Name*</th>
                    <td><input type="text" name="lastName"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
                        color="red" font size="5"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th>LoginId*</th>
                    <td><input type="text" name="login"
                        placeholder="Must be an Email ID"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
                        color="red" font size="5"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
                <tr>
                    <th>Password*</th>
                    <td><input type="password" name="password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
                        color="red" font size="5"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr>
                    <th>Confirm Password*</th>
                    <td><input type="password" name="confirmPassword"
                        value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"><font
                        color="red" font size="5"> <%=ServletUtility
                    .getErrorMessage("confirmPassword", request)%></font></td>
                </tr>
                <tr>
                    <th>Gender*</th>
                    <td>
                        <%
                            HashMap map = new HashMap();
                            map.put("S", "Select");
                            map.put("M", "Male");
                            map.put("F", "Female");
                            map.put("O", "Others");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%>

                    </td>
                </tr>

                <tr>
                    <th>Date Of Birth (mm/dd/yyyy)*</th>
                    <td><input type="text" name="dob" readonly="readonly"
                        value="<%=DataUtility.getDateString(bean.getDob())%>"> <a
                        href="javascript:getCalendar(document.forms[0].dob);"> <img
                            src="./img/cal.png" width="20" height="20" border="0"
                            alt="Calender">
                    </a><font color="red" font size="5"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2">&nbsp; &nbsp; &nbsp;
                        &nbsp; <input type="submit" name="operation" class="btn btn-info" value="<%=UserRegistrationCtl.OP_SIGN_UP %>">
                    </td>
                </tr>
            </table>
            
            <H2>
                <font color="green" font size="5"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red" font size="5"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>
            
            
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>
<%@page import="in.co.sunrays.project4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.project4.utility.DataUtility"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<html>
<head>
<title>Sign-In</title>
<style>
table {
        border-collapse: separate;
        border-spacing: 0 15px;
      }

th,
td {
  width: 150px;
  text-align: center;
  padding: 5px;
}


</style>
</head>

<body>
<%@ include file="LoginHome.jsp"%>

    <form action="<%=ORSView.LOGIN_CTL%>" method="post">
        

        <jsp:useBean id="bean" class="in.co.sunrays.project4.bean.UserBean"
            scope="request"></jsp:useBean>

        <center>
            <h2>Login</h2>
            
            <br>

            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>
              
              <input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <table>
                <tr>
                    <th>Login Id*</th>
                    <td><input type="text" name="login" size=30
                        value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
                
                <tr>
                
                    <th>Password*</th>
                    <td><input type="password" name="password" size=30
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=LoginCtl.OP_SIGN_IN %>"> &nbsp; <input type="submit"
                        name="operation" class="btn btn-info" value="<%=LoginCtl.OP_SIGN_UP %>" > &nbsp;</td>
                </tr>
                <tr><th></th>
                <td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forgot password ?</b></a>&nbsp;</td>
            </tr>
            </table>
            
            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>
            
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>
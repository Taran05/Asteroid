<%@page import="in.co.sunrays.project4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.project4.utility.DataUtility"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<html>
<head>
<title>Forget Password</title>
</head>
<body>
<%@ include file="LoginHome.jsp"%>
    <form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">     

        <jsp:useBean id="bean" class="in.co.sunrays.project4.bean.UserBean"
            scope="request"></jsp:useBean>

        <center>
            <h2>Forgot your password?</h2>
            <input type="hidden" name="id" value="<%=bean.getId()%>">

            <table>
                 <lable>Submit your email address and we'll send you password.</lable><br><br>
                <label>Email Id :</label>&emsp;
                <input type="text" name="login" placeholder="Enter ID Here"
                    value="<%=ServletUtility.getParameter("login", request)%>">&emsp;
                <input type="submit" name="operation" value="<%=ForgetPasswordCtl.OP_GO%>"><br>
                <font color="red" font size="5"> <%=ServletUtility.getErrorMessage("login", request)%></font>
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
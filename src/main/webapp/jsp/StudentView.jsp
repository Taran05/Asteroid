<%@page import="in.co.sunrays.project4.controller.StudentCtl"%>
<%@page import="in.co.sunrays.project4.utility.DataUtility"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="in.co.sunrays.project4.utility.HTMLUtility"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Add Student</title>
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
    <form action="StudentCtl" method="POST">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.sunrays.project4.bean.StudentBean"
            scope="request"></jsp:useBean>
            
            
        <%
            List l = (List) request.getAttribute("collegeList");
        %>

        <center>
            <h2>Add Student</h2>
<br>
            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>

            <input type="hidden" name="id" value="<%=bean.getId()%>"> <input
                type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy"
                value="<%=bean.getModifiedBy()%>"> <input type="hidden"
                name="createdDatetime"
                value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime"
                value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <table>
                <tr>
                    <th>College*</th>
                    <td><%=HTMLUtility.getList("collegeId",
                    String.valueOf(bean.getCollegeId()),l)%></td>
                </tr>
                <tr>
                    <th>First Name*</th>
                    <td><input type="text" name="firstName"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th>Last Name*</th>
                    <td><input type="text" name="lastName"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th>Date of Birth (mm/dd/yyyy)*</th>
                    <td><input type="text" name="dob"
                        value="<%=DataUtility.getStringData(bean.getDob())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                    <th>Mobile*</th>
                    <td><input type="text" name="mobileNo"
                        value="<%=DataUtility.getStringData(bean.getMobileNo())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
                </tr>
                
                <tr>
                    <th>Email ID*</th>
                    <td><input type="text" name="email"
                        value="<%=DataUtility.getStringData(bean.getEmail())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("email", request)%></font></td>
                </tr>


                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=StudentCtl.OP_SAVE%>"> <%
     if (bean.getId() > 0) {
 %> &nbsp;<input type="submit" name="operation" class="btn btn-info"
                        value="<%=StudentCtl.OP_DELETE%>"> <%
     }
 %> </td>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>
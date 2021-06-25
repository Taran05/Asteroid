<%@page import="in.co.sunrays.project4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<title>User List</title>
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

    <%@include file="Header.jsp"%>

    <center>
        <h2>User List</h2>

        <form action="<%=ORSView.USER_LIST_CTL%>" method="post">

            <table width="100%">
                <tr>
                    <td align="center"><label>FirstName :</label> <input
                        type="text" name="firstName"
                        value="<%=ServletUtility.getParameter("firstName", request)%>">
                        &emsp; <label>LoginId:</label> <input type="text" name="login"
                        value="<%=ServletUtility.getParameter("login", request)%>">
                        &emsp; <input type="submit" name="operation" class="btn btn-info" value="<%=UserListCtl.OP_SEARCH %>">
                    </td>
                </tr>
            </table>
            <br>

            <table border="1" width="100%" class="table table-hover">
                <tr class="table" style="background-color: #E9ECEA;" align="center">
                    <th>Select</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>LoginId</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Edit</th>
                </tr>

               

                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<UserBean> it = list.iterator();
                    while (it.hasNext()) {
                        UserBean bean = it.next();
                %>
                <tr  class="table" style="background-color: ##FBFCFB;">
                    <td><input type="checkbox" name="ids" value="<%=bean.getId()%>"></td>
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getLogin()%></td>
                    <td><%=bean.getGender()%></td>
                    <td><%=bean.getDob()%></td>
                    <td><a href="UserCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
                 <tr>
                    <td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td ><input type="submit" name="operation"
                        value="<%=UserListCtl.OP_PREVIOUS%>"></td>
                     <td ><input type="submit"
                        name="operation" value="<%=UserListCtl.OP_DELETE%>"></td>
                     <td align="right"><input type="submit" name="operation"
                        value="<%=UserListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>
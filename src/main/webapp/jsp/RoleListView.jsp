<%@page import="in.co.sunrays.project4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.project4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.project4.bean.RoleBean"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<title>Role List</title>
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
        <h2>Role List</h2>
<br>
        <form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">
            <table width="100%">
                <tr>
                    <td align="center"><label>Name :</label> <input type="text"
                        name="name"
                        value="<%=ServletUtility.getParameter("name", request)%>">
                        &nbsp; <input type="submit" name="operation" class="btn btn-info" value="<%=RoleListCtl.OP_SEARCH %>">
                    </td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%" class="table table-hover">
                <tr class="table" style="background-color: #E9ECEA;" align="center">
                    <th>S.No.</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Descriptiop</th>
                    <th>Edit</th>
                </tr>
                

                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<RoleBean> it = list.iterator();
                    while (it.hasNext()) {
                        RoleBean bean = it.next();
                %>
                <tr class="table" style="background-color: ##FBFCFB;">
                    <td><%=index++%></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getDescription()%></td>
                    <td><a href="RoleCtl?id=<%=bean.getId()%>">Edit</a></td>
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
                    <td><input type="submit" name="operation" class="btn btn-info"
                        value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
                    <td></td>
                    <td align="right"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=RoleListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>
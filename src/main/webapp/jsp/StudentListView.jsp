<%@page import="in.co.sunrays.project4.controller.StudentListCtl"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="in.co.sunrays.project4.bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<title>Student List</title>
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
        <h2>Student List</h2>

        <form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">
            <table width="100%">
                <tr>
                    <td align="center"><label> FirstName :</label> <input
                        type="text" name="firstName"
                        value="<%=ServletUtility.getParameter("firstName", request)%>">
                        <label>&nbsp; LastName :</label> <input type="text" name="lastName"
                        value="<%=ServletUtility.getParameter("lastName", request)%>"><label>&nbsp; Email_Id
                            :</label> <input type="text" name="email"
                        value="<%=ServletUtility.getParameter("email", request)%>">&nbsp;
                        <input type="submit" name="operation" class="btn btn-info" value="<%=StudentListCtl.OP_SEARCH %>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%" class="table table-hover">
                <tr class="table" style="background-color: #E9ECEA;" align="center">
                    <th>S.No.</th>
                    <th>ID.</th>
                    <th>College.</th>
                    <th>First Name.</th>
                    <th>Last Name.</th>
                    <th>Date Of Birth.</th>
                    <th>Mobil No.</th>
                    <th>Email ID.</th>
                    <th>Edit</th>
                </tr>
                
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<StudentBean> it = list.iterator();

                    while (it.hasNext()) {

                        StudentBean bean = it.next();
                %>
                <tr class="table" style="background-color: ##FBFCFB;">
                    <td><%=index++%></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getCollegeId()%></td>
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getDob()%></td>
                    <td><%=bean.getMobileNo()%></td>
                    <td><%=bean.getEmail()%></td>
                    <td><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a></td>
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
                        value="<%=StudentListCtl.OP_PREVIOUS%>"></td>
                    <td align="right"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=StudentListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"><input
                type="hidden" name="pageSize" value="<%=pageSize%>">


        </form>
    </center>
</body>
</html>
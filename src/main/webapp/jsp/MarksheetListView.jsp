<%@page import="in.co.sunrays.project4.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.project4.controller.BaseCtl"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="in.co.sunrays.project4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<title>Marksheet List</title>
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
        <h2>Marksheet List</h2>

        <form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST">

            <table width="100%" >
                <tr>
                    <td align="center"><label> Name :</label> <input type="text"
                        name="name" 
                        value="<%=ServletUtility.getParameter("name", request)%>">
                        &emsp; <label>RollNo :</label> <input type="text" name="rollNo"
                        value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
                        <input type="submit" name="operation" class="btn btn-info" value="<%=MarksheetListCtl.OP_SEARCH %>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%" class="table table-hover">
                <tr class="table" style="background-color: #E9ECEA;" align="center">
                    <th>Select</th>
                    <th>ID</th>
                    <th>RollNo</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Percentage (%)</th>
                    <th>Edit</th>
                </tr>
                
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();

                    while (it.hasNext()) {

                        MarksheetBean bean = it.next();
                %>
                <tr class="table" style="background-color: ##FBFCFB;">
                    <td><input type="checkbox" name="ids" value="<%=bean.getId()%>"></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getRollNo()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getPhysics()%></td>
                    <td><%=bean.getChemistry()%></td>
                    <td><%=bean.getMaths()%></td>
                    <td><%=bean.getPercentage()%></td>
                    <td><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
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
                        value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
                    <td><input type="submit" name="operation" class="btn btn-info"
                        value="<%=MarksheetListCtl.OP_NEW%>"></td>
                    <td><input type="submit" class="btn btn-info"
                        name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=MarksheetListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>
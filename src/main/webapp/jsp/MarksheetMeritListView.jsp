<%@page import="in.co.sunrays.project4.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="in.co.sunrays.project4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<title>Marksheet Merit List</title>
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
        <h2>Marksheet Merit List</h2>

        <form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="POST">
            <br>
            
            <table border="1" width="100%" class="table table-hover">
            
                <tr class="table" style="background-color: #E9ECEA;" align="center">

                    <th>ID</th>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Percentage (%)</th>

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

                    <td><%=index++%></td>
                    <td><%=bean.getRollNo()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getPhysics()%></td>
                    <td><%=bean.getChemistry()%></td>
                    <td><%=bean.getMaths()%></td>
                    <td><%=bean.getPercentage()%></td>

                </tr>

                <%
                    }
                %>
                 <tr>
                    <td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
                </tr>
                            </table>
            <table>
                <tr>
                    <td align="right"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>
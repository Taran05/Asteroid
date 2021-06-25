<%@page import="in.co.sunrays.project4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.project4.utility.ServletUtility"%>
<%@page import="in.co.sunrays.project4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<title>College List</title>
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
        <h2>College List</h2>

        <form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST">

            <table width="100%">
                <tr>
                    <td align="center"><label> Name :</label> <input type="text"
                        name="name"
                        value="<%=ServletUtility.getParameter("name", request)%>">
                        <label>City :</label> <input type="text" name="city"
                        value="<%=ServletUtility.getParameter("city", request)%>">&nbsp;
                        <input type="submit" name="operation" class="btn btn-info"
                        value="<%=CollegeListCtl.OP_SEARCH%>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
                <tr class="table" style="background-color: #E9ECEA;" align="center">
                    <th>S.No.</th>
                    <th>ID.</th>
                    <th>Name.</th>
                    <th>Address.</th>
                    <th>State.</th>
                    <th>City.</th>
                    <th>PhoneNo.</th>
                    <th>Edit</th>
                </tr>
                
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<CollegeBean> it = list.iterator();

                    while (it.hasNext()) {

                        CollegeBean bean = it.next();
                %>
                <tr class="table" style="background-color: ##FBFCFB;">
                    <td><%=index++%></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getAddress()%></td>
                    <td><%=bean.getState()%></td>
                    <td><%=bean.getCity()%></td>
                    <td><%=bean.getPhoneNo()%></td>
                    <td><a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a></td>
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
                        value="<%=CollegeListCtl.OP_PREVIOUS%>"></td>
                    <td></td>
                    <td align="right"><input type="submit" name="operation" class="btn btn-info"
                        value="<%=CollegeListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
</body>
</html>
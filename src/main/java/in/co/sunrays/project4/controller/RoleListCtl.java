package in.co.sunrays.project4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.project4.bean.BaseBean;
import in.co.sunrays.project4.bean.RoleBean;
import in.co.sunrays.project4.exception.ApplicationException;
import in.co.sunrays.project4.model.RoleModel;
import in.co.sunrays.project4.utility.DataUtility;
import in.co.sunrays.project4.utility.PropertyReader;
import in.co.sunrays.project4.utility.ServletUtility;

@ WebServlet(name="RoleListCtl",urlPatterns={"/ctl/RoleListCtl"})
public class RoleListCtl extends BaseCtl{
	
	 private static Logger log = Logger.getLogger(RoleListCtl.class);
	 
	   @Override
	    protected BaseBean populateBean(HttpServletRequest request) {
	        RoleBean bean = new RoleBean();
	        bean.setName(DataUtility.getString(request.getParameter("name")));

	        return bean;
	    }
	   @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        log.debug("RoleListCtl doGet Start");
	        List list = null;
	        int pageNo = 1;
	        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
	        RoleBean bean = (RoleBean) populateBean(request);
	        String op = DataUtility.getString(request.getParameter("operation"));
	        RoleModel model = new RoleModel();
	        try {
	            list = model.search(bean, pageNo, pageSize);
	            ServletUtility.setList(list, request);
	            if (list == null || list.size() == 0) {
	                ServletUtility.setErrorMessage("No record found ", request);
	            }
	            ServletUtility.setList(list, request);
	            ServletUtility.setPageNo(pageNo, request);
	            ServletUtility.setPageSize(pageSize, request);
	            ServletUtility.forward(getView(), request, response);
	        } catch (ApplicationException e) {
	            log.error(e);
	            ServletUtility.handleException(e, request, response);
	            return;
	        }
	        log.debug("RoleListCtl doGet End");
	    }
	   
	   @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        log.debug("RoleListCtl doPost Start");
	        List list = null;
	        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
	        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
	        pageNo = (pageNo == 0) ? 1 : pageNo;
	        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;
	        RoleBean bean = (RoleBean) populateBean(request);
	        String op = DataUtility.getString(request.getParameter("operation"));

	        RoleModel model = new RoleModel();

	        try {

	            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)  || "Previous".equalsIgnoreCase(op)) {

	                if (OP_SEARCH.equalsIgnoreCase(op)) {
	                    pageNo = 1;
	                } else if (OP_NEXT.equalsIgnoreCase(op)) {
	                    pageNo++;
	                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
	                    pageNo--;
	                }

	            }
	            list = model.search(bean, pageNo, pageSize);
	            ServletUtility.setList(list, request);
	            if (list == null || list.size() == 0) {
	                ServletUtility.setErrorMessage("No record found ", request);
	            }
	            ServletUtility.setList(list, request);

	            ServletUtility.setPageNo(pageNo, request);
	            ServletUtility.setPageSize(pageSize, request);
	            ServletUtility.forward(getView(), request, response);

	        } catch (ApplicationException e) {
	            log.error(e);
	            ServletUtility.handleException(e, request, response);
	            return;
	        }
	        log.debug("RoleListCtl doPost End");
	    }

	    @Override
	    protected String getView() {
	        return ORSView.ROLE_LIST_VIEW;
	    }


	

}

package in.co.sunrays.project4.utility;

import java.util.Collections;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import in.co.sunrays.project4.bean.DropdownListBean;
import in.co.sunrays.project4.model.BaseModel;

public class HTMLUtility {
	

	  public static String getList(String name, String selectedVal,
	            HashMap<String, String> map) 
	  {
		  StringBuffer sb = new StringBuffer(
	                "<select class='form-control' name='" + name + "'>");

	        Set<String> keys = map.keySet();
	        String val = null;

	        for (String key : keys) {
	            val = map.get(key);
	            if (key.trim().equals(selectedVal)) {
	                sb.append("<option selected value='" + key + "'>" + val
	                        + "</option>");
	            } else {
	                sb.append("<option value='" + key + "'>" + val + "</option>");
	            }
	        }
	        sb.append("</select>");
	        return sb.toString();
	    }
	  
	  public static String getList(String name, String selectedVal, List list) {

	        Collections.sort(list);

	        List<DropdownListBean> dd = (List<DropdownListBean>) list;

	        StringBuffer sb = new StringBuffer(
	                "<select class='form-control' name='" + name + "'>");

	        String key = null;
	        String val = null;

	        for (DropdownListBean obj : dd) {
	            key = obj.getKey();
	            val = obj.getValue();

	            if (key.trim().equals(selectedVal)) {
	                sb.append("<option selected value='" + key + "'>" + val
	                        + "</option>");
	            } else {
	                sb.append("<option value='" + key + "'>" + val + "</option>");
	            }
	        }
	        sb.append("</select>");
	        return sb.toString();
	    }

	  public static String getInputErrorMessages(HttpServletRequest request) {

	        Enumeration<String> e = request.getAttributeNames();

	        StringBuffer sb = new StringBuffer("<UL>");
	        String name = null;

	        while (e.hasMoreElements()) {
	            name = e.nextElement();
	            if (name.startsWith("error.")) {
	                sb.append("<LI class='error'>" + request.getAttribute(name)
	                        + "</LI>");
	            }
	        }
	        sb.append("</UL>");
	        return sb.toString();
	    }
	  public static String getErrorMessage(HttpServletRequest request) {
	        String msg = ServletUtility.getErrorMessage(request);
	        if (!DataValidator.isNull(msg)) {
	            msg = "<p class='st-error-header'>" + msg + "</p>";
	        }
	        return msg;
	    }
	  public static String getSuccessMessage(HttpServletRequest request) {
	        String msg = ServletUtility.getSuccessMessage(request);
	        if (!DataValidator.isNull(msg)) {
	            msg = "<p class='st-success-header'>" + msg + "</p>";
	        }
	        return msg;
	    }
	  
	  public static String getSubmitButton(String label, boolean access,
	            HttpServletRequest request) {

	        String button = "";

	        if (access) {
	            button = "<input type='submit' name='operation'    value='" + label
	                    + "' >";
	        }
	        return button;
	    }

	    public static String getCommonFields(HttpServletRequest request) {

	        BaseModel model = ServletUtility.getModel(request);

	        StringBuffer sb = new StringBuffer();

	        sb.append("<input type='hidden' name='id' value=" + model.getId() + ">");
	        
	        return sb.toString();
	    }

	  
	  
	  
}

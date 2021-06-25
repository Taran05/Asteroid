package in.co.sunrays.project4.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.co.sunrays.project4.utility.ServletUtility;

@ WebServlet(name="FrontCtl",urlPatterns={"/ctl/*"})
public class FrontController implements Filter{
	
	public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(true);

        if (session.getAttribute("user") == null) {
            request.setAttribute("message","Your session has been expired. Please re-Login.");
            ServletUtility.forward(ORSView.LOGIN_CTL, request, response);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig conf) throws ServletException {
    }


}

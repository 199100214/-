package com.cq.filter;



import com.cq.pojo.SysUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        System.out.println("开始验证");
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String path = request.getServletPath();
        System.out.println(path);
        if("/view/login.jsp".equals(path) || "/login.do".equals(path)||"/index.jsp".equals(path)){
            chain.doFilter(request,response);//放行
        }else{
            HttpSession session = request.getSession();
            String user = (String) session.getAttribute("userCount");
            if (user != null){
                chain.doFilter(request,response);
            }else{
                System.out.println(request.getContextPath());
                response.sendRedirect(request.getContextPath()+"/view/login.jsp");
            }


        }





    }

    @Override
    public void destroy() {

    }
}

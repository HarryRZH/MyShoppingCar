package com.servlet;

import com.bean.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet",urlPatterns = "/register.do")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rname=request.getParameter("rname");
        String rpwd=request.getParameter("rpwd");
        String rpwd2=request.getParameter("rpwd2");
        String email=request.getParameter("email");
        UserBean userBean=new UserBean();
        HttpSession session=request.getSession();
        boolean isExit=false;
        if (rname==null||"".equals(rname.trim())||rpwd==null||"".equals(rpwd.trim())||
                rpwd2==null||"".equals(rpwd2.trim())||email==null||"".equals(email.trim())) {
            session.setAttribute("message", "请输入完整信息！");
            response.sendRedirect("jsp/login.jsp");
            return;
        }
        else {
            if (rpwd.equals(rpwd2)) {
                try {
                    isExit = userBean.isExist(rname);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (!isExit) {
                    userBean.addUser(rname, rpwd,email);
                    session.setAttribute("message", "注册成功！");
                    response.sendRedirect("jsp/login.jsp");
                    return;
                } else {
                    session.setAttribute("message", "用户名已存在！");
                    response.sendRedirect("jsp/login.jsp");
                    return;
                }
            } else {
                session.setAttribute("message", "两次输入密码不一致！");
                response.sendRedirect("jsp/login.jsp");
                return;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

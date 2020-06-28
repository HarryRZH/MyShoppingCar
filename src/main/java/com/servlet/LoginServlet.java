package com.servlet;

import com.bean.UserBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login.do")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isValid = false;
        HttpSession session = request.getSession();
        UserBean userBean = new UserBean();
        try {
            isValid = userBean.valid(username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (username == null || "".equals(username.trim()) || password == null || "".equals(password.trim())) {
            session.setAttribute("message", "用户名或密码不能为空！");
            response.sendRedirect("jsp/login.jsp");
            return;
        } else {
            if (isValid) {
                session.setAttribute("message", "登陆成功！");
                request.setAttribute("username", username);
                request.getRequestDispatcher("jsp/Index.jsp").forward(request, response);
                return;
            } else {
                session.setAttribute("message", "用户名或密码错误，请重新登陆！");
                response.sendRedirect("jsp/login.jsp");
                return;
            }
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request, response);
    }
}

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

@WebServlet(name = "FindPwdServlet", urlPatterns = "/findpwd.do")
public class FindPwdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("findname");
        String email = request.getParameter("findemail");
        String pwd = request.getParameter("findpwd");
        String pwd2 = request.getParameter("findpwd2");
        HttpSession session=request.getSession();
        boolean flag=false;
        UserBean userBean=new UserBean();
        if (uname == null || "".equals(uname.trim()) || email == null || "".equals(email.trim())
                || pwd == null || "".equals(pwd.trim()) || pwd2 == null || "".equals(pwd2.trim())) {
            session.setAttribute("message", "请输入完整信息！");
            response.sendRedirect("jsp/login.jsp");
            return;
        }else {
            if (!pwd.equals(pwd2)){
                session.setAttribute("message", "两次输入密码不一致！");
                response.sendRedirect("jsp/login.jsp");
                return;
            }else {
                try {
                    flag=userBean.findPwd(uname,email);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (flag){
                    try {
                        userBean.updPwd(uname,pwd);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    session.setAttribute("message", "密码找回成功！");
                    response.sendRedirect("jsp/login.jsp");
                    return;
                }else {
                    session.setAttribute("message", "用户名不存在！");
                    response.sendRedirect("jsp/login.jsp");
                    return;
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

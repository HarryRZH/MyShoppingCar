package com.servlet;

import com.bean.CarBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "AddCarServlet",urlPatterns = {"/addcar","/delcar"})
public class AddCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String gname=request.getParameter("gname");
        String uname=request.getParameter("uname");
        float price=0;
        boolean flag=false;
        CarBean carBean=new CarBean();
        ResultSet resultSet= carBean.SelGoods(gname);
        while (true){
            try {
                if (!resultSet.next()) break;
                else {
                    price=resultSet.getFloat("price");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        try {
            if (carBean.isExist(gname,uname)){
                flag=carBean.AddOne(gname,uname);
            }
            else{
                flag=carBean.AddCar(gname,price,uname);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (flag){
            session.setAttribute("message","商品已添加到购物车！");
            response.sendRedirect("jsp/Index.jsp?username="+uname);
        }
        else{
            session.setAttribute("message","商品添加失败！");
            response.sendRedirect("jsp/Index.jsp?username="+uname);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.endsWith("/delcar")) {
            try {
                delCar(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void delCar(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String gname=request.getParameter("gname");
        String uname=request.getParameter("uname");
        HttpSession session=request.getSession();
        boolean flag=false;
        CarBean carBean=new CarBean();
        //判断商品数量是否为1
        if (carBean.isCountity(gname,uname)){
            flag=carBean.DelCar(gname,uname);
        }else
            flag=carBean.DelOne(gname,uname);

        if (flag){
            session.setAttribute("message","删除成功！");
            response.sendRedirect("jsp/Index.jsp?username="+uname);
        }else{
            session.setAttribute("message","删除失败！");
            response.sendRedirect("jsp/Index.jsp?username="+uname);
        }

    }
}

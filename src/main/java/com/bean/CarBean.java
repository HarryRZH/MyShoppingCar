package com.bean;

import com.Dao.BaseDao;
import com.model.MyCar;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarBean {
    //查询我的购物车
    public List<MyCar> SelCar(String uname) throws SQLException {
        List<MyCar> list=new ArrayList<>();
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="select * from myCar where uname=?";
        Object[] params={uname};
        ResultSet rs=dao.getQuery(conn,sql,params);
        while (rs.next()){
            String name=rs.getString(1);
            float price=rs.getFloat(2);
            int countity=rs.getInt(3);
            MyCar myCar=new MyCar(name,price,countity);
            list.add(myCar);
        }
        return list;
    }
    //查询商品
    public ResultSet SelGoods(String gname){
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="select * from goods where gname=?";
        Object[] params={gname};
        ResultSet rs=dao.getQuery(conn,sql,params);
        return rs;
    }

    //查询用户的购物车中是否已存在该商品
    public boolean isExist (String gname,String uname)throws SQLException{
        boolean flag=false;
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        if(getconn!=null){
            String sql="select * from myCar where gname=? and uname=?";
            Object[] params={gname,uname};
            ResultSet resultSet=dao.getQuery(getconn,sql,params);
            if (resultSet.next())
                flag=true;
            dao.Closer();
        }
        return flag;
    }

    //购物车已存在商品数量加1
    public boolean AddOne(String gname,String uname){
        boolean flag=false;
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="update myCar set quantity=quantity+1 where gname=? and uname=?";
        Object[] params={gname,uname};
        int result=dao.undateExecute(conn,sql,params);
        if (result!=0)
            flag=true;
        dao.Closer();
        return flag;
    }

    //商品加入购物车
    public boolean AddCar(String gname,float price,String uname){
        boolean flag=false;
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="insert into myCar values (?,?,1,?)";
        Object[] params={gname,price,uname};
        int result=dao.undateExecute(conn,sql,params);
        if (result!=0)
            flag=true;
        dao.Closer();
        return flag;
    }

    //判断购物车中商品数量是否为1
    public boolean isCountity(String gname,String uname) throws SQLException {
        boolean flag=false;
        int countuty=0;
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="select * from myCar where gname=? and uname=?";
        Object[] params={gname,uname};
        ResultSet rs=dao.getQuery(conn,sql,params);
        while (rs.next())
            countuty=rs.getInt("quantity");
        if (countuty==1)
            flag=true;
        return flag;
    }

    //删除购物车商品
    public boolean DelCar(String gname,String uname){
        boolean flag=false;
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="delete from myCar where gname=? and uname=?";
        Object[] params={gname,uname};
        int result=dao.undateExecute(conn,sql,params);
        if (result!=0)
            flag=true;
        dao.Closer();
        return flag;
    }

    //购物车商品数量减1
    public boolean DelOne(String gname,String uname){
        boolean flag=false;
        BaseDao dao=new BaseDao();
        Connection conn=dao.getConn();
        String sql="update myCar set quantity=quantity-1 where gname=? and uname=?";
        Object[] params={gname,uname};
        int result=dao.undateExecute(conn,sql,params);
        if (result!=0)
            flag=true;
        dao.Closer();
        return flag;
    }
}

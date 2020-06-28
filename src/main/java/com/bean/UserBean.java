package com.bean;

import com.Dao.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserBean {
    //登录验证
    public boolean valid(String username,String password) throws SQLException {
        boolean isValid=false;
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        if (getconn!=null){
            String sql="select * from t_users where uname=? and pwd=?";
            Object[] params={username,password};
            ResultSet resultSet=dao.getQuery(getconn,sql,params);
            if (resultSet.next()){
                isValid=true;
            }
            dao.Closer();
        }
        return isValid;
    }
    //注册验证
    public boolean isExist(String username) throws SQLException {
        boolean isValid=false;
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        if(getconn!=null){
            String sql="select * from t_users where uname=?";
            Object[] params={username};
            ResultSet resultSet=dao.getQuery(getconn,sql,params);
            if (resultSet.next())
                isValid=true;
            dao.Closer();
        }
        return isValid;
    }
    //用户注册
    public boolean addUser(String uname,String pwd,String email){
        boolean isValid=false;
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="insert into t_users values(?,?,?)";
        Object[] params={uname,pwd,email};
        int result=dao.undateExecute(getconn,sql,params);
        if (result!=0)
            isValid=true;
        dao.Closer();
        return isValid;
    }
    //找回密码的验证
    public boolean findPwd(String username,String email) throws SQLException {
        boolean isValid=false;
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        if (getconn!=null){
            String sql="select * from t_users where uname=? and email=?";
            Object[] params={username,email};
            ResultSet resultSet=dao.getQuery(getconn,sql,params);
            if (resultSet.next()){
                isValid=true;
            }
            dao.Closer();
        }
        return isValid;
    }
    //找回密码的修改
    public void updPwd(String uname,String pwd) throws SQLException {
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="Update t_users set pwd=? where uname=?";
        Object[] params={pwd,uname};
        int result=dao.undateExecute(getconn,sql,params);
        System.out.println(result);
    }
}

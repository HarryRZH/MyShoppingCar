package com.Dao;


import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class BaseDao {
    private static String driver;
    private static String url;
    private static String userName;
    private static String passWord;
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    //静态码块 类在加载时对参数进行初始化
    static {
        Properties properties = new Properties();
        InputStream inputStream = com.Dao.BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver=properties.getProperty("jdbc.driver");
        url=properties.getProperty("jdbc.url");
        userName=properties.getProperty("jdbc.userName");
        passWord=properties.getProperty("jdbc.passWord");
    }

    //建立数据库的链接
    public  Connection getConn(){
//        Connection connection=null;
        try {
            Class.forName(driver);
            try {
                conn= DriverManager.getConnection(url,userName,passWord);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

    //数据查询
    public  ResultSet getQuery(Connection conn,String sql,Object[] params){
        try {
            ps = conn.prepareStatement(sql);
            for (int i=0;i<params.length;i++){
                ps.setObject(i+1,params[i]);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //增加删除修改
    public int undateExecute(Connection conn,String sql,Object[] params){
//        PreparedStatement preparedStatement =null;
        int result=0;
        try {
            ps=conn.prepareStatement(sql);
            for (int i=0;i<params.length;i++){
                ps.setObject(i+1,params[i]);
            }
            result=ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //关闭资源
    public void Closer(){
        if (conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps!=null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}

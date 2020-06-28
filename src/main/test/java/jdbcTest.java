import com.Dao.BaseDao;
import org.junit.Test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.Dao.BaseDao.*;

public class jdbcTest {
    //测试查询数据
    @Test
    public void testSel() throws SQLException {
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="select * from t_users where uname=?";
        Object[] params={"Harry"};//SQL查询语句参数
        ResultSet resultSet = dao.getQuery(getconn, sql, params);
        while (resultSet.next()){
            System.out.println(resultSet.getString(1));//返回查询数据的第一列内容
            System.out.println(resultSet.getString(2));//返回查询数据的第二列内容
            System.out.println(resultSet.getString("pwd"));//返回JOB字段内容
        }
    }
    @Test
    //测试修改数据
    public void testUpd() throws SQLException {
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="Update t_users set pwd=? where uname=?";
        Object[] params={123,"Harry"};
        int result=dao.undateExecute(getconn,sql,params);
        System.out.println(result);
        testSel();
    }

    @Test
    //测试添加数据
    public void testAdd() throws SQLException {
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="insert into t_users values (?,?)";
        Object[] params={"Peter",88888888};
        int result=dao.undateExecute(getconn,sql,params);
        System.out.println(result);
    }

    @Test
    //测试删除数据
    public void testDel() throws SQLException {
        BaseDao dao=new BaseDao();
        Connection getconn=dao.getConn();
        String sql="Delete from t_users where uname=?";
        Object[] params={"Peter"};
        int result=dao.undateExecute(getconn,sql,params);
        System.out.println(result);
    }
}

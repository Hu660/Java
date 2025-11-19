package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {
    private String driver;
    private String url;
    private String username;
    private String password;
    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // 构造方法，定义驱动程序连接用户名和密码信息
    public DBUtil() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/book?characterEncoding=utf8&serverTimezone=UTC";
        username = "root";
        password = "hhyytt2003";
    }

    // 获取连接对象
    private Connection getConnection() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    // 获取语句对象
    private PreparedStatement getPrepareStatement(String sql) {
        try {
            pstmt = getConnection().prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pstmt;
    }

    // 给 pstmt 的 SQL 语句设置参数(要求参数以数组形式给出)
    private void setParams(String sql, String[] params) {
        pstmt = this.getPrepareStatement(sql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                try {
                    pstmt.setString(i + 1, params[i]);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 执行数据库查询操作时,将返回的结果封装到 List 对象中
    public List<Map<String, String>> getList(String sql, String[] params) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        try {
            this.setParams(sql, params);
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                Map<String, String> m = new HashMap<String, String>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    String colName = rsmd.getColumnName(i);
                    m.put(colName, rs.getString(colName));
                }
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    // 执行数据库查询操作时,将返回的结果封装到 Map 对象中（单条记录）
    public Map<String, String> getMap(String sql, String[] params) {
        List<Map<String, String>> list = getList(sql, params);
        if (list.isEmpty())
            return null;
        else
            return (Map<String, String>) list.get(0);
    }

    // 更新数据库时调用的 update 方法
    public int update(String sql, String[] params) {
        int recNo = 0; // 表示受影响的记录行数
        try {
            setParams(sql, params); // 根据 sql 语句和 params,设置 pstmt 对象
            recNo = pstmt.executeUpdate(); // 执行更新操作
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return recNo;
    }

    // 关闭对象
    private void close() {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (SQLException e) {
        }
    }
}
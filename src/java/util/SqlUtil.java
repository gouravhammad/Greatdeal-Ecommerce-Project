package util;

import java.sql.*;

public class SqlUtil 
{
     public static Connection conn;
     public static Statement stmt;
     public static final String dbname="greatdeal";
     public static final String dburl="jdbc:mysql://localhost:3306/"+dbname;
     public static final String dbusername="root";
     public static final String dbpassword="root";
     
     public static void connectDB() throws ClassNotFoundException,SQLException
     {
         Class.forName("com.mysql.jdbc.Driver");
         conn=DriverManager.getConnection(dburl,dbusername,dbpassword);
         stmt=conn.createStatement();
     }
     
     public static int insert(String query) throws SQLException
     {
         int result = -1;
         
         if(query != "")
         {
            result = stmt.executeUpdate(query);
         }
         
         return result;
     }
     
     public static int update(String query) throws SQLException
     {
         int result = -1;
         
         if(query != "")
         {
            result = stmt.executeUpdate(query);
         }
         
         return result;
     }
     
     public static ResultSet read(String query) throws SQLException
     {
         ResultSet rs = null;
         
         if(query != "")
         {
            rs = stmt.executeQuery(query);
         }
         
         return rs;
     }
     
     public static int delete(String query) throws SQLException
     {
         int result = -1;
         
         if(query != "")
         {
            result = stmt.executeUpdate(query);
         }
         
         return result;
     }
     
     public static void close() throws SQLException
     {
         if(conn != null)
         {
             conn.close();
         }
         
         if(stmt != null)
         {
             stmt.close();
         }
     } 
}

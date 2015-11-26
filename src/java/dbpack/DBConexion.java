package dbpack;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Roberto
 */

//package PaqueteConexion;

//import com.mysql.jdbc.Connection;
import java.sql.*;


/**
*
* @author KevinArnold
*/
public class DBConexion {
    
   
 
 
   public  static Connection obtener()  {
       Connection cnx = null;
       try{
       Class.forName("com.mysql.jdbc.Driver");
       cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica","root","");
       //cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-azure-central-a.cloudapp.net:3306/as_c26c3d88c11515c","bccf366fda03ca","a391874c");
       } catch(ClassNotFoundException | SQLException e){
           System.out.println("Error: "+e.toString());
       }

       return cnx;
   }
   
   
     public static int countRows(Connection conn, String tableName) throws SQLException {
    // select the number of rows in the table
    Statement stmt = null;
    ResultSet rs = null;
    int rowCount = -1;
    try {
      stmt = conn.createStatement();
      rs = stmt.executeQuery("SELECT COUNT(*) FROM " + tableName);
      // get the number of rows from the result set
      rs.next();
      rowCount = rs.getInt(1);
    } finally {
      rs.close();
      stmt.close();
    }
    return rowCount;
  }
   
  
}
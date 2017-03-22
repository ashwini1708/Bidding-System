package bidding.util;

import java.sql.*;
  public class SQLite{
  
	  public static Connection c = null;
	  
	  public static Connection createConnection() throws SQLException {
    
    try {
      Class.forName("org.sqlite.JDBC");
      c = DriverManager.getConnection("jdbc:sqlite:bid.db");

      /*create a table in sql database BIDDING_SYSTEM*/
      
      String sqlCreate = "CREATE TABLE IF NOT EXISTS " + "BIDDING_SYSTEM"
    	        + "  (sellerid           VARCHAR(20),"
    	        + "   item            VARCHAR(100),"
    	        + "   category          VARCHAR(100),"
    	        + "   amount           INTEGER,"
      			+ "   status           VARCHAR(50),"
      		    + "   itemId     VARCHAR(200),"
    	        + "   maxbid INTEGER,"
    	        + "   winBidderId VARCHAR(20),"
      			+ "   duration INTEGER)";

    	Statement stmt = c.createStatement();
    	stmt.execute(sqlCreate);
      
    } catch ( Exception e ) {
      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
      System.exit(0);
    }
    

    System.out.println("Opened database successfully");
    return c;
    
	  }
  }

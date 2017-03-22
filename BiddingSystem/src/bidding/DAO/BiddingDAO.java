package bidding.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import javax.servlet.ServletContextEvent;

import bidding.Bean.SellerItem;
import bidding.util.SQLite;

public class BiddingDAO {

public static Connection conn = null;
	
/*-------updte the sale items in the database------ */
	public int addSeller(SellerItem addobj) {

		int checkstatus=0;										
		int flag=0;												
		int flag1=1;											
		int flag2=0;

		String sellerid ="";
		String item="";
		String category="";
		int amount=0;
		String itemId="";
		int maxbid=0;
		String winBidderId="";
		int duration=0;
		

		String pending="pending";

		PreparedStatement ps1 = null;
		ResultSet rs=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting database");
			e.printStackTrace();
		}

		
		sellerid =addobj.getSellerId();
		item=addobj.getItem();
		category=addobj.getCategory();
		amount=addobj.getAmount();
		itemId=addobj.getItemId();
		duration=addobj.getTimer();
	
	
		
	
	
						String sqla = "INSERT INTO BIDDING_SYSTEM VALUES(?,?,?,?,?,?,?,?,?)";

						try {
							ps1 = conn.prepareStatement(sqla);
							ps1.setString(1, sellerid);
							ps1.setString(2, item);
							ps1.setString(3, category);
							ps1.setInt(4, amount);
							ps1.setString(5, pending);
							ps1.setString(6, itemId);
							ps1.setInt(7, maxbid);
							ps1.setString(8, winBidderId);
							ps1.setInt(9, duration);
							checkstatus = ps1.executeUpdate();

						} catch (Exception e) {
							System.out.println("Caught exception in Inserting table");
							e.printStackTrace();
						}
					
				
			

		return checkstatus;
	}
	
	
	/*-------retrive the sale posts which match specific status------ */
	
	public ArrayList<SellerItem> retrieveBidderList(String status) {

		ArrayList<SellerItem> sellerList = new ArrayList<SellerItem>();
		SellerItem temp;

		PreparedStatement ps2=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting Database");
			e.printStackTrace();
		}


		String sqlr = "SELECT * FROM BIDDING_SYSTEM where status=?";

			
		try {
			ps2 = conn.prepareStatement(sqlr);
			ps2.setString(1, status);
			ResultSet rs = ps2.executeQuery();


			while (rs.next()) {

				temp = new SellerItem();
				temp.setSellerId(rs.getString(1));
				temp.setItem(rs.getString(2));
				temp.setCategory(rs.getString(3));
				temp.setAmount(rs.getInt(4));
				temp.setStatus(rs.getString(5));
				temp.setItemId(rs.getString(6));
				temp.setMaxbid(rs.getInt(7));
				temp.setWinBidderId(rs.getString(8));
				temp.setTimer(rs.getInt(9));
				sellerList.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellerList;
	}
	
	/*-------retrieve seller profit and update the status of the post------ */
	public ArrayList<SellerItem> retrieveSellerProfit(String status,String sellerId) {

		ArrayList<SellerItem> sellerList = new ArrayList<SellerItem>();
		SellerItem temp;

		PreparedStatement ps2=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting Database");
			e.printStackTrace();
		}


		String sqlr = "SELECT * FROM BIDDING_SYSTEM where status=? AND sellerid=?";

			
		try {
			ps2 = conn.prepareStatement(sqlr);
			ps2.setString(1, status);
			ps2.setString(2, sellerId);
			ResultSet rs = ps2.executeQuery();


			while (rs.next()) {

				temp = new SellerItem();
				temp.setSellerId(rs.getString(1));
				temp.setItem(rs.getString(2));
				temp.setCategory(rs.getString(3));
				temp.setAmount(rs.getInt(4));
				temp.setStatus(rs.getString(5));
				temp.setItemId(rs.getString(6));
				temp.setMaxbid(rs.getInt(7));
				temp.setWinBidderId(rs.getString(8));
				temp.setTimer(rs.getInt(9));
				sellerList.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellerList;
	}
	
	/*-------retrieve all items from database------ */
	public ArrayList<SellerItem> allitems() {

		ArrayList<SellerItem> sellerList = new ArrayList<SellerItem>();
		SellerItem temp;

		PreparedStatement ps2=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting Database");
			e.printStackTrace();
		}

		

		String sqlr = "SELECT * FROM BIDDING_SYSTEM ";

	
		try {
			ps2 = conn.prepareStatement(sqlr);
		
			ResultSet rs = ps2.executeQuery();

		
			while (rs.next()) {

				temp = new SellerItem();
				temp.setSellerId(rs.getString(1));
				temp.setItem(rs.getString(2));
				temp.setCategory(rs.getString(3));
				temp.setAmount(rs.getInt(4));
				temp.setStatus(rs.getString(5));
				temp.setItemId(rs.getString(6));
				temp.setMaxbid(rs.getInt(7));
				
				
				
				temp.setWinBidderId(rs.getString(8));
				temp.setTimer(rs.getInt(9));
				sellerList.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellerList;
	}

	/*-------updte the sale items in the database------ */
	public void updateSeller(String row,String status) {
		
		
		
		 int statusQ=0;
		 
		 PreparedStatement ps3 = null;

			try {
				conn = SQLite.createConnection();
			} catch (SQLException e) {
				System.out.println("Exception caught in connecting database");
				e.printStackTrace();
			}

			

			String sqla = "UPDATE BIDDING_SYSTEM SET Status=? WHERE itemID=?";

			try {
				ps3 = conn.prepareStatement(sqla);
				ps3.setString(1, status);
				ps3.setString(2, row);
				statusQ=ps3.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
	
	
	}
	
	/*-------update the status and winner bid when the sale ends------ */
	
	public void bidding(String row,int bidAmount,String winBidderId) {
			
		
			
			 String status="On Timer";
			 
			 int statusQ=0;
			 String uniqueID = UUID.randomUUID().toString();
			 
			 PreparedStatement ps3 = null;
			 PreparedStatement ps2 = null;
				try {
					conn = SQLite.createConnection();
				} catch (SQLException e) {
					System.out.println("Exception caught in connecting database");
					e.printStackTrace();
				}
	
				SellerItem temp;
				String sqlr = 
						"SELECT * FROM BIDDING_SYSTEM WHERE status=? AND itemId=?";


				
				try {
					ps2 = conn.prepareStatement(sqlr);
					ps2.setString(1, status);
					ps2.setString(2, row);
					ResultSet rs = ps2.executeQuery();

				
					while (rs.next()) {

						temp = new SellerItem();
						temp.setSellerId(rs.getString(1));
						temp.setItem(rs.getString(2));
						temp.setCategory(rs.getString(3));
						temp.setAmount(rs.getInt(4));
						temp.setStatus(rs.getString(5));
						temp.setItemId(rs.getString(6));
						temp.setMaxbid(rs.getInt(7));
						temp.setWinBidderId(rs.getString(8));
						temp.setTimer(rs.getInt(9));
						
						
						if(temp.getMaxbid()< bidAmount){
							
							System.out.println("updating");
							String sqla = "UPDATE BIDDING_SYSTEM SET maxbid=? , winBidderId=? WHERE itemID=?";
							
							try {
								ps3 = conn.prepareStatement(sqla);
								ps3.setInt(1, bidAmount);
								ps3.setString(2, winBidderId);
								ps3.setString(3, row);
								statusQ=ps3.executeUpdate();
								
							
							} catch (SQLException e) {
								e.printStackTrace();
							} 
							
							
							
							
							
						}
						
						
						
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				
		}
	
	
	/*-------starts the timer and change of state------ */
	public void startTimer(String row) throws InterruptedException {
			
			 PreparedStatement ps3 = null;
			 HashMap timerItems=new HashMap();
				
				try {
					conn = SQLite.createConnection();
				} catch (SQLException e) {
					System.out.println("Exception caught in connecting database");
					e.printStackTrace();
				}
	
				
				SellerItem temp;
				String sqla = "SELECT * FROM BIDDING_SYSTEM WHERE status=? AND itemId=?";
				try {
					ps3 = conn.prepareStatement(sqla);
					ps3.setString(1, "On Timer");
					ps3.setString(2, row);
				
							
					ResultSet rs = ps3.executeQuery();
					
					
					while (rs.next()) {

						temp = new SellerItem();
						temp.setSellerId(rs.getString(1));
						temp.setItem(rs.getString(2));
						temp.setCategory(rs.getString(3));
						temp.setAmount(rs.getInt(4));
						temp.setStatus(rs.getString(5));
						temp.setItemId(rs.getString(6));
						temp.setMaxbid(rs.getInt(7));
						temp.setWinBidderId(rs.getString(8));
						temp.setTimer(rs.getInt(9));
						String key=temp.getItemId();
						int value=temp.getTimer();
						
						if(!timerItems.containsKey(key))
							timerItems.put(key, value);
						
			
					
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				
				Iterator it = timerItems.entrySet().iterator();
			    while (it.hasNext()) {
			        Map.Entry pair = (Map.Entry)it.next();
			        
			        
			        remainder((String)pair.getKey(),(int)pair.getValue());
				
			    }
		}

	/*-------timer for each and every auction and calls the update method to update after timer ends------ */
	public void remainder(String row,int duration) throws InterruptedException {
		
		int timet= duration * 60; // Convert to seconds
	    long delay = timet * 1000;

	    do
	    {
	      int minutes = timet / 60;
	      int seconds = timet % 60;
	      System.out.println(minutes +" minute(s), " + seconds + " second(s)");
	      Thread.sleep(1000);
	      timet = timet - 1;
	      delay = delay - 1000;

	    }
	    while (delay != 0);
	    System.out.println("Time's Up!");
	    updateEndSale(row);
		
		

	}
	/*-------updte the sale items in the database after the timer has been stopped to expired------ */
	public void updateEndSale(String row) {
			
			
			 int statusQ=0;
			 
			 PreparedStatement ps3 = null;
	
				try {
					conn = SQLite.createConnection();
				} catch (SQLException e) {
					System.out.println("Exception caught in connecting database");
					e.printStackTrace();
				}
	
				
	
				String sqla = "UPDATE BIDDING_SYSTEM SET Status=? WHERE itemID=?";
	
				try {
					
					ps3 = conn.prepareStatement(sqla);
					ps3.setString(1, "EXPIRED");
					ps3.setString(2, row);
					statusQ=ps3.executeUpdate();
					
					ps3.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
		
		
		}
	/*-------retreive the sale items in the database which matched the sellerID------ */
	
	public ArrayList<SellerItem> retrieveSeller(String sellerId)  {
		
		ArrayList<SellerItem> sellerList = new ArrayList<SellerItem>();
		SellerItem temp;

		PreparedStatement ps2=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting Database");
			e.printStackTrace();
		}


		String sqlr = "SELECT * FROM BIDDING_SYSTEM WHERE sellerid=?";

			
		try {
			ps2 = conn.prepareStatement(sqlr);
			ps2.setString(1, sellerId);
			ResultSet rs = ps2.executeQuery();


			while (rs.next()) {

				temp = new SellerItem();
				temp.setSellerId(rs.getString(1));
				temp.setItem(rs.getString(2));
				temp.setCategory(rs.getString(3));
				temp.setAmount(rs.getInt(4));
				temp.setStatus(rs.getString(5));
				temp.setItemId(rs.getString(6));
				temp.setMaxbid(rs.getInt(7));
				temp.setWinBidderId(rs.getString(8));
				temp.setTimer(rs.getInt(9));
				sellerList.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellerList;
	}
	/*-------retrieve the items which matches the winnerbid to fetch his winning items----- */
public ArrayList<SellerItem> retrieveBidderItems(String bidderId)  {
		
		ArrayList<SellerItem> sellerList = new ArrayList<SellerItem>();
		SellerItem temp;

	
		PreparedStatement ps2=null;

		try {
			conn = SQLite.createConnection();
		} catch (SQLException e) {
			System.out.println("Exception caught in connecting Database");
			e.printStackTrace();
		}


		String sqlr = "SELECT * FROM BIDDING_SYSTEM WHERE winBidderId=? AND status=?";

			
		try {
			ps2 = conn.prepareStatement(sqlr);
			ps2.setString(1, bidderId);
			ps2.setString(2, "EXPIRED");
			ResultSet rs = ps2.executeQuery();



			while (rs.next()) {

				temp = new SellerItem();
				temp.setSellerId(rs.getString(1));
				temp.setItem(rs.getString(2));
				temp.setCategory(rs.getString(3));
				temp.setAmount(rs.getInt(4));
				temp.setStatus(rs.getString(5));
				temp.setItemId(rs.getString(6));
				temp.setMaxbid(rs.getInt(7));
				temp.setWinBidderId(rs.getString(8));
				temp.setTimer(rs.getInt(9));
				sellerList.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellerList;
	}
	
	
	
	
}

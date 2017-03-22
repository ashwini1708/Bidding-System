package bidding.controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import bidding.Bean.SellerItem;
import bidding.Bean.User;
import bidding.DAO.BiddingDAO;


/**
 * Servlet implementation class BiddingController
 */
@WebServlet("/BiddingController")
public class BiddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BiddingDAO objct = new BiddingDAO();
	SellerItem sellerObj=null;
	ArrayList<SellerItem> sList = new ArrayList<SellerItem>();  
	String sellerId="";
	String bidderId="";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BiddingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /*This function si for startTimer.
     * (non-Javadoc)
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		sList = objct.retrieveBidderList("READY FOR SALE");

		request.getSession().setAttribute("listvalue", sList);
		RequestDispatcher view1 = request.getRequestDispatcher("/jsp/startTimer.jsp");			
		view1.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		int checkstatus;														
		int status=0;	
		
		String jspPage = (String)request.getParameter("hidden");  
		String adminBtn= (String)request.getParameter("adminSubmit");
		String bidItems= (String)request.getParameter("bidder");
		String adminView= (String)request.getParameter("adminView");
		
		/*View seller posts which needs to be authorised
		 * 
		 */
		if(adminView!=null){
			 if(adminView.equalsIgnoreCase("viewSellerPost") ) {
					sList = objct.retrieveBidderList("pending");
	
					request.getSession().setAttribute("listvalue", sList);
					RequestDispatcher view1 = request.getRequestDispatcher("/jsp/AdminRini.jsp");			
					view1.forward(request, response);
				 
			 }
		}
		 
		 
		 
		 
		 else if(bidItems!=null){
			 
			 
			 /* display the items which are on timer for bidders*/
				 if(bidItems.equalsIgnoreCase("viewAuction")) {
				 
					sList = objct.retrieveBidderList("On Timer");
	
					request.getSession().setAttribute("listvalue", sList);
					RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewAuction.jsp");			
					view1.forward(request, response);
	
				
				 
			 } 
		 }
		 
		 else if(jspPage!=null){
			
			 /*This method checks if the respective customer is admin,
			  * seller or admin
			  * Login details are stored in User.newUser.
			  * */
			
				if(jspPage.equalsIgnoreCase("admin")) {

						String customer=request.getParameter("customer");
						
						String userName=request.getParameter("username");
						String password=request.getParameter("password");
						
						User newUser=new User();
						
						if(newUser.users.containsKey(userName)){
							String actualPassword=(String) newUser.users.get(userName);
							if(customer.equalsIgnoreCase("Rini")){
								
								if(userName.matches("(.*)Rini(.*)")){
								
								if(actualPassword .equals( password)){
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/Admin.jsp");			
									view1.forward(request, response);
								}
								
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								}
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								
								
							
							}
							/*if the customer is seller */
							else if(customer.equalsIgnoreCase("seller")){
								if(userName.matches("(.*)seller(.*)")){
									
								
									
								if(actualPassword .equals(password)){
									sellerId=userName;
									request.getSession().setAttribute("sId", sellerId);
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/Seller.jsp");			
									view1.forward(request, response);
								}
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								}
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								
								
								
							}
							/*---- if the customer is bidder ---*/
							else if(customer.equalsIgnoreCase("bidder")){
								if(userName.matches("(.*)bidder(.*)")){
								if(actualPassword .equals(password)){
									bidderId=userName;
									request.getSession().setAttribute("bId", bidderId);
									
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/Bidder.jsp");			
									view1.forward(request, response);
								}
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								}
								else{
									RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
									view1.forward(request, response);
							
									
								}
								
								
							}
						}
						
						else{
							RequestDispatcher view1 = request.getRequestDispatcher("/jsp/InvalidLogin.jsp");			
							view1.forward(request, response);
					
							
						}
						
						
				}
				
				/*This takes the itemId and the 
				 * amount bid by bidder
				 * and updates the database
				 * for the item he bid on
				  
				
				 */
			 
				else	if(jspPage.equalsIgnoreCase("bidReady")) {
							 
							 BiddingDAO biddingObj=new BiddingDAO();
								
								String[] srowvalues=request.getParameterValues("rows");
								
								
								
								for(int j=0;j<srowvalues.length;j++){
									
									String value =srowvalues[j];
									String sbidAmount=request.getParameter(srowvalues[j]);
									
									int bidAmount = Integer.parseInt(sbidAmount);
									
									
									biddingObj.bidding(srowvalues[j],bidAmount,bidderId);							
								}
								
								RequestDispatcher view1 = request.getRequestDispatcher("/jsp/MessageBidder.jsp");			
								view1.forward(request, response);
				
								
							 
			}
			/*This posts the auction page for the seller to input his details
			 * about the item and inserts the details into the database
			 
			 */
			 
			else  if(jspPage.equalsIgnoreCase("PostAuction")) {
				
			
	
				String item = request.getParameter("Item");
			
				String category = request.getParameter("Category");
			
				 String sduration=request.getParameter("Duration");
				 int duration = Integer.parseInt(sduration);
		
	
				String samount = request.getParameter("Amount");
				int amount = Integer.parseInt(samount);
	
				String uniqueID = UUID.randomUUID().toString();
				String winBidderId="";
			
				
				sellerObj=new SellerItem();
				
				sellerObj.setSellerId(sellerId);
				sellerObj.setItem(item);
				sellerObj.setCategory(category);
				sellerObj.setAmount(amount);
				sellerObj.setTimer(duration);
				sellerObj.setStatus("Pending");
				sellerObj.setItemId(uniqueID);
				sellerObj.setMaxbid(0);
				sellerObj.setWinBidderId(winBidderId);
				//sellerObj.setTimer(duration);
				
				checkstatus=objct.addSeller(sellerObj);
				
				/*
				 * 
				 * update the pages based on the result
				 */
				if(checkstatus!=0){
	
					RequestDispatcher add=request.getRequestDispatcher("jsp/SuccessSale.jsp");   
					add.forward(request,response);
					
				} else {
	
					RequestDispatcher cannotadd=request.getRequestDispatcher("jsp/InvalidPayee.jsp"); 
					cannotadd.forward(request,response);
	
				}
				
				
				
			
			}

			 
			/*-------calculate the profit for admin along with seller------- */
			
			else if(jspPage.equalsIgnoreCase("calculateProfit")){
				
				BiddingDAO profitObj=new BiddingDAO();
				
				sList = objct.retrieveBidderList("EXPIRED");
				for(int i=0;i<sList.size();i++){
					double baseAmount=sList.get(i).getAmount();
					double maxBid=sList.get(i).getMaxbid();
					
					
					double profit=maxBid+baseAmount;
					double riniShare= (0.05 * profit);
					
				
					
					sList.get(i).setRiniProfit(riniShare);
					sList.get(i).setProfit(profit);
					
				}
				request.getSession().setAttribute("listvalue", sList);
				RequestDispatcher view1 = request.getRequestDispatcher("/jsp/AdminProfit.jsp");   			//Displaying the payee details
				view1.forward(request, response);
	
			}
				
				/*-----calculates profit of the seller------*/
			else if(jspPage.equalsIgnoreCase("calculateProfitSeller")){
				
				BiddingDAO profitObj=new BiddingDAO();
				System.out.println("profit calculation!-----");
				sList = objct.retrieveSellerProfit("EXPIRED",sellerId);
				for(int i=0;i<sList.size();i++){
					double baseAmount=sList.get(i).getAmount();
					double maxBid=sList.get(i).getMaxbid();
					
					
					double profit=maxBid+baseAmount;
					double riniShare= (0.05 * profit);
					
					
					sList.get(i).setRiniProfit(riniShare);
					sList.get(i).setProfit(profit);
					
				}
				request.getSession().setAttribute("listvalue", sList);
				RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewEarningsSeller.jsp");   			//Displaying the payee details
				view1.forward(request, response);
	
			}
			 
			/*------view auctions for bidders-----*/
			else if(jspPage.equalsIgnoreCase("viewBidding")){
	
				
				 BiddingDAO viewObj=new BiddingDAO();
					
			
					sList = objct.retrieveBidderList("On Timer");
		
					request.getSession().setAttribute("listvalue", sList);
					RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewBiddingAdmin.jsp");   			//Displaying the payee details
					view1.forward(request, response);
	
			}
				 
				/*-----
				 *  accept the auction and set status to READY FOR SALE from pending
				 */
				 
			else if(jspPage.equalsIgnoreCase("acceptAuction")) {
					 
				
				
					 BiddingDAO acceptAuctionObj=new BiddingDAO();
					
						String[] srowvalues=request.getParameterValues("rows");
						String updatedStatus="READY FOR SALE";
						for(int j=0;j<srowvalues.length;j++){
							acceptAuctionObj.updateSeller(srowvalues[j],updatedStatus);							
						}
		
					
						sList = objct.retrieveBidderList("READY FOR SALE");
						
						request.getSession().setAttribute("listvalue", sList);
						RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewBiddingAdmin.jsp");   			
						view1.forward(request, response);
				 }
				 
		 //Start the timer at the specified time
			else if(jspPage.equalsIgnoreCase("startTimer")) {
				 
				 BiddingDAO startTimerObj=new BiddingDAO();
				
				 RequestDispatcher view1 = request.getRequestDispatcher("/jsp/MessageTimer.jsp");   			
				 view1.forward(request, response);
				 
			
				 String[] srowvalues=request.getParameterValues("rows");
					
					String updatedStatus="On Timer";
					for(int j=0;j<srowvalues.length;j++){
						startTimerObj.updateSeller(srowvalues[j],updatedStatus);							
					}

						
					for(int j=0;j<srowvalues.length;j++){
						try {
							startTimerObj.startTimer(srowvalues[j]);
						} catch (InterruptedException e) {
							
							e.printStackTrace();
						}							
					}

					
				

					
			 }
				/*-------view seller bids and its status-----*/
			else if(jspPage.equalsIgnoreCase("viewEarningsAndBids")) {	
			 	
				
				
				BiddingDAO profitObj=new BiddingDAO();
				System.out.println("view Seller earnings and bids");
				sList = objct.retrieveSeller(sellerId);
				
				request.getSession().setAttribute("listvalue", sList);
				RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewEarningsAndBids.jsp");   			//Displaying the payee details
				view1.forward(request, response);
			
			}
				
			/* view all the items won by the bidder ----*/	
			else if(jspPage.equalsIgnoreCase("viewItems")) {	
			 			
				BiddingDAO profitObj=new BiddingDAO();
				System.out.println("view bidderItems");
				sList = objct.retrieveBidderItems(bidderId);
				
				request.getSession().setAttribute("listvalue", sList);
				RequestDispatcher view1 = request.getRequestDispatcher("/jsp/viewBidderItems.jsp");   			//Displaying the payee details
				view1.forward(request, response);
			
			}
			
				
				
				
				
		 }
	}

	

}

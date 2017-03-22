# Bidding-System

Bidding System
setup:

•	Unzip the bidding_system file 
•	open the file in eclipse.(import ->General->Existing projects into workspace->Unzipped project file)



•	Tomcat inclusion in eclipse
		To create a Apache Tomcat server:
		In the Servers view, right-click and select New > Server. The Define a New Server wizard opens.
	
		In the Select the server type list, select the Tomcat server defined in the previous step.
		Tip: If you did not specify the Tomcat install directory, the Define a New Server wizard will prompt you for this information.

•	Project(Bidding system)->run as->run on server->choose the tomcat v7.0 server.
•	Include Tomcat v7.0.75 jar file in java classpath(Run Configurations->classpath->add external jar’s)
•	

Setup Sqlite-JDBC

•	setup sqlite-jdbc-3.8.11.2.jar.

•	Configure sqlite in classpath: 
•	Project(Bidding system)->Run as-> Run Configurations-> choose the server you are using(Tomcat apache v7.0)->user entries(click)->add external jars-> sqlite-jdbc-3.8.11.2.jar
•	JRE path configure: Project(Bidding system)->build path->configure buildpath->libraries->double click on the option which is having error->select alternate jre.
•	Project(Bidding system)->Properties->Java BuildPath->Libraries->Add external Jar’s-> add sqlite-jdbc-3.8.11.2.jar



Information:
All basic requirements mentioned in the email are satisfied.
Additional Bonus Points:
	Multiple applications/UI for Sellers, Bidders, and Admin.
	Creative graphical UIs 
	Able to provide more flexible features for Admin, Sellers and Bidders.	Making use of database technologies like SQL Server for persisting application 	data/information.
  Login.jsp is the executable file.


•	Login page allows customer to be admin, seller or bidder
•	Ui has been created using tsp and backend using java servlet and sqlite sql.
•	All the usernames and passwords of admin seller and bidder are stored in user.newuser hash map
•	Any updates to the login can be made to hashmap.
•	All inputs should be given in numbers for numerical fields.
•	Scrolling is available for the page where the data crosses the page.
•	Seller profit is minimal amount + max bid
•	Admin profit=0.05 * seller profit


Project specific Information:
1.	pending state: Seller posts the auction, which will stay in admin’s queue until it is authorized.
2.	READY FOR SALE state: once admin approves the auction, the post goes from pending to READY FOR SALE.
3.	On Timer: when admin starts the timer, the posts transition from Ready for sale state to ontimer state wherein the bidder can bid on the items in that available time.
4.	EXPIRED: when the posts are out of time set by seller, the posts goes from On Timer to Expired state after which profits are calculated.

admin(rini) page:

username: Rini
password:riniadmin

after successful login:
♣	home: this is a welcome screen to the admin
♣	viewsellerpost:this page displays all the items seller posted and ready to be authorized by admin.
♣	start timer: this page displays the authenticated seller posts and which are ready for auction. upon clicking the start timer button, the auction starts and posts will be available for bidders until the time set up seller.
♣	viewbidding: this page lists all the active/running auctions and all the bids currently placed on (if not then 0 is shown)
♣	calculate profit: this page displays the “expired” auctions with the profit of seller and rini (admin) share.


seller page:
username:seller1(format)
password:1seller(format)

after successful login:
♣	home: this is a welcome screen to the seller
♣	post auction: this page allows the seller to post the item and its details for auction.
♣	calculateprofitseller: this page displays the profits of the seller for all the auctions expired/completed.
♣	viewearningsandbids: this page displays the items posted by seller and its actions.



bidder page:
username:bidder1(format)
password:1bidder(format)

after successful login:
♣	home: this is a welcome screen to the bidder
♣	view auction: this page displays the available items on auctions(which are on timer).user can bid on the items interested(only integers)
♣	viewitems: this page displays the items the bidder currently won.

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bidding.Bean.SellerItem"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="javax.servlet.*"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Style.css" type="text/css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Rini Welcome</title>
</head>
<body class="news" style="background:#5F9EA0">
  <header>
   
   <%-- <div class="nav">
      <ul>
        <li class="home"><a href="<%= request.getContextPath() %>/jsp/Login.jsp" title="Home">Home</a></li>
         <li class="tutorials"><a href="<%= request.getContextPath() %>/jsp/viewBiddingAdmin.jsp" title="Home">view Bidding</a></li>
        <li class="tutorials"><a href="<%= request.getContextPath() %>/BiddingController" title="start_timer">Start Timer</a></li>
        <li class="about"><a href="<%= request.getContextPath() %>/jsp/AdminProfit.jsp" title="profits">Profits</a></li>
        
        <li class="contact"><a href="#">Contact</a></li>
      </ul>
    </div> --%>
   
   
    <!-- <h2>Welcome Rini!</h2>
   <ol> <li> <h4>To accept the seller Request to auction select seller posts and click on acceptAuction</h4></li>
    <li>    <h4>To view Bidding click on View Bidding</h4></li>
    <li> <h4>To view Profits click on CalculateProfit</h4></li>
    </ol>
        -->
      
    
    
  </header>
  
  <form   name="hidden" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
		
    
     <div id="mySidenav" class="sidenav">
      
        <li ><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Admin.jsp" title="Home">Home</a></li>
        <li ><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/BiddingController" title="start_timer">Start Timer</a></li>
      	<li> <input class="btn btn-default btn-lg btn-block"  type="SUBMIT" name="adminView" value="viewSellerPost"></input><!-- 	<input class="btn" type="SUBMIT" name="adminView" value="bidItem"></input> --></li>
       	<li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewBidding"></input></li>				
		<li> <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="calculateProfit"></input></li>
    	<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
    </div>
    
    
     <div class="centered">	
     
    
								<%	ArrayList vList = (ArrayList) request.getSession().getAttribute("listvalue");   
									Iterator itr = vList.iterator();  
									
									if (vList.size()!=0){
										
								%>	
								
							 <h5>Displays the Seller Posts for authentication</h5>		 
							<table border="border" class="table table-hover">		
							<thead>
								<tr>
								<th></th>
								<th>Seller ID</th>
								<th>Item</th>
								<th>Category</th>
								<th>Amount</th>
								<th>Status</th>
								<th>Item ID</th>
								
								
								</tr>
								</thead>
								  
								<%	while(itr.hasNext()) {
									
									bidding.Bean.SellerItem addobj=null;
									addobj=(bidding.Bean.SellerItem)itr.next();
								%>
								
								<tr>
								<td><input type="checkbox" name="rows" id="rows" value="<%=addobj.getItemId() %>" required></td>
								<td><%=addobj.getSellerId() %></td>
								<td><%=addobj.getItem() %></td>
								<td><%=addobj.getCategory() %></td>
								<td><%=addobj.getAmount() %></td>
								 <td><%=addobj.getStatus() %></td>
								<td><%=addobj.getItemId() %></td>
								
							<%-- 	<td><%=addobj.getPayeeaccno() %></td> --%>
								</tr>
								
								<% }
									
								%>
								
						</table>
						
						
						<input class="btn btn-info btn-block btn-lg round raised" type="SUBMIT" name="hidden" value="acceptAuction"></input>
										<!-- <button class="btn" type="submit" value="Submit">Sell Item</button> -->
										
										
							<% }else {
									
								%>
								 <div class="col-lg-12" style="text-align:center">
         							 <h2>No new Posts from Seller to Accept!</h2>
        						</div>
        						<% }
									
								%>
								
								
				<!-- 	<input class="btn btn-info btn-block btn-lg round raised" type="SUBMIT" name="hidden" value="viewBidding"></input>
						
						<input class="btn btn-info btn-block btn-lg round raised" type="SUBMIT" name="hidden" value="calculateProfit"></input>
				 -->						<!-- <button class="btn" type="submit" value="Submit">Manage Timer</button>	</form>		
						<input type="hidden" name="hidden" value="adminView">
						<input type="submit" name="Delete" value="Delete">
						 --> 
						 </div>
				</form>	
  
  
</body>
</html>
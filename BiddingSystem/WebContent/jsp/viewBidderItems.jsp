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
<title>View Earnings and Bids</title>
</head>
<body class="news" style="background:#5F9EA0">
  <!-- <header>
    <div class="nav">
      <ul>
        <li class="home"><a class="active" href="#">Home</a></li>
         <li class="tutorials"><a  href="viewAuction.jsp">View Biddings</a></li>
       
        <li class="about"><a href="#">Profits</a></li>
        
       
      </ul>
    </div>
  </header> -->
  
  <form   name="hidden" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
			
			
    
    <div id="mySidenav" class="sidenav">
       <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Bidder.jsp">Home</a></li>
        <li  style="list-style: none;">  <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="bidder" value="viewAuction"></li>
         <li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewItems"></input></li>				
		<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
    </div>
     <% 
  String bidderId=(String)request.getSession().getAttribute("bId");
  
  %>
  <div class="col-lg-12" style="text-align:center">
          <h2>Welcome <%=bidderId %></h2>
        </div>
  
    
     <div class="centered">
			
					
					
								
								<%	ArrayList vList = (ArrayList) request.getSession().getAttribute("listvalue");   
									Iterator itr = vList.iterator();  
									
									if(vList.size()!=0){
								%>		
								<h5>Displays the items won by you</h5>	 
								<table border="border" class="table table-hover">			
									<thead>	<tr>
										<th>Seller ID</th>
										<th>Item</th>
										<th>Category</th>
										<th>Minimal Amount</th>
										<th>Status</th>
										<th>Maximum Bid</th>
										</tr>
										</thead>
										  
										<%	while(itr.hasNext()) {
											
											bidding.Bean.SellerItem addobj=null;
											addobj=(bidding.Bean.SellerItem)itr.next();
										%>
										
										<tr>
										<td><%=addobj.getSellerId() %></td>
										<td><%=addobj.getItem() %></td>
										<td><%=addobj.getCategory() %></td>
										<td><%=addobj.getAmount() %></td>
										 <td><%=addobj.getStatus() %></td>
										<td><%=addobj.getMaxbid()  %></td>
										
									<%-- 	<td><%=addobj.getPayeeaccno() %></td> --%>
										</tr>
								
								<% }
								%>
								
							</table>
						
						<% }else { %>
								 <div class="col-lg-12" style="text-align:center">
         							 <h2>You haven't purchased any items !</h2>
        						</div>
        				<% } %>
								
						
			
					</div>	
				</form>	
  
  
</body>
</html>
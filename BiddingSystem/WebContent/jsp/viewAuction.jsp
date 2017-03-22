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
<title>View Auction</title>
</head>
<body class="news" style="background:#5F9EA0">
  <div class="container">
  <header>

    
  </header>
 <% 
  String bidderId=(String)request.getSession().getAttribute("bId");
  
  %>
  <div class="col-lg-12" style="text-align:center">
          <h2>Welcome <%=bidderId %></h2>
        </div>
  <form   name="hidden" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">


<div id="mySidenav" class="sidenav">
       <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Bidder.jsp">Home</a></li>
        <li  style="list-style: none;">  <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="bidder" value="viewAuction"></li>
         <li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewItems"></input></li>				
		<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
    </div>
    <div class="centered">


					

								<%	ArrayList vList = (ArrayList) request.getSession().getAttribute("listvalue");
									Iterator itr = vList.iterator();
									if(vList.size()!=0){

								%>
								<h5>Select the checkbox and enter a value to bid on an item</h5>
								<h4>**Total amount you will be paying at the end of the bidding(Minimal amount + Your Bid) **</h4>
				<table border="border" class="table table-hover">
				<thead>
								<tr>
								<th></th>
								
								<th>Item</th>
								<th>Category</th>
								<th>Minimal Amount</th>
								<th>Status</th>
								
								<th> Current Maximum Bid</th>
								<th>Your BID</th>
								

								</tr>
								</thead>

								<%	while(itr.hasNext()) {

									bidding.Bean.SellerItem addobj=null;
									addobj=(bidding.Bean.SellerItem)itr.next();
								%>

								<tr>
								<td><input type="checkbox" name="rows" id="rows" value="<%=addobj.getItemId() %>"  required></td>
								
								<td><%=addobj.getItem() %></td>
								<td><%=addobj.getCategory() %></td>
								<td><%=addobj.getAmount() %></td>
								 <td><%=addobj.getStatus() %></td>
								 <td><%=addobj.getMaxbid() %></td>
								<td><input type="number" name="<%=addobj.getItemId() %>"  ></td>
									<!-- <td><select name="bidAmount" id="bidAmount">
									  <option value="10">10</option>
									  <option value="20" >20</option>
									  <option value="50">50</option>
									   <option value="100">100</option>
									</select></td> -->
									<td><p id="demo"></p></td>
							<%-- 	<td><%=addobj.getPayeeaccno() %></td> --%>
								</tr>

								<% }
					
								%>
								
								<h4>*Bidding should be only integers!</h4>
					<input class="btn btn-default btn-lg btn-block"  type="hidden" name="hidden" value="bidReady" onclick="goToOther()"></input>
				 					<button class="btn btn-default btn-lg btn-block"  type="submit" value="Submit" onclick="goToOther()">Ready to Bid!</button>
					 	
						</table>
						<% }else {
									
								%>
								 <div class="col-lg-12" style="text-align:center">
         							 <h2>No available Auctions going on !</br> Come Back later!</h2>
        						</div>
        						<% }
									
								%>

					<!-- 		<input class="btn" type="SUBMIT" name="adminSubmit" value="startTimer"></input>
				 --> 	<!-- <input type="hidden" name="hidden" value="adminView">
						<input type="submit" name="Delete" value="Delete"> -->
</div>
				</form>
</div>

</body>
</html>
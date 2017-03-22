<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Style.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seller</title>

</head>
<body style="background:#5F9EA0">
 <header>
 
  <form  style="background:white"  name="bidItems" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
   
 <div id="mySidenav" class="sidenav">
        <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Seller.jsp">Home</a></li>
        <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/PostAuction.jsp">Post Auction</a></li>
              <li> <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="calculateProfitSeller"></input></li>
  
        <li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewEarningsAndBids"></input></li>				
		<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
      
    </div>
 
 
   <!-- <div class="container">
    <div class="nav nav-tabs"> 
      <ul>
        <li class="home"><a class="active" href="#">Home</a></li>
         <li class="tutorials"><a  href="PostAuction.html">Post Auction</a></li>
        <li class="tutorials"><a  href="#">View Earnings</a></li>
        <li class="contact"><a href="#">Contact</a></li>
      </ul>
    </div>
 -->
</div>
</form>
  </header>
  <% 
  String sellerId=(String)request.getSession().getAttribute("sId");
  
  %>
  <div class="col-lg-12" style="text-align:center">
          <h2>Welcome <%=sellerId %></h2>
        </div>
  
    <div class="centered">
   <div class="col-lg-12" style="text-align:center">
          <h2>Ready to sell Items??</h2>
        </div>
        
        <div >
			  <li>Home: Help Details </li>
			  <li>PostAuction: Post items for sale</li>
			  <li>calculateProfitseller:See earnings</li>
				<li>ViewEarningsandBids: Lists all your running auctions</li>
				
			</div>
        </div>
 

</body>
</html>

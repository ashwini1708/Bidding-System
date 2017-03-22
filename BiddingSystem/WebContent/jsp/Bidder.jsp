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
<title>Bidder</title>
</head>
<body style="background:#5F9EA0">
  <div class="container">
 <header>
 <form  style="background:white"  name="bidItems" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
 
   <div id="mySidenav" class="sidenav">
       <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Bidder.jsp">Home</a></li>
        <li  style="list-style: none;">  <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="bidder" value="viewAuction"></li>
         <li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewItems"></input></li>				
			<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
    </div>
    </form>
    
    <% 
  String bidderId=(String)request.getSession().getAttribute("bId");
  
  %>
  <div class="col-lg-12" style="text-align:center">
          <h2>Welcome <%=bidderId %></h2>
        </div>
    <form  class="centered" name="bidItems" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">

    <h2>Do you want to start bidding?</h2>
  <!--   <input class="btn btn-info btn-block btn-lg round raised" type="SUBMIT" name="bidder" value="viewAuction"></input>
	 -->	<!-- <input class="btn" type="SUBMIT" name="bidder" value="bidItem"></input> -->
	<!-- 	<button class="btn" type="submit" value="viewAuction">View Auction</button> -->


 <div >
			  <li>Home: Help Details </li>
			  <li>viewAuction: View all current/Running auctions</li>
			  <li>ViewItems:View items you won</li>
				
				
			</div>
    </form>

  </header>

</div>
</body>
</html>

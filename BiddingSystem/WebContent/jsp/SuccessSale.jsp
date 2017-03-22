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
<title>Insert title here</title>
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
    </form>
  </header>
<h2 align="center" class="centered">Successfully sent the information to Admin.</br>Once it is verified the item will go on sale!</h2>

</br>
</br>
<h3 align="center" >Do you wish to sell some more items?</br><a href="/BiddingSystem/jsp/PostAuction.jsp">Click here!</a></h3>

</body>
</html>

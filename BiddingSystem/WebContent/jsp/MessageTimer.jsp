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
<title>Message Timer</title>
</head>
<body style="background:#5F9EA0">
<header>
  <form  style="background:white"  name="bidItems" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
    
    <div id="mySidenav" class="sidenav">
      
        <li ><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Admin.jsp" title="Home">Home</a></li>
        <li ><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/BiddingController" title="start_timer">Start Timer</a></li>
    
    
      	<li> <input class="btn btn-default btn-lg btn-block"  type="SUBMIT" name="adminView" value="viewSellerPost"></input><!-- 	<input class="btn" type="SUBMIT" name="adminView" value="bidItem"></input> --></li>
       	<li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewBidding"></input></li>				
		<li> <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="calculateProfit"></input></li>
    	<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
   
    </div>
     </form>
    
    
  </header>
<h2 align="center" class="centered">Timer Has been successfully Started!</br>Item will be available to Bid till its respective time</h2>

</br>
</br>


</body>
</html>
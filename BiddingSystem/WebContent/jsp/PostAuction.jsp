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
  <div class="container">
<header>
<form  style="background:white"  name="bidItems" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()">
  
<div id="mySidenav" class="sidenav">
        <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Seller.jsp">Home</a></li>
        <li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="PostAuction.jsp">Post Auction</a></li>
        <li> <input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="calculateProfitSeller"></input></li>
      <li><input class="btn btn-default btn-lg btn-block" type="SUBMIT" name="hidden" value="viewEarningsAndBids"></input></li>				
	
	<li  style="list-style: none;"><a class="btn btn-default btn-lg btn-block" href="<%= request.getContextPath() %>/jsp/Login.jsp">Logout</a></li>
    
    </div>
</form>
  </header>
  <% 
  String sellerId=(String)request.getSession().getAttribute("sId");
  
  %>
  <div class="col-lg-12" style="text-align:center">
          <h2>Welcome <%=sellerId %></h2>
        </div>
<div id="contenttext" class="centered">

				<form style="background:white; padding-bottom:10px" action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()" >
          <div class="row" style="padding:30px;">
            <div class="col-lg-12">
              <h3 align="center">Enter Item Details</h3>
            </div>
          </div>
          <div class="form-group">
          <div class="row">
            <div class="col-lg-12" style="padding-bottom:5px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <label for="SellerId" class="control-label" >Seller ID:<span class="asteriskRed">*</span></label>
             </div>
             <div class="col-lg-3 col-lg-push-3">
               <input type="text" class="form-control" value=<%=sellerId %> onfocus="this.blur()"  id="SellerId" name="SellerId" placeholder="Enter seller id" style="width:100%;" autofocus>
                  </div>
            </div>
            <div class="col-lg-12" style="padding-bottom:5px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <label for="Item" class="control-label">Item:<span class="asteriskRed">*</span></label>
             </div>
             <div class="col-lg-3 col-lg-push-3">
               <input type="text" class="form-control" value="" id="Item" name="Item" placeholder="Enter item" style="width:100%;" autofocus>
                  </div>
            </div>
            <div class="col-lg-12" style="padding-bottom:5px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <label for="Category" class="control-label">Category:<span class="asteriskRed">*</span></label>
             </div>
             <div class="col-lg-3 col-lg-push-3">
               <input type="text" class="form-control" value="" id="Category" name="Category" placeholder="Enter category" style="width:100%;" autofocus>
                  </div>
            </div>
            <div class="col-lg-12" style="padding-bottom:10px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <label for="Amount" class="control-label">Amount:<span class="asteriskRed">*</span></label>
             </div>
             <div class="col-lg-3 col-lg-push-3">
               <input type="number" class="form-control" value="" id="Amount" name="Amount" placeholder="Enter amount" style="width:100%;" autofocus>
                  </div>
            </div>
            <div class="col-lg-12" style="padding-bottom:5px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <label for="Duration" class="control-label">Duration:<span class="asteriskRed">*</span></label>
             </div>
             <div class="col-lg-4 col-lg-push-3">
               <input type="number" class="form-control" value="" id="Duration" name="Duration" placeholder="Enter duration in minutes" style="width:100%;" autofocus>
                  </div>
            </div>
            <div class="col-lg-12" style="padding-top:15px">
              <div class="col-lg-2 col-lg-push-4">
<!--                 <div class="col-sm-12">-->
               <input type="hidden" name="hidden" value="PostAuction"></input>
             </div>
             <div class="col-lg-3 col-lg-push-4" style="padding-left:30px">
               <button style="padding-right:50px; padding-left:50px" class="btn btn-success" type="submit" value="Submit">Submit</button>
                  </div>
            </div>
        </div>
      </div>
				</form>
			</div>
</div>
</body>
</html>

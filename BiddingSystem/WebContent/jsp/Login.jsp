<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Style1.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bidding Login</title>


<script type="text/javascript">

function check(){
	
	//alert("val i s"+document.getElementById("customer"));
	if(!document.getElementById('customer').checked)
    {
    alert("check the field");
    }
	
	
}
//Username and password on focus events
function field_focus(field, value)
{
  if(field.value == value)
  {
    field.value = '';
  }
}

function field_blur(field, value)
{
  if(field.value == '')
  {
    field.value = value;
  }
}

//Fade in dashboard box
$(document).ready(function(){
  $('.box').hide().fadeIn(1000);
  });

//Stop click event
$('a').click(function(event){
  event.preventDefault();
	});

</script>
</head>


<body style="background:black">
<form action="<%= request.getContextPath() %>/BiddingController" method="post" onsubmit="return validate()" >

 <!-- <form method="post" action="index.html"> -->
 <div class="centered">
<div class="box">
<h1>Bidding Login</h1>
<form action="" >

  <div class="btn-group">
  <div class="col-lg-12" style="padding-right:50px">
  <div class="col-lg-4" style="padding:0px">
  <label class="btn btn-default btn-sm btn-lg round">
  <input type="radio" name="customer" value="Rini" id="customer"> Admin
  </label>
  </div>
  <div class="col-lg-4" style="padding:0px">
  <label class="btn btn-default btn-sm btn-lg round">
  <input type="radio" name="customer" value="seller" id="customer" > Seller
  </label>
  </div>
  <div class="col-lg-4" style="padding:0px">
  <label class="btn btn-default btn-sm btn-lg round">
  <input type="radio" name="customer" value="bidder" id="customer" checked="checked"> Bidder
  <label>
  </div>
  </div>
  </div>

</form>
<div class="col-lg-4">
</div>
<input type="username" name="username" value="username" onFocus="field_focus(this, 'username');" onblur="field_blur(this, 'username');" class="username" />

<input type="password" name="password" value="password" onFocus="field_focus(this, 'password');" onblur="field_blur(this, 'password');" class="password" />

  <input type="hidden" name="hidden" value="admin"></input>
										<button class="btn btn-primary" type="submit" value="Submit">Sign In</button>

<a href="#" class="btn btn-primary">Sign Up</a> <!-- End Btn2 -->

</div> <!-- End Box -->

</form>

<p>Forgot your password? <u style="color:#f1c40f;">Click Here!</u></p>
</div>
</body>
</html>

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
<style>li style="list-style: none;"
</style>
<title>Admin</title>
</head>
<body style="background:#111">
 <header>
   <center>
  

    
    
    
    
     <div class="centered">
      <div class="row">
        
        <div class="col-lg-7">
        <div class="col-lg-12" style="text-align:center">
          <h3>Invalid Login! Username or Password is incorrect!</br> <a href="<%= request.getContextPath() %>/jsp/Login.jsp" >Click here to return to Login page</a></h3>
        </div>
        <div class="col-lg-12">
          <h1>   </h1>
        </div>
     <!--    <div class="col-lg-12">
    	     <input class="btn btn-info btn-block btn-lg round raised" type="SUBMIT" name="adminView" value="viewSellerPost"></input>
		<input class="btn" type="SUBMIT" name="adminView" value="bidItem"></input>
        </div> -->
        </div>
      </div>

    
</center>
</div>
</div>
  </header>


</body>
</html>
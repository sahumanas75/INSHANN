<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Inshann Forgot Password Page</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link  rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
  

<style type="text/css">
input[type="text"],
select.form-control 
{
  background: transparent;
  border-radius: 20px;
  background-color: #1A84B4;
  color: white;
  height: 40px;

}
input[type="password"],
select.form-control 
{
  background: transparent;
  border-radius: 20px;
  background-color: #1A84B4;
  color: white;
  height: 40px;
}
.form-control::-webkit-input-placeholder
 { 
	color: white;
 } 
.input-group
{
	margin-top: 15px;
}
#button
{
	border-radius: 20px;
  background-color: #5A5A5A;
  color: white;
  font-family: sans-serif;
  height: 40px;
  font-size: 17px;
}
#fp
{
	margin-top: 20px;
	margin-left: 70px;
	font-family: sans-serif;
	font-size: 20px;
}
a
{
	color:#F2F61D;
}
body
{
	background-image: url("<c:url value='/resources/img/bric.png'/>");
	width: 100%;
}
</style>

<script>
	function passwordMatching()
	{
		var pwd=document.getElementById("password").value;
		
		var conPwd=document.getElementById("confirmPassword").value;
		
		if(pwd==conPwd)
		{
			document.getElementById("button").disabled=false;
			document.getElementById("msg").innerHTML ="";
		}
		if(pwd!=conPwd)
		{
			document.getElementById("button").disabled=true;
			document.getElementById("msg").innerHTML ="Your Password Is Not Matched..!!!";
		}
	}

</script>


</head>

<body>
<div class="container-fluid">
	<div class="row">

		<div class="col-md-4 col-md-offset-4" style="margin-top: 100px">
			<div style="margin-left:70px;">
				<p  id="msg" style="color:red;font-size: 17px;font-family: monospace;">${msg}</p>
			</div>
				<div class="im">
					<img src="<c:url value='/resources/img/log1.png' />" class="img-responsive img-circle center-block">
				</div>
			<div style="margin-top: 30px">	
				<c:url var="get" value="/user/forgotPassword"></c:url>
				<form:form action="${get}" modelAttribute="userDetails" method="POST">
						<div class="input-group">
  					  		<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
  							<input type="text" name="userName" class="form-control" placeholder="USERNAME" required="required" value="${usermanagement.userName}">
  					  </div>
  					  <div class="input-group">
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
   				 	  			<input type="password" name="password" id="password" class="form-control" placeholder="PASSWORD" required="required">
  					  </div>
  					   <div class="input-group">
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
   				 	  			<input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="CONFIRM PASSWORD"
   				 	  			 required="required" onkeyup="passwordMatching();">
  					  </div>
  					 <div style="margin-top: 20px">
					<button type="submit"  value="RESET" class="btn-block" id="button" name="action">RESET</button>
 					</div> 	
				</form:form>
  			</div>
		</div>
	</div>
</div>	
</body>
</html>
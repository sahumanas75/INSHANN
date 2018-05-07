<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Inshann Sign Up Page</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link  rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
	
<style>
body
{
	background-image: url("<c:url value='/resources/img/bric.png'/>");
	background-attachment:inherit;
}
#box
{
	width: 100%;
	height: auto;
	background:#2BB6E5;
	margin-top:15px;
	margin-bottom:10px;
	border-radius: 20px;
}
</style>
	
<script>
	function checkUserType()
	{
		var takeValue=document.getElementById("sel").value;
		if(takeValue=='')
		{
			document.getElementById("button").disabled=true;
		}
		else
		{
			document.getElementById("button").disabled=false;
		}
	}
	
	function checkAdharNum()
	{
		var takeValue=document.getElementById("adharNum").value;
		
		if(takeValue.length!=12)
		{
			document.getElementById("sel").disabled=true;
			document.getElementById("adh").innerHTML="Your Adhar Card No. Must Be 12 Digit";
		}
		else
		{
			document.getElementById("sel").disabled=false;
			document.getElementById("adh").innerHTML="";
			var count=0;
			for(i=0;i<takeValue.length;i++)
			{
				if(takeValue.charAt(i) >= 48 || takeValue.charAt(i) <= 57)
				{
					count++;
					if(count==12)
					{
						document.getElementById("adh").innerHTML="";
					}
					
				}
				else
				{
					document.getElementById("adh").innerHTML="Your Adhar Card No.(s) Are must be in didgit";
					document.getElementById("sel").disabled=true;
				}	
			}
		}
	}

	
	function checkLengthPassword()
	{
		var takeValue=document.getElementById("pwd").value;
		document.getElementById("msg").innerHTML="";
		
		if(takeValue.length < 8)
		{
			document.getElementById("sel").disabled=true;
			document.getElementById("pw").innerHTML="Password Length Should be atleast 8 Character";
		}
		else
		{
			document.getElementById("sel").disabled=false;
			document.getElementById("pw").innerHTML="";
		}
	}
	
	function showImgMsg()
	{
		alert("Please select a image file for your profile picture but less than 2 mb");
	}
	
</script>	
	
</head>
<body>
<div class="container-fluid">
	<div class="row">

		<div class="col-md-4 col-md-offset-4" style="margin-top:10px">
			<div style="margin-left:60px">
				<p id="msg" style="color:red;font-size: 17px;font-family: monospace;">${msg}</p>
			</div>
			<div style="margin-left:95px">
				<p id="msg" style="color:red;font-size: 17px;font-family: monospace;">${pmsg}</p>
			</div>
			<div style="margin-left:80px">
				<p id="adh" style="color:red;font-size: 17px;font-family: monospace;"></p>
			</div>
			<div style="margin-left:10px">
				<p id="pw" style="color:red;font-size: 17px;font-family: monospace;"></p>
			</div>
				<div class="im">
					<img src="<c:url value='/resources/img/log1.png' />" class="img-responsive img-circle center-block">
				</div>
			<div>	
				<c:url var="get" value="/user/insertUserDetails"></c:url>
				<form:form action="${get}" modelAttribute="userDetails" method="POST" enctype="multipart/form-data">
						<div class="input-group">
  					  		<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
  							<input type="text" name="userName" id="userName"  class="form-control" placeholder="USERNAME" required="required" value="${usermanagement.userName}">
  					  </div>
  					  
  					  <div class="input-group">
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
   				 	  			<input type="email" name="emailId" class="form-control" placeholder="EMAIL-ID" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
								       required="required" value="${usermanagement.emailId}">
  					  </div>
  					  
  					   <div class="input-group">
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-send"></span></span>
   				 	  			<input type="text" name="adharNum" id="adharNum" class="form-control" placeholder="AADHAR CARD NO."
   				 	  			maxlength="12"  required="required" onkeyup="checkAdharNum();" value="${usermanagement.adharNum}">
  					  </div>
						
						<div class="input-group">	
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
   				 	  			<input type="password" name="password" id="pwd" min="8" class="form-control" placeholder="PASSWORD" required="required" onkeyup="checkLengthPassword();">
  					  </div>
  					  <div class="input-group">	
  					  			<span class="input-group-addon"><span class="glyphicon glyphicon-camera"></span></span>
   				 	  			<input type="file" name="scanFile" id="photo" class="form-control" placeholder="Add profile picture" required="required" onclick="showImgMsg();">
  					  </div>
  					  
  					  <div>
  					  <div class="input-group">	
  					  		<span class="input-group-addon"><span class="glyphicon glyphicon-info-sign"></span></span>
  					  		<select class="form-control" name="userType" id="sel" onchange="checkUserType();">
        							<option value="">---SELECT USER TYPE---</option>
        							<option value="PROVIDE SERVICE">PROVIDE SERVICE</option>
        							<option value="TAKE SERVICE">TAKE SERVICE</option>
						     </select>
  					  </div>		
  					  </div>
  					  
  					  <div style="margin-top:10px">
					<button type="submit" value="Sign up" class="btn-block" id="button" name="action">Sign up</button>
 					 </div>	
				</form:form>
  			</div>
  				 	
				
				<div id="box">
					<div>
					<a href="#"><i class="fa  fa-facebook-square" style="font-size:40px;color:#3C5A9A;margin-left: 10px;float:left;margin-top: 3px">
					</i></a>
					<div class="fix"  style="">&nbsp;&nbsp;Sign Up From Facebook</div>
					</div>
					<a href="#"><i class="fa fa-google-plus-square" style="font-size:40px;color:#FFFFFF;margin-left: 10px;float:left;"></i></a>
					<div class="fix" style="">&nbsp;&nbsp;Sign Up From Google</div>
					</div>
				</div>
			
 	</div> 
</div>	
	<script>
		(function autoInvoke()
		{
			document.getElementById("button").disabled=true;
		}());
	</script>	
</body>
</html>

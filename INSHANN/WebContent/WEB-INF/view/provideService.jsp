<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Inshann Provide Service Page</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
		.jumbotron
		{
			text-align: center ;
			background-color: #1A84B4;
			color: white;
			padding:30px;
			height: 30px;
		}
		h3
		{
			font-size: 30px;
			margin:-10px; 
		}
		.control-label
		{
			color:#1A84B4;
		}
		#button
		{
			border-radius: 10px;
  			background-color: #1A84B4;
  			color: white;
  			font-family: sans-serif;
  			height: 40px;
  			font-size: 17px;
  			width: 120px;
		}
		nav
		{
			font-size: 25px;
			word-spacing: 200px;
			margin-top: 5px;
			background-color: black;
			border-radius:5px;
		}
		nav,a
		{
			line-height: 55px;
			color:#ffffff;
		}
		.fa
		{
			font-size: 25px;
			
		}	
		body
		{	
			background-image: url("<c:url value='/resources/img/bric.png'/>");
			background-attachment:inherit;
		}
	</style>

	<script>
	function checkNeedType()
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
	
	</script>


</head>
<body>
<% String username = (String) session.getAttribute("userName");
		if (null == username) {
			   response.sendRedirect("/INSHANN/user/logOut");
			}
%>
	<div class="container-fluid">
		<nav class="nav">
			<div style="margin-left: 80px;">
				<a href="<c:url value='/manageServices/users'/>"><i class="glyphicon glyphicon-user" data-toggle="tooltip" data-placement="right" title="User Profile" aria-hidden="true"></i></a>
				<a href="<c:url value='/manageServices/send'/>"><span class="glyphicon glyphicon-send" data-toggle="tooltip" data-placement="right" title="Messages"></span></a>
				<a href="<c:url value='/manageServices/homePage'/>" class="active"><span class="glyphicon glyphicon-home" data-toggle="tooltip" data-placement="right" title="Home Page"></span></a>
				<a href="<c:url value='/manageServices/envelope'/>"><span class="glyphicon glyphicon-envelope" data-toggle="tooltip" data-placement="right" title="Mails"></span></a>
				<a href="<c:url value='/manageServices/backToProvide'/>"><span class="glyphicon glyphicon-backward" data-toggle="tooltip" data-placement="top" title="Back"></span></a>
				<a href="<c:url value='/user/logOut'/>"><span class="glyphicon glyphicon-log-out" data-toggle="tooltip" data-placement="top" title="User Logout"></span></a>
				</div>
		</nav>
	
	
		<div class="jumbotron">
			<h3>HIRE-INSHAANS</h3>
		</div>	
	</div>		
			<div class="row">
				<div class="col-md-5 col-md-offset-4">
				<div style="margin-left:95px">
				<p style="color:green;font-size: 17px;font-family: monospace;">${msg}</p>
				</div>
				<table>
				<c:url var="get" value="/manageServices/addHireDetails"></c:url>
					<form:form class="form-horizontal" method="POST" action="${get}" modelAttribute="hireDetails">
  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> Your need:</label>
   							<div class="col-md-9">
    					 		<select class="form-control" name="need" id="sel" onchange="checkNeedType();">
        							<option value="">---SELECT YOUR NEED---</option>
        							<option value="JAVA">JAVA DEVELOPER</option>
        							<option value="FRONTEND">FRONTEND DEVELOPEMENT</option>
        							<option value="BACKEND">BACKEND DEVELOPEMENT</option>
        							<option value="PYTHON">PYTHON DEVELOPEMENT</option>
        							<option value="ANDROID">ANDROID DEVELOPER</option>
        							<option value="iOS">iOS DEVELOPER</option>
        							<option value="FULLSTACK">FULLSTACK DEVELOPER</option>
        							<option value="WEB-DEVELOPER">WEB DEVELOPER</option>
        							<option value="UI/UX">UI/UX DEVELOPER</option>
        							<option value="WEB-DEVELOPEMENT">WEB DEVELOPEMENT</option>
        							<option value="SAP">SAP DEVELOPEMENT</option>
        							<option value="BIGDATA">BIGDATA AND HADOOP</option>
        							<option value="MACHINE LEARNING">MACHINE LEARNING</option>
        							<option value="NLP">NATURAL LANGUAGE PROCESSING</option>
        							<option value=".NET">.NET DEVELOPEMENT</option>
        							<option value="SYSTEM ADMINSTRATOR">SYSTEM ADMINSTRATOR</option>
        							<option value="LINUX DEVELOPER">LINUX DEVELOPER</option>
        							<option value="IT OFFICIER">IT OFFICIER</option>
        							<option value="OTHERS">OTHERS</option>
						    	 </select>
   						 	</div>
  						</div>
  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> For:(Maximum 255 characters only)</label>
   							<div class="col-md-9">
    					 		<textarea  class="form-control" name="forWhat" rows="2" cols="2" style="resize:none"  required="required" maxlength="255"></textarea>
   						 	</div>
  						</div>
  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> Price:</label>
   							<div class="col-md-9">
    					 		<input type="text"  name="price" class="form-control" id=""  required="required">
   						 	</div>
  						</div>
  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> Duration:</label>
   							<div class="col-md-9">
    					 		<input type="text" name="duration" class="form-control" id=""  required="required">
   						 	</div>
  						</div>

  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> Description:(Maximum 1500 characters only)</label>
   							<div class="col-md-9">
    					 		<textarea  class="form-control" name="description" rows="3" cols="3" style="resize:none"  required="required" maxlength="1500"></textarea>
   						 	</div>
  						</div>
  						<div class="form-group row">
  							<label class="control-label col-md-9"><span class="glyphicon glyphicon-send"></span> Location:</label>
   							<div class="col-md-9">
    					 		<input type="text" name="location" class="form-control" id=""  required="required">
   						 	</div>
  						</div>
  						<div style="margin-top: 20px;margin-left: 135px">
						<input type="submit" name="action" value="Submit" class="btn-info" id="button"  required="required">
						</div>
  					</form:form>
  					</table>
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
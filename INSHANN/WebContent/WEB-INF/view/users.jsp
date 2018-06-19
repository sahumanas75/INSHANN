<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>User Details Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
nav {
	font-size: 25px;
	word-spacing: 200px;
	margin-top: 5px;
	background-color: black;
	border-radius: 5px;
}

nav, a {
	line-height: 55px;
	color: #ffffff;
}

.fa {
	font-size: 25px;
}

body {
	background-image: url("<c:url value='/resources/img/bric.png'/>");
	height: auto;
}

.Box {
	width: 600px;
	height: 500px;
	background-color: rgba();
	box-shadow: 3px 3px 30px 3px grey;
	margin-top: px;
	font-size: 17px;
	border-radius: 20px;
	overflow: hidden;
	border: 2px solid;
	border-color: #1A84B4;
}

.img-circle {
	margin-top: 15px;
	height: 150px;
	width: 200px;
}

.jumbotron {
	text-align: center;
	background-color: #1A84B4;
	color: white;
	padding: 30px;
	height: 30px;
}

h3 {
	font-size: 25px;
	margin: -10px;
}

.form-horizontal {
	margin-top: 10px;
}

.control-label {
	margin-left: 30px;
	margin-top: 5px;
	color: #1A84B4;
}

.form-control {
	
}

textarea {
	resize: none;
	overflow-wrap: break-word;
}

input[type="text"], select.form-control {
	background: transparent;
	border-radius: 20px;
	background-color: #1A84B4;
	color: #1A84B4;
	height: 35px;
	font-size: 16px;
	border-color: #1A84B4;
}
</style>


</head>
<body>
	<%
		String username = (String) session.getAttribute("userName");
		if (null == username) {
			response.sendRedirect("/INSHANN/user/logOut");
		}
	%>
	<div class="container-fluid">
		<nav class="nav">
			<div style="margin-left: 80px;">
				<a href="<c:url value='/manageServices/users'/>"><i
					class="glyphicon glyphicon-user" data-toggle="tooltip"
					data-placement="right" title="User Profile" aria-hidden="true"></i></a>
				<a href="<c:url value='/manageServices/send'/>"><span
					class="glyphicon glyphicon-send" data-toggle="tooltip"
					data-placement="right" title="Messages"></span></a> <a
					href="<c:url value='/manageServices/homePage'/>" class="active"><span
					class="glyphicon glyphicon-home" data-toggle="tooltip"
					data-placement="right" title="Home Page"></span></a> <a
					href="<c:url value='/manageServices/envelope'/>"><span
					class="glyphicon glyphicon-envelope" data-toggle="tooltip"
					data-placement="right" title="Mails"></span></a> <a
					href="<c:url value='/manageServices/backToProvide'/>"><span
					class="glyphicon glyphicon-backward" data-toggle="tooltip"
					data-placement="top" title="Back"></span></a> <a
					href="<c:url value='/user/logOut'/>"><span
					class="glyphicon glyphicon-log-out" data-toggle="tooltip"
					data-placement="top" title="User Logout"></span></a>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
		<div class="jumbotron">
			<h3>INSHAAN'S-USERS-DETAILS</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-3">
				<div style="margin-left: 95px">
					<p style="color: green; font-size: 17px; font-family: monospace;">${msg}</p>
				</div>
				<div class="Box">
					<div class="image">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<img src="<c:url value='/manageServices/profileImage'/>"
										class="img-circle img-responsive">
								</div>
							</div>
						</div>
					</div>

					<form:form class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-md-3 text-right">Username
								:</label>
							<div class="col-md-6 col-md-offset-0">
								<input type="text" name="userName" class="form-control" id=""
									readonly="readonly" value="${usermanagement.userName}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 text-right">Password
								:</label>
							<div class="col-md-6 col-md-offset-0">
								<input type="text" name="password" class="form-control" id=""
									readonly="readonly" value="${usermanagement.password}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 text-right">Email-id
								:</label>
							<div class="col-md-6 col-md-offset-0">
								<input type="text" name="emailId" class="form-control" id=""
									readonly="readonly" value="${usermanagement.emailId}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 text-right">Aadhar
								No. :</label>
							<div class="col-md-6 col-md-offset-0">
								<input type="text" name="adharNum" class="form-control"
									readonly="readonly" value="${usermanagement.adharNum}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 text-right">About
								You :</label>
							<div class="col-md-6 col-md-offset-0">
								<textarea cols="29" name="aboutYou" rows="4"
									class="form-control"
									style="border-color: #1A84B4; border-radius: 5px;"
									readonly="readonly"><c:out
										value="${information.aboutYou}"></c:out></textarea>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
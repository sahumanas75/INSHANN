<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>No Title Page</title>
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
	<div class="container">
		<h2 style="color: red; align-content: center; font-size: 20px">${msg}</h2>
	</div>
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Inshann Show Ad Page</title>
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


<style type="text/css">
.jumbotron {
	text-align: center;
	background-color: #1A84B4;
	color: white;
	padding: 30px;
	height: 30px;
}

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

h3 {
	font-size: 30px;
	margin: -10px;
}

.Box1 {
	width: 500px;
	height: 200px;
	background-color: rgba();
	box-shadow: 3px 3px 30px 3px grey;
	overflow: scroll;
	margin-top: 25px;
	color: #1A84B4;
	text-align: center;
	font-size: 17px;
	margin-bottom: 20px;
	overflow-wrap: break-word;
}

body {
	background-image: url("<c:url value='/resources/img/bric.png'/>");
	height: auto;
}
</style>

<script>
	function showFullInfo() {
		var adId = document.getElementsByClassName("aId");

		alert(adId);
	}
</script>

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
			<div class="row">
				<h3>HIRE-INSHAANS</h3>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div style="margin-left: 95px">
					<p style="color: green; font-size: 17px; font-family: monospace;">${msg}</p>
				</div>
			</div>
			<c:forEach var="pService" items="${provideService}">
				<c:url var="get" value="/manageServices/showFullDetails"></c:url>
				<form:form action="${get}" method="POST"
					modelAttribute="applyingForm">
					<div class="col-md-6">
						<div class="Box1">

							<div class="glyphicon glyphicon-briefcase"
								style="margin-top: 5px;">
								<table>
									<tr>
										<td>${pService.forWhat}</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
							</div>
							<br />
							<div class="glyphicon glyphicon-map-marker">
								<table>
									<tr>
										<td>${pService.location}</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
							</div>
							<br />
							<div class="glyphicon glyphicon-education">
								<table>
									<tr>
										<td>${pService.need}</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
							</div>
							<br />
							<div>
								<span class="fa fa-inr" style="font-size: 20px">
									${pService.price}</span>
							</div>
							<br>
							<div>
								<span class="glyphicon glyphicon-hourglass">${pService.duration}</span>
							</div>
							<div>
								<input type="hidden" name="id" class="aId"
									value="${pService.id}"> <input type="hidden"
									name="userType" value="${userType}">
							</div>
							<div style="margin-top: 20px; margin-bottom: 15px">
								<button type="submit" value="${pService.id}"
									class="btn btn-primary" name="action">View</button>
							</div>
						</div>
					</div>
				</form:form>
			</c:forEach>
		</div>
	</div>
</body>
</html>
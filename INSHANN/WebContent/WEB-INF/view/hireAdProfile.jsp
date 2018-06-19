<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Inshann Hire Ad Page</title>
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
</head>
<style>
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

.box {
	width: 350px;
	height: 100px;
	background-color: rgba();
	box-shadow: 3px 3px 30px 3px grey;
	overflow: hidden;
	text-align: center;
	color: #1A84B4;
	font-weight: bold;
	font-size: 18px;
	font-family: monospace;
	overflow-wrap: break-word;
}

body {
	background-image: url("<c:url value='/resources/img/bric.png'/>");
}

.txtBox {
	text-align: center;
	margin-right: 10px;
	width: 200px;
	height: 45px;
	border-radius: 15px;
	color: white;
	background-color: #5A5A5A;
	font-weight: bold;
}

.control-label {
	color: #1A84B4;
	font-size: 20px;
}

.txtBox1 {
	text-align: center;
	margin-right: 10px;
	width: 150px;
	height: 45px;
	border-radius: 15px;
	color: white;
	background-color: #5A5A5A;
	font-weight: bold;
}

.btn {
	background-color: #5A5A5A;
	text-align: center;
	margin-right: 60px;
	margin-left: 32px;
	font-weight: bold;
	border-radius: 15px;
	height: 35px;
}
</style>

<body>
	<%
		String username = (String) session.getAttribute("userName");
		if (null == username) {
			response.sendRedirect("/INSHANN/user/logOut");
		}
		String userType = (String) session.getAttribute("userType");
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
			<h3>HIRE-PROFILE</h3>
		</div>
	</div>
	<c:url var="get" value="/manageServices/showPersonalInfoForm"></c:url>
	<form:form action="${get}" method="POST" modelAttribute="applyingForm">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div style="margin-left: 45px">
						<p style="color: red; font-size: 17px; font-family: monospace;">${msg}</p>
					</div>
					<div class="box">${pService.forWhat}</div>
					<div style="margin-top: 30px">
						<table>
							<tr>
								<td><input type="text" readonly="readonly"
									value="${pService.need}" class="txtBox"></td>
								<td><button type="button" class="txtBox">
										<span class="fa fa-inr" style="font-size: 18px"> BUDGET
											: ${pService.price}</span>
									</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-4">
					<div style="margin-top: 10px">
						<div class="form-group row">
							<label class="control-label col-md-9"><span
								class="glyphicon glyphicon-send"></span> Description:</label>
							<div class="col-md-9">
								<textarea class="form-control" cols="10" rows="5"
									style="resize: none; background: #5A5A5A; color: white"
									readonly="readonly"><c:out
										value="${pService.description}" /></textarea>
							</div>
						</div>
					</div>

					<div style="margin-top: 20px; margin-left: 110px;">
						<table>
							<tr>
								<td><input type="text" readonly="readonly"
									value="Duration: ${pService.duration}" class="txtBox"
									style="background-color: #1A84B4; font-size: 18px"></td>
							</tr>
						</table>
					</div>
					<div style="margin-top: 15px;">
						<table>
							<tr>
								<td><a href="#" class="btn btn-info">Send Message</a></td>
								<td><a href="#" class="btn btn-info">Send Mail</a></td>

								<td><input type="hidden" name="id" value="${pService.id}"></td>
								<td><input type="hidden" name="userName"
									value="${userName}"></td>
								<td><input type="hidden" name="userName" value="${msg}"
									id="checkMsg"></td>
							</tr>
						</table>
					</div>

					<div style="margin-top: 15px; margin-left: 100px;">
						<table>
							<tr>
								<c:choose>
									<c:when test="${userType=='TAKE SERVICE'}">
										<td><button type="submit" class="btn btn-primary"
												style="width: 130px; background-color: #1A84B4; margin-bottom: 15px"
												name="action">Apply</button></td>
									</c:when>
									<c:otherwise>
										<td><a href="<c:url value='/manageServices/homePage'/>"><button
													type="button" class="btn btn-primary"
													style="width: 130px; background-color: #1A84B4; margin-bottom: 15px">Back</button></a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<script>
		
	</script>


</body>
</html>
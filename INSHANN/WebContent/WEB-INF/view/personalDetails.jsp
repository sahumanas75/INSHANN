<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="IN">
<head>
<meta charset="UTF-8">
<title>Personal Details</title>
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
.control-label {
	color: #1F81BA;
	font-size: 15px;
}

nav {
	font-size: 25px;
	word-spacing: 200px;
	margin-top: 5px;
	background-color: black;
}

nav, a {
	line-height: 55px;
	color: #ffffff;
}

.fa {
	font-size: 25px;
}

.jumbotron {
	text-align: center;
	background-color: #1A84B4;
	color: white;
	padding: 30px;
	height: 30px;
}

h3 {
	font-size: 30px;
	margin: -10px;
}

body {
	background-image: url("<c:url value='/resources/img/bric.png'/>");
	background-attachment: inherit;
}
</style>

<script>
	function checkCountryType() {
		var takeValue = document.getElementById("sel").value;
		if (takeValue == '') {
			document.getElementById("button").disabled = true;
		} else {
			document.getElementById("button").disabled = false;
		}
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
		<div class="jumbotron">
			<h3>
				<span class="glyphicon glyphicon-send"></span> PERSONAL-DETAILS
			</h3>
		</div>

	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div style="margin-left: 95px">
					<p style="color: green; font-size: 17px; font-family: monospace;">${msg}</p>
				</div>
			</div>
			<table class="table">
				<c:url var="get" value="/manageServices/personalInfo"></c:url>
				<form:form class="form-horizontal fields" action="${get}"
					method="POST" modelAttribute="personal">
					<div class="form-group row ">
						<label class="col-md-4 col-md-offset-4 control-label">Name:</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="name" id="" class="form-control"
								required value="${pInfo.name}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label">Language:</label>
						<div class="col-md-4 col-md-offset-4">
							<select class="form-control" name="language" id="sel"
								onchange="checkCountryType();">
								<option value="">Choose a Language...</option>
								<option value="Afrikanns">Afrikanns</option>
								<option value="Albanian">Albanian</option>
								<option value="Arabic">Arabic</option>
								<option value="Armenian">Armenian</option>
								<option value="Basque">Basque</option>
								<option value="Bengali">Bengali</option>
								<option value="Bulgarian">Bulgarian</option>
								<option value="Catalan">Catalan</option>
								<option value="Cambodian">Cambodian</option>
								<option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
								<option value="Croation">Croation</option>
								<option value="Czech">Czech</option>
								<option value="Danish">Danish</option>
								<option value="Dutch">Dutch</option>
								<option value="English">English</option>
								<option value="Estonian">Estonian</option>
								<option value="Fiji">Fiji</option>
								<option value="Finnish">Finnish</option>
								<option value="French">French</option>
								<option value="Georgian">Georgian</option>
								<option value="German">German</option>
								<option value="Greek">Greek</option>
								<option value="Gujarati">Gujarati</option>
								<option value="Hebrew">Hebrew</option>
								<option value="Hindi">Hindi</option>
								<option value="Hungarian">Hungarian</option>
								<option value="Icelandic">Icelandic</option>
								<option value="Indonesian">Indonesian</option>
								<option value="Irish">Irish</option>
								<option value="Italian">Italian</option>
								<option value="Japanese">Japanese</option>
								<option value="Korean">Korean</option>
								<option value="Latin">Latin</option>
								<option value="Latvian">Latvian</option>
								<option value="Lithuanian">Lithuanian</option>
								<option value="Macedonian">Macedonian</option>
								<option value="Malay">Malay</option>
								<option value="Malayalam">Malayalam</option>
								<option value="Maltese">Maltese</option>
								<option value="Maori">Maori</option>
								<option value="Marathi">Marathi</option>
								<option value="Mongolian">Mongolian</option>
								<option value="Nepali">Nepali</option>
								<option value="Norwegian">Norwegian</option>
								<option value="Odia">Odia</option>
								<option value="Persian">Persian</option>
								<option value="Polish">Polish</option>
								<option value="Portuguese">Portuguese</option>
								<option value="Punjabi">Punjabi</option>
								<option value="Quechua">Quechua</option>
								<option value="Romanian">Romanian</option>
								<option value="Russian">Russian</option>
								<option value="Samoan">Samoan</option>
								<option value="Serbian">Serbian</option>
								<option value="Slovak">Slovak</option>
								<option value="Slovenian">Slovenian</option>
								<option value="Spanish">Spanish</option>
								<option value="Swahili">Swahili</option>
								<option value="Swedish ">Swedish</option>
								<option value="Tamil">Tamil</option>
								<option value="Tatar">Tatar</option>
								<option value="Telugu">Telugu</option>
								<option value="Thai">Thai</option>
								<option value="Tibetan">Tibetan</option>
								<option value="Tonga">Tonga</option>
								<option value="Turkish">Turkish</option>
								<option value="Ukranian">Ukranian</option>
								<option value="Urdu">Urdu</option>
								<option value="Uzbek">Uzbek</option>
								<option value="Vietnamese">Vietnamese</option>
								<option value="Welsh">Welsh</option>
								<option value="Xhosa">Xhosa</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> About You(Maximum 1500
							characters only)</label>
						<div class="col-md-4 col-md-offset-4">
							<textarea class="form-control" name="aboutYou" cols="3" rows="3"
								maxlength="1500" style="resize: none"><c:out
									value="${pInfo.aboutYou}" /></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Jobs</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="jobs" id="" class="form-control"
								required value="${pInfo.jobs}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Educational Details</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="eduDetails" id="" class="form-control"
								required value="${pInfo.eduDetails}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Internships</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="internships" id="" class="form-control"
								required value="${pInfo.internships}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Experiences</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="experiences" id="" class="form-control"
								required value="${pInfo.experiences}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Work Sample</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="workSample" id="" class="form-control"
								required value="${pInfo.workSample}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Projects:(You can share
							project link)</label>
						<div class="col-md-4 col-md-offset-4">
							<textarea class="form-control" name="projects" cols="3" rows="3"
								maxlength="255" style="resize: none"><c:out
									value="${pInfo.projects}" /></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 col-md-offset-4 control-label"><span
							class="glyphicon glyphicon-send"></span> Linked Account</label>
						<div class="col-md-4 col-md-offset-4">
							<input type="text" name="linkedAccount" id=""
								class="form-control" required value="${pInfo.linkedAccount}">

							<input type="hidden" name=adNumber id="" class="form-control"
								required value="${adNum}"> <input type="hidden"
								name="applyStatus" id="" class="form-control" required
								value="APPLIED"> <input type="hidden" name="userName"
								id="" class="form-control" required value="${userName}">
						</div>
					</div>
					<div class="form-group row">
						<button type="submit" name="action"
							class="btn btn-primary col-md-4 col-md-offset-4"
							style="border-radius: 10px; background-color: #1A84B4; font-size: 17px; margin-top: 10px">Submit</button>
					</div>
				</form:form>
			</table>
		</div>
	</div>

</body>
</html>
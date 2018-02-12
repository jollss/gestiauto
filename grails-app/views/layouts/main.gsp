<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Sistema de gestión"/></title>

	<link rel="stylesheet" href="/gestion/css/bootstrap.min.css">
	<link rel="stylesheet" href="/gestion/css/myEstilo.css">
	<link rel="stylesheet" href="/gestion/css/libs/fontawesome-all.min.css">
	<g:layoutHead/>
</head>
<body>

<g:render template="/layouts/navbar"/>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<g:render template="/layouts/footer"/>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

<script
		src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script src="/gestion/js/bootstrap.js"></script>
<script src="/gestion/js/miScript.js"></script>
</body>
</html>


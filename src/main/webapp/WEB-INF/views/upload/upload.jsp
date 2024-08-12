<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<h1>Upload File</h1>
<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" required>
    <button type="submit">Upload</button>
</form>
<div>${message}</div>
<a href="/files">View Uploaded Files</a>
</body>
</html>
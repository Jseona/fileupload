<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang='en'>
<head>
    <meta charset="UTF-8">
    <title>파일업로드</title>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file"/><br>
    <input type="submit" value="파일전송"/>
</form>
</body>
</html>
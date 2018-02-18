<%--
  Created by IntelliJ IDEA.
  User: Зинаида
  Date: 12.02.2018
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <style type="text/css">

        body{
            background-image:url(${pageContext.request.contextPath}../../resources/yellow.jpg);
        }
        h1{
            color: #540202;
            font-size: 30px;
        }

        h2{
            color: #5a0906;
        }
        a{
            color: #6d2e0c;

        }
        a:hover{
            color: #ffdb89;
        }
        a:active{
            color: #7c2b0a
        }
        a:visited{
            color: #7c2b0a;
        }


    </style>

    <style type="text/css">
        .css2{

            color: #6d2e0c;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 ></h1>
    <a href="<c:url value="books"/>"  class="css2" >Open the bookshelf</a>
    <p>
        <img src="${pageContext.request.contextPath}resources/bookshelf.jpg/">
    </p>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Зинаида
  Date: 13.02.2018
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<style type="text/css">
    .tg {
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #5a0906;
        text-align: center;
        width: 1200px;

    }

    .tg td {
        font-family: "Times New Roman", sans-serif;
        font-size: 15px;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #7c2b0a;
        color: #560b15;
        background-color: #ffe49e;
        width: 800px;
        text-align: left;
        left: 30px;

    }

    .tg th {
        font-family: "Times New Roman", sans-serif;
        font-size: 15px;
        font-weight: normal;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #781f13;
        color: #781f13;

        background-color: #ffe49e;

    }

    body{
        background-image:url(${pageContext.request.contextPath}../../resources/yellow.jpg);
    }
    h1{
        color: #560b15;
    }
    h3{
        margin-left: 50px;
    }
    h2{
        color: #560b15;
    }
    a{
        color: #5a0906;

    }
    a:hover{
        color: #7c2b0a;
    }
    a:active{
        color: #781f13
    }
    a:visited{
        color: #7c2b0a;
    }
</style>

<style type="text/css">
    .css2{

        color: #4e0906;
        left: 130px;
        margin-left: 50px;
    }
</style>
<html>
<head>
    <title>A book with this title was not found</title>
</head>
<body>
<table class="css2">
    <br/>
    <h3>
        <a href="<c:url value="/books"/>"  class="css2"  >Bookshelf</a>
    </h3>
</table>
<div  class="tg" >
    <h1 >A book on your request was not found</h1>
    <img src="${pageContext.request.contextPath}/resources/book.jpg">
</div>
</body>
</html>


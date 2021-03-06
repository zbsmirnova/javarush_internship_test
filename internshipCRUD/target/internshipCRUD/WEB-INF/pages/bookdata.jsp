<%--suppress ALL, InjectedReferences --%>
<%--
  Created by IntelliJ IDEA.
  User: Зинаида
  Date: 13.02.2018
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books found</title>

    <style type="text/css">
        table{
            margin: auto;
        }
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #a01019;


        }

        .tg td {
            font-family: "Times New Roman", sans-serif;
            font-size: 15px;
            padding: 20px 20px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ffe49e;
            color: #6d2e0c;
            background-color: #fffad3;
            text-align: center;

        }

        .tg th {
            font-family: "Times New Roman", sans-serif;
            font-size: 20px;
            font-weight: normal;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #a70d1e;
            color: #4e1132;
            background-color: #ffdb89;
            text-align: center;

        }

        body{
            background-image:url(${pageContext.request.contextPath}../../resources/yellow.jpg);
        }
        h1{
            color: #4e0906;

        }

        h2{
            color: #4e0906;
        }
        a{
            margin-left: 50px;
            color: #781f13;
            text-decoration:none;
        }
        a:hover{
            color: #7c2b0a;
        }
        a:active{
            color: #a70d1e
        }
        a:visited{
            color: #a70d1e;
        }

    </style>

    <style type="text/css">
        .css2{

            color: #35484e;
        }
    </style>

</head>
<body >


<br/>

<a href="../../index.jsp" class="mycss2" >   Back to main menu </a>
<a href="<c:url value="/books"/>"  class="css2"  >Bookshelf</a>

<br/>

<h1  align="center" >Books found on your request</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Title</th>
        <th width="120">Description</th>
        <th width="120">Author</th>
        <th width="80">ISBN</th>
        <th width="80">PrintYear</th>
        <th width="60">IsReadAlready</th>
        <th width="60">Edit</th>
        <th width="60">Delete</th>
        <th width="60">Open</th>

    </tr>
    <c:forEach items="${listbooksbyquery}" var="book">
        <tr>
            <td>${book.id}</td>
            <td><a href="/openabook/${book.id}" target="_blank">${book.title}</a></td>
            <td>${book.description}</td>
            <td>${book.author}</td>
            <td>${book.isbn}</td>
            <td>${book.printYear}</td>
            <td>${book.readAlready}</td>

            <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
            <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            <td><a href="<c:url value='/open/${book.id}'/>">Open</a></td>

        </tr>
    </c:forEach>
</table>

</body>

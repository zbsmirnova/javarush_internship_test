<%--
  Created by IntelliJ IDEA.
  User: Зинаида
  Date: 12.02.2018
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<<html>
<head>
    <title>Bookshelf</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #a01019;
            margin: auto;
        }

        .tg td {
            font-family: "Times New Roman", sans-serif;
            font-size: 15px;
            padding: 10px 5px;
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
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #a70d1e;
            color: #4e1132;
            background-color: #ffdb89;
            text-align: center;

        }
        .yy{
            margin-left: 74px;
        }
        .uu{
            margin-right:450px ;
            text-align: right;
        }
        .ii{
            font-size: 20px;
            color: #4e0906;
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
            color: #781f13;
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
        .mycss{
            background-color: #fffff9;
            color: #6d2e0c;
        }
    </style>
    <style type="text/css">
        .css2{

            color: #5a0906;
        }
    </style>
</head>
<body>
<div class="yy">
    <a href="../../index.jsp" class="mycss2" >   Back to main menu </a>
    <br/>
    <h1 align="center" >Books List</h1>
    <c:if test="${!empty listBooks}">
        <table class="tg"  >
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
            <c:forEach items="${listBooks}" var="book">
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
    </c:if>
    <c:if test="${empty listBooks}">
        <p class="ii">Books list is empty</p>
    </c:if>
    <table>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td width="50%">

                <h1>Edit a Book</h1>
                <c:url var="addAction" value="/books/create"/>
                <form:form action="${addAction}" commandName="book">
                    <table>
                        <c:if test="${!empty book.title}">
                            <tr>
                                <td>
                                    <form:label path="id"  cssClass="mycss2">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="id" readonly="true" size="8" cssClass="mycss"/>

                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <form:label path="author"  cssClass="mycss2">
                                    <spring:message text="Author"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="author" cssClass="mycss" required="true"/>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="title" cssClass="mycss2">
                                    <spring:message text="Title"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="title" cssClass="mycss"  required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="description" cssClass="mycss2">
                                    <spring:message text="Description"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="description" cssClass="mycss"  required="true"/>
                            </td>
                        </tr>
                        <tr>
                        <td><form:label path="isbn" cssClass="mycss2">
                            <spring:message text="ISBN" />
                        </form:label>
                        </td>
                        <td>
                            <form:input path="isbn" cssClass="mycss" required="true"/>
                        </td>
                    </tr>

                        <tr>
                            <td><form:label path="printYear" cssClass="mycss2">
                                <spring:message text="PrintYear" />
                            </form:label>
                            </td>
                            <td>
                                <form:input type="number"  path="printYear" cssClass="mycss" required="true"/>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:if test="${!empty book.title}">
                                    <input type="submit"
                                           value="<spring:message text="Edit Book" />" class="mycss"/>
                                </c:if>
                                <c:if test="${empty book.title}">
                                    <input type="submit"
                                           value="<spring:message text="Add Book"/>" class="mycss"/>
                                </c:if>

                            </td>
                        </tr>
                    </table>

                </form:form>
            </td>
            <td >
                <h1 align="center">Search a Book</h1>

                <c:url value="/searchbyquery" var="searchAction" />
                <form:form action="${searchAction}"  method="POST" >
                    <label >
                        <input type="text" name="request" required="true" placeholder="title/author/ISBN/isReadAlready"/>
                    </label>
                    <input type="submit" value="search"/> </form:form>

            </td>
        </tr>
    </table>
    <div id="pagination" class="uu">
        <p >Pagination: </p>

        <c:url value="/books" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/books" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="/books" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="pn next">Next</a>
        </c:if>
    </div>
</div>
</body>
</html>

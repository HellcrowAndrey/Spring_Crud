<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Person List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">People</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<main role="main" class="container" >
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2 class="page-header">Person List</h2>
                <c:if test="${!empty read}">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" width="80">ID</th>
                            <th scope="col" width="120">FName</th>
                            <th scope="col" width="120">LName</th>
                            <th scope="col" width="120">Age</th>
                            <th scope="col" width="60">Edit</th>
                            <th scope="col" width="60">Delete</th>
                        </tr>
                        </thead>
                        <c:forEach items="${read}" var="person">
                            <tbody>
                            <tr>
                                <td scope="row">${person.id}</td>
                                <td>${person.fname}</td>
                                <td>${person.lname}</td>
                                <td>${person.age}</td>
                                <td><a class="btn btn-success" href="<c:url value='/edit/${person.id}.form'/>">Edit</a></td>
                                <td><a class="btn btn-danger" href="<c:url value='/delete/${person.id}.form'/>">Delete</a></td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
            <div class="col-md-4">
                <h2 class="page-header">Control Panel</h2>
                <c:url var="addAction" value="/people/create.form"/>
                <form:form action="${addAction}" commandName="person">
                    <table>
                        <c:if test="${!empty person.fname}">
                            <tr>
                                <td>
                                    <form:label path="id">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                                    <form:hidden path="id"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <form:label path="fname">
                                    <spring:message text="Fname"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="fname"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="lname">
                                    <spring:message text="Lname"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="lname"/>
                            </td>
                        </tr>
                        <tr  class="form-control">
                            <td>
                                <form:label path="age">
                                    <spring:message text="Age"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="age"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:if test="${!empty person.fname}">
                                    <input class="btn btn-primary" type="submit"
                                           value="<spring:message text="Edit Person"/>"/>
                                </c:if>
                                <c:if test="${empty person.fname}">
                                    <input class="btn btn-primary" type="submit"
                                           value="<spring:message text="Add Person"/>"/>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>
    </div>
</main>
<footer class="footer">
    <div class="container">
        <span class="text-muted">Place sticky footer content here.</span>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="../../../../assets/js/vendor/popper.min.js"></script>
<script src="../../../../dist/js/bootstrap.min.js"></script>
</body>
</html>
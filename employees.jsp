<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>

<head>

    <title>Employees</title>

</head>

<body>



<h2>Employee List</h2>



<a href="employees/add">Add Employee</a>



<table border="1">

    <tr>

        <th>ID</th>

        <th>Name</th>

        <th>Salary</th>

        <th>Action</th>

    </tr>



    <c:forEach var="emp" items="${employees}">

        <tr>

            <td>${emp.id}</td>

            <td>${emp.name}</td>

            <td>${emp.salary}</td>

            <td>

                <a href="employees/edit/${emp.id}">Edit</a>

                |

                <a href="employees/delete/${emp.id}">Delete</a>

            </td>

        </tr>

    </c:forEach>



</table>



</body>

</html>
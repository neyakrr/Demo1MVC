<%@ page contentType="text/html;charset=UTF-8" %>



<html>

<head>

    <title>Edit Employee</title>

</head>

<body>



<h2>Edit Employee</h2>



<form action="../update" method="post">

    <input type="hidden" name="id" value="${employee.id}" />



    Name: <input type="text" name="name" value="${employee.name}" /><br><br>

    Salary: <input type="text" name="salary" value="${employee.salary}" /><br><br>



    <input type="submit" value="Update"/>

</form>



</body>

</html>
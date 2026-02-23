<html>

<head>

<title>Employee List</title>

</head>

<body onload="loadEmployees()">



<h2>Employee List</h2>



<table border="1">

    <thead>

        <tr>

            <th>ID</th>

            <th>Name</th>

            <th>Salary</th>

            <th>Action</th>

        </tr>

    </thead>

    <tbody id="empTable"></tbody>

</table>



<br>

<a href="addEmployee.jsp">Add New Employee</a>



<script>



function loadEmployees(){



    fetch("http://localhost:9000/employees")

    .then(response => response.json())

    .then(data => {



        let table = document.getElementById("empTable");

        table.innerHTML = "";



        data.forEach(emp => {



            table.innerHTML += `

                <tr>

                    <td>${emp.id}</td>

                    <td>${emp.name}</td>

                    <td>${emp.salary}</td>

                    <td>

                        <button onclick="deleteEmp(${emp.id})">Delete</button>

                        <button onclick="editEmp(${emp.id})">Edit</button>

                    </td>

                </tr>

            `;

        });



    });

}



function deleteEmp(id){



    fetch("http://localhost:9000/employees/" + id, {

        method: "DELETE"

    })

    .then(() => loadEmployees());

}



function editEmp(id){

    window.location.href="editEmployee.jsp?id="+id;

}



</script>



</body>

</html>



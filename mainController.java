package control;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import model.Employee;

@Controller
@RequestMapping("/employees")
public class mainController {
	 private final String REST_URL = "http://localhost:9000/employees";

	    private RestTemplate restTemplate = new RestTemplate();

	    // 🔹 GET ALL
	    @GetMapping
	    public String getAllEmployees(Model model) {

	        Employee[] employees =
	                restTemplate.getForObject(REST_URL, Employee[].class);

	        List<Employee> employeeList = Arrays.asList(employees);

	        model.addAttribute("employees", employeeList);

	        return "employees"; // employees.jsp
	    }

	    // 🔹 SHOW ADD FORM
	    @GetMapping("/add")
	    public String showAddForm(Model model) {
	        model.addAttribute("employee", new Employee());
	        return "addEmployee";
	    }

	    // 🔹 SAVE
	    @PostMapping("/save")
	    public String saveEmployee(@ModelAttribute Employee employee) {

	        restTemplate.postForObject(REST_URL, employee, Employee.class);

	        return "redirect:/employees";
	    }

	    // 🔹 EDIT FORM
	    @GetMapping("/edit/{id}")
	    public String editEmployee(@PathVariable Long id, Model model) {

	        Employee employee =
	                restTemplate.getForObject(REST_URL + "/" + id, Employee.class);

	        model.addAttribute("employee", employee);

	        return "editEmployee";
	    }

	    // 🔹 UPDATE
	    @PostMapping("/update")
	    public String updateEmployee(@ModelAttribute Employee employee) {

	        restTemplate.put(REST_URL + "/" + employee.getId(), employee);

	        return "redirect:/employees";
	    }

	    // 🔹 DELETE
	    @GetMapping("/delete/{id}")
	    public String deleteEmployee(@PathVariable Long id) {

	        restTemplate.delete(REST_URL + "/" + id);

	        return "redirect:/employees";
	    }

}

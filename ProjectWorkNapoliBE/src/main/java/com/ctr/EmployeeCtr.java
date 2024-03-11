package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.IdEmployeeRepository;
import com.model.Employee;

@Controller
@RequestMapping("EmployeeCtr")
public class EmployeeCtr {

	@Autowired
	public IdEmployeeRepository idEmployeeRep;

//////////////////////////////////////////////////////

	@GetMapping("/preAddIdEmployee")
	public String preAddIdEmployee(Model model) {

		return "employee/addEmployee";
	}

	@GetMapping("/addIdEmployee")
	public String addIdEmployee(Model model, Employee employee) {

		idEmployeeRep.save(employee);
		System.out.println(employee);

		return "employee/operationSuccess";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "employee/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEmployee) {
		Employee employee = new Employee();
		employee = (Employee) idEmployeeRep.findById(idEmployee).get();
		model.addAttribute("IdEmployee", employee);
		return "employee/resultsFindById";
	}

	@PostMapping("/updateEmployee")
	public String updateEmployee(Model model, Employee employee) {
		idEmployeeRep.save(employee);
		return "employee/operationSuccess";
	}

//////////////////////////////////////////////////////
	
	@GetMapping("/preDeleteEmployee")
	public String preDeleteEmployee(Model model) {

		return "employee/deleteEmployee";
	}

	@GetMapping("/deleteEmployee")
	public String deleteEmployee(Model model, int idEmployee) {

		idEmployeeRep.deleteById(idEmployee);
		return "employee/operationSuccess";
	}	
}

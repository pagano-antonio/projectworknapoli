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

		return "";
	}

	@GetMapping("/addIdEmployee")
	public String addIdEmployee(Model model, Employee employee) {

		idEmployeeRep.save(employee);
		System.out.println(employee);

		return "";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEmployee) {
		Employee employee = new Employee();
		employee = (Employee) idEmployeeRep.findById(idEmployee).get();
		model.addAttribute("IdEmployee", employee);
		return "";
	}

	@PostMapping("/updateEmployee")
	public String updateEmployee(Model model, Employee employee) {
		idEmployeeRep.save(employee);
		return "";
	}

//////////////////////////////////////////////////////
	
	@GetMapping("/preDeleteEmployee")
	public String preDeleteEmployee(Model model) {

		return "";
	}

	@GetMapping("/deleteEducationDegreeType")
	public String deleteEducationDegreeType(Model model, int idEmployee) {

		idEmployeeRep.deleteById(idEmployee);
		return "";
	}	
}

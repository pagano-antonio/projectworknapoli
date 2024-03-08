package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.EmployeeTypeRepository;
import com.model.EmployeeType;

@Controller
@RequestMapping("EmployeeTypeCtr")
public class EmployeeTypeCtr {

	@Autowired
	public EmployeeTypeRepository employeeTypeRep;

//////////////////////////////////////////////////////

	@GetMapping("/preAddEmployeeType")
	public String preAddIdEmployee(Model model) {

		return "";
	}

	@GetMapping("/addEmployeeType")
	public String addEmployeeType(Model model, EmployeeType employeeType) {

		employeeTypeRep.save(employeeType);
		System.out.println(employeeType);

		return "";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEmployeeType) {
		EmployeeType employeeType = new EmployeeType();
		employeeType = (EmployeeType) employeeTypeRep.findById(idEmployeeType).get();
		model.addAttribute("IdEmployeeType", employeeType);
		return "";
	}

	@PostMapping("/updateEmployeeType")
	public String updateEmployeeType(Model model, EmployeeType employeeType) {
		employeeTypeRep.save(employeeType);
		return "";
	}

//////////////////////////////////////////////////////
	
	@GetMapping("/preDeleteEmployeeType")
	public String preDeleteEmployeeType(Model model) {

		return "";
	}

	@GetMapping("/deleteEducationDegreeType")
	public String deleteEducationDegreeType(Model model, int idEmployeeType) {

		employeeTypeRep.deleteById(idEmployeeType);
		return "";
	}	
}
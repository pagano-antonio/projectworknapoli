package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.EmployeeTypeRepository;
import com.dao.IdEmployeeRepository;
import com.model.Employee;
import com.model.EmployeeType;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("EmployeeCtr")
public class EmployeeCtr {

	@Autowired
	public IdEmployeeRepository EmployeeRep;

	@Autowired
	public EmployeeTypeRepository employeeTypeRep;

	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

//////////////////////////////////////////////////////

	@GetMapping("/addEmployeeForm")
	public String addEmployeeForm(Model model) {
		List<EmployeeType> types = employeeTypeRep.findAll();
		model.addAttribute("types", types);
		return "employee/addEmployee";
	}

	@PostMapping("/addEmployee")
	public String addIdEmployee(Model model, Employee employee) {

		String psw = employee.getPassword();
		String hashedPassword = passwordEncoder.encode(psw);
		System.out.println(hashedPassword);
		employee.setPassword(hashedPassword);
		EmployeeRep.save(employee);
		System.out.println(employee);

		return "home";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "employee/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEmployee) {
		Employee employee = new Employee();
		employee = (Employee) EmployeeRep.findById(idEmployee).get();
		model.addAttribute("IdEmployee", employee);
		return "employee/resultsFindById";
	}

	@PostMapping("/updateEmployee")
	public String updateEmployee(Model model, Employee employee) {
		EmployeeRep.save(employee);
		return "employee/operationSuccess";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preDeleteEmployee")
	public String preDeleteEmployee(Model model) {

		return "employee/deleteEmployee";
	}

	@GetMapping("/deleteEmployee")
	public String deleteEmployee(Model model, int idEmployee) {

		EmployeeRep.deleteById(idEmployee);
		return "employee/operationSuccess";
	}

	@GetMapping("/goToUserProfile")
	public String goToProfile(Model model, int idEmployee) {
		Employee employee = (Employee) EmployeeRep.findById(idEmployee).get();
		model.addAttribute("employee", employee);
		return "employee/employeeProfile";
	}

	@PostMapping("/updateOwnProfile")
	public String updateOwnProfile(HttpServletRequest request, Model model, @ModelAttribute Employee e,
			@RequestParam("oldpassword") String p) {
		model.addAttribute("showToast", true);
		Employee old = (Employee) EmployeeRep.findById(e.getIdEmployee()).get();

		if (passwordEncoder.matches(p, old.getPassword())) {
			if (e.getPassword() != null && e.getPassword() != "") {
				String psw = passwordEncoder.encode(e.getPassword());
				e.setPassword(psw);
			} else {
				e.setPassword(old.getPassword());
			}
			EmployeeRep.save(e);
			HttpSession session = request.getSession();
			session.setAttribute("username", e.getUsername());
			request.setAttribute("username", e.getUsername());
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", "Profile updated!");
			return "home";
		} else {
			model.addAttribute("employee", e);
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Incorrect password. Try Again");
			return "employee/employeeProfile";
		}
	}
}

package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.EmployeeRepository;

import com.model.Employee;

	@RestController
	@RequestMapping("EmployeeRest")
	@CrossOrigin
	public class EmployeeRest {


	@Autowired
	private EmployeeRepository employeeRep;
	
	/////////////////////////////////////////////////////////////////////////   
	
	@PostMapping("addEmployee")
	public String addEmployee(@RequestBody Employee e) {
		System.out.println("operation add complete for " + e);
		employeeRep.save(e);
	
		return "operation add complete";
	}
	
	/////////////////////////////////////////////////////////////////////////
	
	@PutMapping("updateEmployee")
	public String updateEmployee(@RequestBody Employee e) {
		System.out.println("operation update complete for " + e);
		employeeRep.save(e);
	
		return "operation update complete";
	}
	
	/////////////////////////////////////////////////////////////////////////	
	
	@DeleteMapping("deleteEmployee/{idEmployee}")
	public String deleteEmployee(@PathVariable("idEmployee") int idEmployee) {
		System.out.println("operation delete complete for id " + idEmployee);
		employeeRep.deleteById(idEmployee);
	
		return "operation delete complete";
	}
	
	/////////////////////////////////////////////////////////////////////////
	
	@GetMapping("findById/{idEmployee}")
	public Employee findById(@PathVariable("idEmployee") int idEmployee) {
	
		Employee res = employeeRep.findById(idEmployee).get();
	
		return res;
	}


}

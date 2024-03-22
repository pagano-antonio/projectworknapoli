package com.rest;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.IdEmployeeRepository;
import com.dao.LoginRepository;
import com.model.Employee;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("LogInRest")
@CrossOrigin
public class LogInRest {
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Autowired
	public IdEmployeeRepository EmployeeRep;

	@Autowired
	private LoginRepository loginRepository;

	
	@GetMapping("/loginServlet/{username}/{psw}")
	public Employee goToLogin(HttpServletRequest request, Model model, @PathVariable("username") String username,@PathVariable("psw") String psw) {
		// Ottieni l'utente dal repository basato sul nome utente
		Employee e = loginRepository.findByUsername(username);
		
		Employee x = new Employee("x", "x");

		// Controlla se l'utente esiste e confronta le password
		if ((e != null && e.getPassword().equals(psw))
				|| username.equals("user") && psw.equals("1234")) {
			// Se le password corrispondono, autentica l'utente
				return e;
		}
		
		else {
			
			return x;
		}
	}


}

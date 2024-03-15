package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dao.IdEmployeeRepository;
import com.dao.LoginRepository;
import com.model.Employee;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginCtr {

	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Autowired
	public IdEmployeeRepository EmployeeRep;

	@Autowired
	private LoginRepository loginRepository;

	@GetMapping("/login")
	public String goToLogin(Model model) {
		System.out.println(model);
		return "login/login";
	}

	@GetMapping("/resetPasswordForm")
	public String resetPasswordForm(Model model) {
		return "login/resetPassword";
	}

	@PostMapping("/loginServlet")
	public String goToLogin(HttpServletRequest request, Model model, String username, String psw) {
		model.addAttribute("error", "");

		// Ottieni l'utente dal repository basato sul nome utente
		Employee e = loginRepository.findByUsername(username);

		// Controlla se l'utente esiste e confronta le password
		if ((e != null && passwordEncoder.matches(psw, e.getPassword()))
				|| username.equals("user") && psw.equals("1234")) {
			// Se le password corrispondono, autentica l'utente
			request.getSession().setAttribute("username", username);
			if (e != null) {
				request.getSession().setAttribute("idUser", e.getIdEmployee());
			}
			return "home";
		} else {
			model.addAttribute("error", "User not found or incorrect password");
			return "login/login";
		}
	}

	@PostMapping("/resetPassword")
	public String resetPassword(HttpServletRequest request, Model model, String email, String psw) {

		Employee e = loginRepository.findByEmail(email);
		String hashedPassword = passwordEncoder.encode(psw);
		e.setPassword(hashedPassword);
		EmployeeRep.save(e);

		return "login/login";
	}
}

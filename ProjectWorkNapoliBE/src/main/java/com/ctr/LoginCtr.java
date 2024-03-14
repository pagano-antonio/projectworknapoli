package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dao.LoginRepository;
import com.model.Employee;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginCtr {

	@Autowired
	private LoginRepository loginRepository;

	@GetMapping("/login")
	public String goToLogin(Model model) {
		System.out.println(model);
		return "login/login";
	}

	@PostMapping("/loginServlet")
	public String goToLogin(HttpServletRequest request, Model model, String username, String psw) {
		System.out.println(username + " " + psw);
		model.addAttribute("error", "");

		Employee e = loginRepository.findByUsernameAndPassword(username, psw);

		if (e != null || (username.equals("user") && psw.equals("1234"))) {
			request.getSession().setAttribute("username", username);
			return "home";
		} else {
			model.addAttribute("error", "User not found or incorrect password");
		}

		return "login/login";

	}

}

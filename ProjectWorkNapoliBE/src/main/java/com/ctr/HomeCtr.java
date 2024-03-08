package com.ctr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeCtr {

	@GetMapping("/login")
	public String login(Model model) {
		System.out.println(model);
		return "login";
	}

	@GetMapping("/gestionaleCandidati")
	public String home(Model model) {
		System.out.println(model);
		return "home";
	}

}

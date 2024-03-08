package com.ctr;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("CandidateCtr")
public class CandidateCtr {

	@GetMapping("/addCandidate")
	public String addCandidate(Model model) {
		return "candidate/addCandidate";
	}

}

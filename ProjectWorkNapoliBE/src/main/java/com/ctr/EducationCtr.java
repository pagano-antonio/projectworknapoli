package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.EducationRepository;
import com.model.Education;

@Controller
@RequestMapping("EducationCtr")
public class EducationCtr {

	@Autowired
	public EducationRepository educationRep;

//////////////////////////////////////////////////////

	@GetMapping("/preAddEducation")
	public String preAddEducation(Model model) {

		return "education/addEducation";
	}

	@GetMapping("/addEducation")
	public String addEducation(Model model, Education education) {

		educationRep.save(education);
		System.out.println(education);

		return "education/operationSuccess";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFind(Model model) {
		return "education/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEducation) {
		Education education = new Education();
		education = (Education) educationRep.findById(idEducation).get();
		model.addAttribute("idEducationFound", education);
		return "education/resultsFindById";
	}

	@PostMapping("/updateEducation")
	public String updateEducation(Model model, Education education) {
		educationRep.save(education);
		return "education/operationSuccess";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preDelete")
	public String preDelete(Model model) {

		return "";
	}

	@GetMapping("/deleteEducation")
	public String deleteEducation(Model model, int idEducation) {

		educationRep.deleteById(idEducation);
		return "";
	}

}
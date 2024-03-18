package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.EducationDegreeTypeRepository;
import com.model.EducationDegreeType;

@Controller
@RequestMapping("EducationDegreeTypeCtr")
public class EducationDegreeTypeCtr {

	@Autowired
	public EducationDegreeTypeRepository educationDegreeTypeRep;

//////////////////////////////////////////////////////

	@GetMapping("/preAddEducationDegreeType")
	public String preAddEducationDegreeType(Model model) {
System.out.println("Arriva qui");
return "educationDegreeType/addEducationDegreeType";
	}

	@GetMapping("/addEducationDegreeType")
	public String addEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {

		educationDegreeTypeRep.save(educationDegreeType);
		System.out.println(educationDegreeType);

		return "educationDegreeType/operationSuccess";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "educationDegreeType/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, Integer idEducationDegreeType) {
		EducationDegreeType educationDegreeType = new EducationDegreeType();
		educationDegreeType = (EducationDegreeType) educationDegreeTypeRep.findById(idEducationDegreeType).get();
		model.addAttribute("IdEducationDegreeType", educationDegreeType);
		return "educationDegreeType/resultsFindById";
	}

	@PostMapping("/updateEducationDegreeType")
	public String updateEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {
		educationDegreeTypeRep.save(educationDegreeType);
		return "educationDegreeType/operationSuccess";
	}

//////////////////////////////////////////////////////
	
	@GetMapping("/preDeleteEducationDegreeType")
	public String preDeleteEducationDegreeType(Model model) {

		return "educationDegreeType/deleteEducationDegreeType";
	}

	@GetMapping("/deleteEducationDegreeType")
	public String deleteEducationDegreeType(Model model, int idEducationDegreeType) {

		educationDegreeTypeRep.deleteById(idEducationDegreeType);
		return "educationDegreeType/operationSuccess";
	}	
}

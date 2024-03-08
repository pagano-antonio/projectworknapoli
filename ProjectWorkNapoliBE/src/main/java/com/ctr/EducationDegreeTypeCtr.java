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
@RequestMapping("EducationDegreTypeCtr")
public class EducationDegreeTypeCtr {

	@Autowired
	public EducationDegreeTypeRepository educationDegreeTypeRep;

//////////////////////////////////////////////////////

	@GetMapping("/preAddEducationDegreeType")
	public String preAddEducationDegreeType(Model model) {

		return "";
	}

	@GetMapping("/addEducationDegreeType")
	public String addEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {

		educationDegreeTypeRep.save(educationDegreeType);
		System.out.println(educationDegreeType);

		return "";
	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFindById(Model model) {
		return "";
	}

	@GetMapping("/findById")
	public String findById(Model model, int idEducationDegreeType) {
		EducationDegreeType educationDegreeType = new EducationDegreeType();
		educationDegreeType = (EducationDegreeType) educationDegreeTypeRep.findById(idEducationDegreeType).get();
		model.addAttribute("IdEducationDegreeType", educationDegreeType);
		return "";
	}

	@PostMapping("/updateEducationDegreeType")
	public String updateEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {
		educationDegreeTypeRep.save(educationDegreeType);
		return "";
	}

//////////////////////////////////////////////////////
	
	@GetMapping("/preDeleteEducationDegreeType")
	public String preRicercaElimina(Model model) {

		return "";
	}

	@GetMapping("/deleteEducationDegreeType")
	public String eliminaPersona(Model model, int idEducationDegreeType) {

		educationDegreeTypeRep.deleteById(idEducationDegreeType);
		return "";
	}	
}

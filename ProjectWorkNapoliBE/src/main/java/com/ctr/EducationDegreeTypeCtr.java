package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.EducationDegreeTypeRepository;
import com.model.EducationDegreeType;

@Controller
@RequestMapping("EducationDegreeTypeCtr")
public class EducationDegreeTypeCtr {

	@Autowired
	public EducationDegreeTypeRepository educationDegreeTypeRep;

//////////////////////////////////////////////////////
	@GetMapping("/allEducationDegreeTypes")
	public String allEducationDegreeTypes(Model model) {
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		model.addAttribute("showToast", true);
		if (educations.size() > 0) {
			model.addAttribute("educations", educations);
			model.addAttribute("toastTitle", "Success");

			if (educations.size() == 1) {
				model.addAttribute("toastMessage", "1 education degree type found");
			} else {
				model.addAttribute("toastMessage", educations.size() + " education degree types found");
			}
			return "educationDegreeType/allEducationDegreeTypes";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No education degree type found.Add one first");
			return "educationDegreeType/addEducationDegreeType";

		}
	}

	@GetMapping("/addEducationDegreeTypeForm")
	public String addEducationDegreeTypeForm(Model model) {
		return "educationDegreeType/addEducationDegreeType";
	}

	@GetMapping("/searchEducationDegreeTypeForm")
	public String searchEducationDegreeTypeForm(Model model) {
		return "educationDegreeType/searchEducationDegreeType";
	}

	@PostMapping("/addEducationDegreeType")
	public String addEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {

		educationDegreeTypeRep.save(educationDegreeType);
		educationDegreeTypeRep.flush();
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		model.addAttribute("showToast", true);
		model.addAttribute("educations", educations);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Education degree type added!");
		return "educationDegreeType/allEducationDegreeTypes";

	}

//////////////////////////////////////////////////////

	@GetMapping("/updateEducationDegreeTypeForm")
	public String updateEducationDegreeTypeForm(Model model, @RequestParam("id") Integer idEducationDegreeType) {
		EducationDegreeType education = educationDegreeTypeRep.findById(idEducationDegreeType).get();
		model.addAttribute("education", education);
		return "educationDegreeType/updateEducationDegreeType";
	}

	@PostMapping("/searchEducationDegreeType")
	public String searchEducationDegreeType(Model model, EducationDegreeType educationDegreeType,
			@RequestParam(name = "id", required = false) Integer id) {
		List<EducationDegreeType> educations = educationDegreeTypeRep.findByCriteria(id,
				educationDegreeType.getDescription());
		model.addAttribute("showToast", true);
		if (educations.size() > 0) {
			model.addAttribute("educations", educations);
			model.addAttribute("toastTitle", "Success");

			if (educations.size() == 1) {
				model.addAttribute("toastMessage", "1 education degree type found");
			} else {
				model.addAttribute("toastMessage", educations.size() + " education degree types found");
			}
			return "educationDegreeType/allEducationDegreeTypes";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No education degree type found. Try again");
			return "educationDegreeType/searchEducationDegreeType";

		}
	}

	@PostMapping("/updateEducationDegreeType")
	public String updateEducationDegreeType(Model model, EducationDegreeType educationDegreeType) {
		educationDegreeTypeRep.save(educationDegreeType);
		educationDegreeTypeRep.flush();
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		model.addAttribute("showToast", true);
		model.addAttribute("educations", educations);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Education degree type updated!");
		return "educationDegreeType/allEducationDegreeTypes";

	}

	@GetMapping("/deleteEducationDegreeType")
	public String deleteEducationDegreeType(Model model, @RequestParam("id") Integer idEducationDegreeType) {

		educationDegreeTypeRep.deleteById(idEducationDegreeType);
		educationDegreeTypeRep.flush();
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		model.addAttribute("showToast", true);
		if (educations.size() > 0) {
			model.addAttribute("educations", educations);
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", "Education degree type deleted!");
			return "educationDegreeType/allEducationDegreeTypes";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Education degree type deleted. Add another education.");

			return "educationDegreeType/addEducationDegreeType";
		}

	}
}

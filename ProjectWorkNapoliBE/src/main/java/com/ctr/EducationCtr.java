package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CandidateRepository;
import com.dao.EducationDegreeTypeRepository;
import com.dao.EducationRepository;
import com.model.Candidate;
import com.model.Education;
import com.model.EducationDegreeType;
import com.model.WorkExperience;

@Controller
@RequestMapping("EducationCtr")
public class EducationCtr {

	@Autowired
	public EducationRepository educationRep;
	
	@Autowired
	public CandidateRepository candidateRep;
	
	@Autowired
	private EducationDegreeTypeRepository educationDegreeTypeRep;


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
	
	
	@PostMapping("/addEducationToCandidate")
	public String addEducationToCandidate(Model model, @RequestParam("idCandidate") int idCandidate, Education education) {
		Candidate candidate = candidateRep.findById(idCandidate).get();
		education.setCandidate(candidate);
		educationRep.save(education);
		List<EducationDegreeType> degreeType = educationDegreeTypeRep.findAll();
		model.addAttribute("degreeType", degreeType);
		model.addAttribute("candidate", candidate);
		boolean reload = true;
		model.addAttribute("reload", reload);
		List<Education> educationsOfCandidate = candidate.getEducations();
		List<WorkExperience> workExpOfCandidate = candidate.getWorkExperiences();

		model.addAttribute("educationsOfCandidate", educationsOfCandidate);
		model.addAttribute("workExpOfCandidate", workExpOfCandidate);
			
		return "candidate/AddMoreDetails";

	}

//////////////////////////////////////////////////////

	@GetMapping("/preFindById")
	public String preFind(Model model) {
		return "education/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, @RequestParam("idEducation") int idEducation) {
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

		return "education/deleteEducation";
	}

	@GetMapping("/deleteEducation")
	public String deleteEducation(Model model, @RequestParam("idEducation") int idEducation) {

		educationRep.deleteById(idEducation);
		return "education/operationSuccess";
	}

}
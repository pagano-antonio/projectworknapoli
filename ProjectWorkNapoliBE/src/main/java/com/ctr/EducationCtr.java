package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		List<Candidate> candidates = candidateRep.findAll();
		model.addAttribute("candidates", candidates);
		
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		model.addAttribute("educations", educations);

		return "education/addEducation";
	}

	@GetMapping("/addEducation")
	public String addEducation(Model model, Education education) {

		educationRep.save(education);
		List <Candidate> candidates =candidateRep.findAll();
        model.addAttribute("candidates", candidates);
        model.addAttribute("toastMessage", "education added!");
        model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
	}

	@PostMapping("/addEducationToCandidate")
	public String addEducationToCandidate(Model model, @RequestParam("idCandidate") int idCandidate,
			Education education, @RequestParam("idDegreeType") int idDegreeType) {
		Candidate candidate = candidateRep.findById(idCandidate).get();
		EducationDegreeType e = educationDegreeTypeRep.findById(idDegreeType).get();
		education.setEducationDegreeType(e);
		education.setCandidate(candidate);
		educationRep.saveAndFlush(education);
		List<EducationDegreeType> degreeType = educationDegreeTypeRep.findAll();
		model.addAttribute("degreeType", degreeType);
		model.addAttribute("candidate", candidate);
		boolean reload = true;
		model.addAttribute("reload", reload);
		List<Education> educationsOfCandidate = candidate.getEducations();
		List<WorkExperience> workExpOfCandidate = candidate.getWorkExperiences();

		model.addAttribute("educationsOfCandidate", educationsOfCandidate);
		model.addAttribute("workExpOfCandidate", workExpOfCandidate);
		model.addAttribute("toastMessage", educationsOfCandidate.size() + " educations added!");
		model.addAttribute("showToast", true);

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
		List<EducationDegreeType> educations = educationDegreeTypeRep.findAll();
		List<Candidate> candidates = candidateRep.findAll();
		model.addAttribute("idEducationFound", education);
		model.addAttribute("candidates", candidates);
		model.addAttribute("educationsdegree", educations);

		return "education/resultsFindById";
	}

	@PostMapping("/updateEducation")
	public String updateEducation(Model model, Education education) {
		educationRep.save(education);
		List <Candidate> candidates =candidateRep.findAll();
        model.addAttribute("candidates", candidates);
        model.addAttribute("toastMessage", " candidate updated!");
        model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
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
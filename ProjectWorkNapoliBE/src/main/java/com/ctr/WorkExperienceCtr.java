package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CandidateRepository;
import com.dao.EducationDegreeTypeRepository;
import com.dao.WorkExperienceRepository;
import com.model.Candidate;
import com.model.Education;
import com.model.EducationDegreeType;
import com.model.WorkExperience;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("workExpCtr")
public class WorkExperienceCtr {

	@Autowired
    private WorkExperienceRepository workExperienceRep;
	
	@Autowired
	public CandidateRepository candidateRep;
	
	@Autowired
	private EducationDegreeTypeRepository educationDegreeTypeRep;
	
	@GetMapping("/indexWorkExp")
    public String home(Model model) {
		

        return "workExperience/indexWorkExp";
        
    }
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toAdd")
    public String toAddWorkExperience(Model model, HttpServletRequest request) {
		
		List<Candidate> candidates = candidateRep.findAll();
		
		model.addAttribute("candidates", candidates);
		
		return "workExperience/addWorkExp";
        
    }
	
	@GetMapping("/addWorkExp")
    public String addWorkExperience(Model model, WorkExperience w) {

		workExperienceRep.save(w);
		List<Candidate> candidates = candidateRep.findAll();
		
		model.addAttribute("candidates", candidates);
		
		model.addAttribute("toastMessage", "work experience added!");
		model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
        
    }
	
	@PostMapping("/addWorkExpToCandidate")
	public String addWorkExpToCandidate(Model model, @RequestParam("idCandidate") int idCandidate, WorkExperience w) {
		Candidate candidate = candidateRep.findById(idCandidate).get();
		w.setCandidate(candidate);
		workExperienceRep.save(w);
		model.addAttribute("candidate", candidate);
		boolean reloadW = true;
		model.addAttribute("reloadW", reloadW);
		List<WorkExperience> workExpOfCandidate = candidate.getWorkExperiences();
		model.addAttribute("workExpOfCandidate", workExpOfCandidate);
		List<EducationDegreeType> degreeType = educationDegreeTypeRep.findAll();
		model.addAttribute("degreeType", degreeType);
		model.addAttribute("toastMessage", workExpOfCandidate.size() + " work experiences added!");
		model.addAttribute("showToast", true);
			
		return "candidate/AddMoreDetails";
	
	}

	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/tofindById")
    public String tofindById() {
		return "workExperience/researchById";
    }
	
	@GetMapping("findById")
    public String findById(@RequestParam("id") Integer id, Model model, @RequestParam("tipoOp") String tipoOp) {
    	
		WorkExperience workExpFound = workExperienceRep.findById(id).get();
		model.addAttribute("workExpFound", workExpFound);
		
		if (tipoOp.equals("update")) {
			return "workExperience/updateWorkExp";
		}
		else {
			return "workExperience/resResearchById";
		}
    	
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toDeleteById")
    public String toDeleteById() {
		return "workExperience/deleteById";
    }
	
    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") String id, HttpServletRequest request) {
    	int i = Integer.parseInt(request.getParameter("id"));
    	
    	workExperienceRep.deleteById(i);
    	return "workExperience/ok";
    }
    
	//////////////////////////////////////////////////////////////////////////////////
    
	@GetMapping("/toUpdateById")
    public String toUpdateById() {
		return "workExperience/updateById";
    }
	
    
	@GetMapping("/update")
    public String update(Model model, WorkExperience w) {

		workExperienceRep.save(w);
		model.addAttribute("workExpUpdated", w);
        return "workExperience/resUpdateWorkExp";
    }

}

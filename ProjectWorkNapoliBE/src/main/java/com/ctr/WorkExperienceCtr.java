package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.WorkExperienceRepository;
import com.model.WorkExperience;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("workExpCtr")
public class WorkExperienceCtr {
	
	@Autowired
    private WorkExperienceRepository workExperienceRep;
	
	@GetMapping("/indexWorkExp")
    public String home(Model model) {

        return "workExperience/indexWorkExp";
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toAdd")
    public String toAddWorkExperience(Model model, HttpServletRequest request) {
		
		return "workExperience/addWorkExp";
        
    }
	
	@GetMapping("/addWorkExp")
    public String addWorkExperience(Model model, WorkExperience w) {

		workExperienceRep.save(w);
        return "workExperience/ok";
        
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

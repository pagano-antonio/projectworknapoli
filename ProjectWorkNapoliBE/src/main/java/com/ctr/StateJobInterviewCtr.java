package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.StateJobInterviewRepository;
import com.model.StateJobInterview;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("stateJobIntCtr")
public class StateJobInterviewCtr {
	
	@Autowired
	private StateJobInterviewRepository StateJobInterviewRep;

	@GetMapping("/indexStateInterv")
    public String home(Model model) {

        return "stateInterview/indexStateInterv";
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toAdd")
    public String toAddstateInterview(Model model, HttpServletRequest request) {
		
		return "stateInterview/addStateInterview";
        
    }
	
	@GetMapping("/addStateInterview")
    public String addWorkExperience(Model model, StateJobInterview s) {

		StateJobInterviewRep.save(s);
        return "stateInterview/ok";
        
    }

	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/tofindById")
    public String tofindById() {
		return "stateInterview/researchById";
    }
	
	@GetMapping("findById")
    public String findById(@RequestParam("id") Integer id, Model model, @RequestParam("tipoOp") String tipoOp) {
    	
		StateJobInterview stateJobFound = StateJobInterviewRep.findById(id).get();
		model.addAttribute("stateJobFound", stateJobFound);
		
		if (tipoOp.equals("update")) {
			return "stateInterview/updateStateInterview";
		}
		else {
			return "stateInterview/resResearchById";
		}
    	
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toDeleteById")
    public String toDeleteById() {
		return "stateInterview/deleteById";
    }
	
    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") Integer id) {
    	
    	StateJobInterviewRep.deleteById(id);
    	return "stateInterview/ok";
    }
    
	//////////////////////////////////////////////////////////////////////////////////
    
	@GetMapping("/toUpdateById")
    public String toUpdateById() {
		return "stateInterview/updateById";
    }
	
    
	@GetMapping("/update")
    public String update(Model model, StateJobInterview s) {

		StateJobInterviewRep.save(s);
		model.addAttribute("stateJobUpdated", s);
        return "stateInterview/resUpdateStateInterview";
    }
}

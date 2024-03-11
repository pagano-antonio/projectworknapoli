package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.SkillRepository;
import com.model.Skill;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("skillCtr")
public class SkillCtr {
	
	@Autowired
    private SkillRepository SkillRep;
	
	@GetMapping("/indexSkill")
    public String home(Model model) {

        return "skill/indexSkill";
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toAdd")
    public String toAddWorkExperience(Model model, HttpServletRequest request) {
		
		return "skill/addSkill";
        
    }
	
	@GetMapping("/addSkill")
    public String addSkill(Model model, Skill s) {

		SkillRep.save(s);
        return "skill/ok";
        
    }

	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/tofindById")
    public String tofindById() {
		return "skill/researchById";
    }
	
	@GetMapping("findById")
    public String findById(@RequestParam("id") Integer id, Model model, @RequestParam("tipoOp") String tipoOp) {
    	
		Skill skillFound = SkillRep.findById(id).get();
		model.addAttribute("skillFound", skillFound);
		
		if (tipoOp.equals("update")) {
			return "skill/updateSkill";
		}
		else {
			return "skill/resResearchById";
		}
    	
    }
	
	//////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/toDeleteById")
    public String toDeleteById() {
		return "skill/deleteById";
    }
	
    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") Integer id, HttpServletRequest request) {
    	SkillRep.deleteById(id);
    	return "skill/ok";
    }
    
	//////////////////////////////////////////////////////////////////////////////////
    
	@GetMapping("/toUpdateById")
    public String toUpdateById() {
		return "skill/updateById";
    }
	
    
	@GetMapping("/update")
    public String update(Model model, Skill s) {

		SkillRep.save(s);
		model.addAttribute("skillUpdated", s);
        return "skill/resUpdateSkill";
    }

}

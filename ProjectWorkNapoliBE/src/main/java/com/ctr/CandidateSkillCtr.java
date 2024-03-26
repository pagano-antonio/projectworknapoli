package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CandidateRepository;
import com.dao.CandidateSkillRepository;
import com.dao.SkillRepository;
import com.model.Candidate;
import com.model.CandidateSkill;
import com.model.Skill;

@Controller
@RequestMapping("CandidateSkillCtr")
public class CandidateSkillCtr {

	@Autowired
	public CandidateSkillRepository candidateSkillRep;
	
	@Autowired
	public CandidateRepository candidateRep;
	
	@Autowired
	public SkillRepository skillRep;
	
	//////////////////////////////////////////////////////////
	
	@GetMapping("/preFindById")
	public String preFindById() {
		
		return "candidateSkill/findById";
	}
	
	
	@GetMapping("/findById")
	public String findById(Model model, Integer idCandidateSkill) {
		CandidateSkill cs = candidateSkillRep.findById(idCandidateSkill).get();
		model.addAttribute("findById",cs);
		return "candidateSkill/findByIdResults";
	}
	
	////////////////////////////////////////////////////////////
	
	
	@GetMapping("/preAddCandidateSkill")
	public String preAddCandidateSkill (Model model) {
		
		List <Candidate> candidates = candidateRep.findAll();
		model.addAttribute("candidates", candidates);
		
		
		List <Skill> skills = skillRep.findAll();
		model.addAttribute("skills", skills);
		
		return "candidateSkill/addCandidateSkill";
	}
	
	@GetMapping("/addCandidateSkill")
	public String addCandidateSkill(Model model, CandidateSkill cs) {
		candidateSkillRep.save(cs);
		
		List <Candidate> candidates =candidateRep.findAll();
        model.addAttribute("candidates", candidates);
        model.addAttribute("toastMessage", "skill added!");
        model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
		
	}
	
	///////////////////////////////////////////////////////////////
	
	@GetMapping("preUpdateCandidateSkill")
	public String preUpdateCandidateSkill() {
		return "candidateSkill/updateById";
	}
	
	@GetMapping("findByIdToUpdate")
	public String findByIdToUpdateCandidateSkill(Model model, Integer idCandidateSkill) {
		CandidateSkill cs = candidateSkillRep.findById(idCandidateSkill).get();
		model.addAttribute("candidateskill", cs);
		return "candidateSkill/updateCandidateSkill";
	}
	
	@GetMapping("updateCandidateSkill")
	public String updateCandidateSkill(Model model, CandidateSkill cs) {
		candidateSkillRep.save(cs);
		List <Candidate> candidates =candidateRep.findAll();
        model.addAttribute("candidates", candidates);
        model.addAttribute("toastMessage", "skill updated");
        model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCandidateSkill")
	public String preDeleteCandidateSkill () {
		return "candidateSkill/deleteCandidateSkill";
	}
	
	@GetMapping("deleteCandidateSkill")
	public String deleteCandidateSkill (Model model, Integer idCandidateSkill) {
		candidateSkillRep.deleteById(idCandidateSkill);
		List <Candidate> candidates =candidateRep.findAll();
        model.addAttribute("candidates", candidates);
        model.addAttribute("toastMessage", "skill deleted!");
        model.addAttribute("showToast", true);
        return "candidate/candidateListResults";
	}
}

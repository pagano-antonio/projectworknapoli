package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CandidateSkillRepository;
import com.model.CandidateSkill;

@Controller
@RequestMapping("CandidateSkillCtr")
public class CandidateSkillCtr {

	@Autowired
	public CandidateSkillRepository candidateSkillRep;
	
	//////////////////////////////////////////////////////////
	
	@GetMapping("/preFindById")
	public String preFindById() {
		
		return "candidateCommercial/findById";
	}
	
	
	@GetMapping("/findById")
	public String findById(Model model, Integer idCandidateSkill) {
		CandidateSkill cs = candidateSkillRep.findById(idCandidateSkill).get();
		model.addAttribute("findById",cs);
		return "candidateSkill/findByIdResults";
	}
	
	////////////////////////////////////////////////////////////
	
	
	@GetMapping("/preAddCandidateSkill")
	public String preAddCandidateSkill () {
		return "candidateSkill/addCandidateSkill";
	}
	
	@GetMapping("/addCandidateSkill")
	public String addCandidateSkill(Model model, CandidateSkill cs) {
		candidateSkillRep.save(cs);
		return "candidateSkill/addCandidateSkillResults";
	}
	
	///////////////////////////////////////////////////////////////
	
	@GetMapping("preUpdateCandidateSkill")
	public String preUpdateCandidateSkill() {
		return "candidateCommercial/updateById";
	}
	
	@GetMapping("findByIdToUpdate")
	public String findByIdToUpdateCandidateSkill(Model model, Integer idCandidateSkill) {
		CandidateSkill cs = candidateSkillRep.findById(idCandidateSkill).get();
		return "candidateSkill/updateCandidateSkill";
	}
	
	@GetMapping("updateCandidateSkill")
	public String updateCandidateSkill(Model model, CandidateSkill cs) {
		candidateSkillRep.save(cs);
		return "candidateSkill/updateCandidateSkillResults";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCandidateSkill")
	public String preDeleteCandidateSkill () {
		return "candidateSkill/deleteCandidateSkill";
	}
	
	@GetMapping("deleteCandidateSkill")
	public String deleteCandidateSkill (Model model, Integer idCandidateSkill) {
		candidateSkillRep.deleteById(idCandidateSkill);
		return "candidateSkill/deleteCandidateSkillResults";
	}
}

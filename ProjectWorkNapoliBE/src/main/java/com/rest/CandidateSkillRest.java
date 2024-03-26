package com.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.CandidateSkillRepository;
import com.model.CandidateSkill;

@RestController
@RequestMapping("CandidateSkillRest")
@CrossOrigin
public class CandidateSkillRest {
	@Autowired
	private CandidateSkillRepository candidateSkillRep;

	@GetMapping("findById/{idCandidateSkill}")
	public CandidateSkill findById(@PathVariable("idCandidateSkill") Integer idCandidateSkill) {
		CandidateSkill cs = candidateSkillRep.findById(idCandidateSkill).get();
		return cs;
	}

	@PostMapping("addCandidateSkill")
	public String addCandidate(@RequestBody CandidateSkill cs) {
		candidateSkillRep.save(cs);
		return "Ok, inserito";
	}

	@PutMapping("updateCandidateSkill")
	public String updateCandidate(@RequestBody CandidateSkill cs) {
		candidateSkillRep.save(cs);
		return "Ok, aggiornata";
	}

	@DeleteMapping("deleteCandidate/{idCandidateSkill}")
	public String deleteCandidate(@PathVariable("idCandidateSkill") Integer idCandidateSkill) {
		candidateSkillRep.deleteById(idCandidateSkill);
		return "Ok, eliminata";
	}

	@PostMapping("addSkills")
	public int addSkills(@RequestBody List<CandidateSkill> cs) {
		candidateSkillRep.saveAll(cs);
		return 200;
	}

}

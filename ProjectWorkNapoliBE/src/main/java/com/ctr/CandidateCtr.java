package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CandidateRepository;
import com.model.Candidate;


@Controller
@RequestMapping("CandidateCtr")
public class CandidateCtr {


	@Autowired
	public CandidateRepository candidateRep;
	
	////////////////////////////////////////////////////////////////////////
	@GetMapping("/preFindById")
	public String preFindById() {
		
		return "candidate/findById";
	}
	
	
	@GetMapping("/findById")
	public String findById(Model model, Integer idCandidate) {
		Candidate c = candidateRep.findById(idCandidate).get();
		model.addAttribute("findById",c);
		return "candidate/findByIdResults";
	}
	
	////////////////////////////////////////////////////////////
	
	
	@GetMapping("/preAddCandidate")
	public String preAddCandidate () {
		return "candidate/addCandidate";
	}
	
	@GetMapping("/addCandidate")
	public String addCandidate(Model model, Candidate c) {
		candidateRep.save(c);
		return "candidate/Ok";
	}
	
	///////////////////////////////////////////////////////////////
	
	@GetMapping("preUpdateCandidate")
	public String preUpdateCandidate() {
		return "candidate/updateById";
	}
	
	@GetMapping("findByIdToUpdate")
	public String findByIdToUpdateCandidate(Model model, Integer idCandidate) {
		Candidate c = candidateRep.findById(idCandidate).get();
		model.addAttribute( "findToUpdateCandidate", c);
		return "candidate/updateCandidate";
	}
	
	@GetMapping("updateCandidate")
	public String updateCandidate(Model model, Candidate c) {
		candidateRep.save(c);
		return "candidate/Ok";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCandidate")
	public String preDeleteCandidate () {
		return "candidate/deleteCandidate";
	}
	
	@GetMapping("deleteCandidate")
	public String deleteCandidate (Model model, Integer idCandidate) {
		candidateRep.deleteById(idCandidate);
		return "candidate/Ok";
	}
	
}

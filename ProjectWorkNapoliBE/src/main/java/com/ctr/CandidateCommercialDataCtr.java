package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CandidateCommercialDataRepository;
import com.dao.CandidateRepository;
import com.model.Candidate;
import com.model.CandidateCommercialData;

@Controller
@RequestMapping("CandidateCommercialCtr")
public class CandidateCommercialDataCtr {

	@Autowired
	public CandidateCommercialDataRepository candidateCommercialRep;
	@Autowired
	public CandidateRepository candidateRep;
	
	////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/preFindById")
	public String preFindById() {
		
		return "candidateCommercial/findById";
	}
	
	
	@GetMapping("/findById")
	public String findById(Model model, Integer idCandidateCommercial) {
		CandidateCommercialData ccd = candidateCommercialRep.findById(idCandidateCommercial).get();
		model.addAttribute("findById",ccd);
		return "candidateCommercial/findByIdResults";
	}
	
	////////////////////////////////////////////////////////////
	
	
	@GetMapping("/preAddCandidateCommercial")
	public String preAddCandidateCommercial (Model model) {
		List <Candidate> candidates = candidateRep.findAll();
		model.addAttribute("candidates", candidates);
		return "candidateCommercial/addCandidateCommercial";
	}
	
	@GetMapping("/addCandidateCommercial")
	public String addCandidateCommercial(Model model, CandidateCommercialData ccd) {
		
		candidateCommercialRep.save(ccd);
		
		return "candidateCommercial/Ok";
	}
	
	///////////////////////////////////////////////////////////////
	
	@GetMapping("preUpdateCandidateCommercial")
	public String preUpdateCandidateCommercial() {
		return "candidateCommercial/updateById";
	}
	
	@GetMapping("findByIdToUpdate")
	public String findByIdToUpdateCandidateCommercial(Model model, @RequestParam("idCandidateCommercial") Integer idCandidateCommercial) {
		CandidateCommercialData ccd = candidateCommercialRep.findById(idCandidateCommercial).get();
		model.addAttribute("candidatecommercial", ccd);
		return "candidateCommercial/updateCandidateCommercial";
	}
	
	@GetMapping("updateCandidateCommercial")
	public String updateCandidateCommercial(Model model, CandidateCommercialData ccd) {
		candidateCommercialRep.save(ccd);
		return "candidateCommercial/Ok";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCandidateCommercial")
	public String preDeleteCandidateCommercial () {
		return "candidateCommercial/deleteCandidateCommercial";
	}
	
	@GetMapping("deleteCandidateCommercial")
	public String deleteCandidateCommercial (Model model, @RequestParam("idCandidateCommercial") Integer idCandidateCommercial) {
		candidateCommercialRep.deleteById(idCandidateCommercial);
		return "candidateCommercial/Ok";
	}
}

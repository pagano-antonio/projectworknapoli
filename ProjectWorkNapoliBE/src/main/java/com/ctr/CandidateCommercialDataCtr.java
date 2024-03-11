package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CandidateCommercialDataRepository;
import com.model.CandidateCommercialData;

@Controller
@RequestMapping("CandidateCommercialCtr")
public class CandidateCommercialDataCtr {

	@Autowired
	public CandidateCommercialDataRepository candidateCommercialRep;
	
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
	public String preAddCandidateCommercial () {
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
	public String findByIdToUpdateCandidateCommercial(Model model, Integer idCandidateCommercial) {
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
	public String deleteCandidateCommercial (Model model, Integer idCandidateCommercial) {
		candidateCommercialRep.deleteById(idCandidateCommercial);
		return "candidateCommercial/Ok";
	}
}

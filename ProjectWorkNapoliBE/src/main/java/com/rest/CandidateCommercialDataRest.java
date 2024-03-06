package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.CandidateCommercialDataRepository;
import com.model.CandidateCommercialData;




@RestController
@RequestMapping("CandidateCommercialDataRest")
public class CandidateCommercialDataRest {
		
		@Autowired
		private CandidateCommercialDataRepository candidateCommercialDataRep;
		
		@GetMapping("findById/{id}")
		public CandidateCommercialData findById(@PathVariable ("id") Integer id) {
			CandidateCommercialData ccd = candidateCommercialDataRep.findById(id).get();
			return ccd;
		}
		
		@PostMapping("addCandidateCommercialData")
		public String addCandidate(@RequestBody CandidateCommercialData ccd) {
			candidateCommercialDataRep.save(ccd);
	    	return "Ok, inserito";
		}
		
		@PutMapping("updateCandidateCommercialData")
		  public String updateCandidate(@RequestBody CandidateCommercialData ccd ) {
		    	candidateCommercialDataRep.save(ccd);
		    	return "Ok, aggiornato";
		  }
		  
		  @DeleteMapping("deleteCandidateCommercialData/{id}")
		  public String deleteCandidate (@PathVariable("id") Integer id) {
		    	candidateCommercialDataRep.deleteById(id);
		    	return "Ok, eliminato";
		  }
}
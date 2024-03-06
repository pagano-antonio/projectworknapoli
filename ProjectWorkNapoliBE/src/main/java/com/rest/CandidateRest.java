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

import com.dao.CandidateRepository;
import com.model.Candidate;


@RestController
@RequestMapping("CandidateRest")
public class CandidateRest {
	
	@Autowired
	private CandidateRepository candidateRep;
	
	@GetMapping("findById/{idCandidate}")
	public Candidate findById(@PathVariable ("idCandidate") Integer idCandidate) {
		Candidate c = candidateRep.findById(idCandidate).get();
		return c;
	}
	
	@PostMapping("addCandidate")
	public String addCandidate(@RequestBody Candidate c) {
		candidateRep.save(c);
    	return "Ok, inserito";
	}
	
	@PutMapping("updateCandidate")
	  public String updateCandidate(@RequestBody Candidate c ) {
	    	candidateRep.save(c);
	    	return "Ok, aggiornata";
	  }
	  
	  @DeleteMapping("deleteCandidate/{idCandidate}")
	  public String deleteCandidate (@PathVariable("idCandidate") Integer idCandidate) {
	    	candidateRep.deleteById(idCandidate);
	    	return "Ok, eliminata";
	  }
}

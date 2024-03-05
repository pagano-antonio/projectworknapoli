package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.CandidateRepository;
import com.model.Candidate;


@RestController
@RequestMapping("Candidate")
public class CandidateRest {
	
	@Autowired
	private CandidateRepository candidateRep;
	
	@GetMapping("findById/{id}")
	public Candidate findById(@PathVariable ("id") int id) {
		Candidate c = candidateRep.findById(id).get();
		return c;
	}
	
	@PostMapping("addCandidate")
	public String addCandidate(@RequestBody Candidate c) {
		candidateRep.save(c);
    	return "Ok, inserito";
	}
}

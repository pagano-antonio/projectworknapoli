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

import com.dao.CandidateRepository;
import com.dto.CandidateDTO;
import com.model.Candidate;
import com.model.SearchRequest;

@RestController
@RequestMapping("CandidateRest")
@CrossOrigin
public class CandidateRest {

	@Autowired
	private CandidateRepository candidateRep;

	@PostMapping("/searchCandidate")
	public List<Candidate> searchCandidate(@RequestBody SearchRequest request) {
		List<Candidate> candidates = candidateRep.findByCriteria(request.getCandidate().getName(),
				request.getCandidate().getSurname(), request.getCandidate().getBirthPlace(),
				request.getCandidate().getBirthday(), request.getCandidate().getCity(),
				request.getCandidate().getAddress(), request.getCandidate().getEmail(),
				request.getCandidate().getPhone(), request.getSelectedSkills(), request.getDegree(),
				request.getJobinterview(), request.getDateAfter(), request.getCompany());

		System.out.println("risultati candidati: " + candidates.size());
		return candidates;
	}

	@GetMapping("/getCandidates")
	public List<Candidate> getCandidates() {
		List<Candidate> candidates = candidateRep.findAll();

		return candidates;
	}

	@GetMapping("findById/{idCandidate}")
	public Candidate findById(@PathVariable("idCandidate") Integer idCandidate) {
		Candidate c = candidateRep.findById(idCandidate).get();
		return c;
	}

	@PostMapping("addCandidate")
	public Candidate addCandidate(@RequestBody Candidate c) {
		System.out.println("salvo il candidato: " + c);
		Candidate saved = candidateRep.save(c);
		return saved;
	}

	@PutMapping("updateCandidate")
	public String updateCandidate(@RequestBody Candidate c) {
		candidateRep.save(c);
		return "Ok, aggiornata";
	}

	@DeleteMapping("deleteCandidate/{idCandidate}")
	public String deleteCandidate(@PathVariable("idCandidate") Integer idCandidate) {
		candidateRep.deleteById(idCandidate);
		return "Ok, eliminata";
	}

	@PostMapping("/updateCandidateDTO")
	public String updateCandidateDTO(@RequestBody CandidateDTO c) {
		System.out.println(c);
		return "Ok, eliminata";
	}
}

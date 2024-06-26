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

import com.dao.CandidateCommercialDataRepository;
import com.dao.CandidateRepository;
import com.model.Candidate;
import com.model.CandidateCommercialData;

@CrossOrigin
@RestController
@RequestMapping("CandidateCommercialDataRest")
public class CandidateCommercialDataRest {

	@Autowired
	private CandidateCommercialDataRepository candidateCommercialDataRep;
	@Autowired
	private CandidateRepository candidateRep;

	@PostMapping("addCommercialData")
	public int addCommercialData(@RequestBody List<CandidateCommercialData> ccd) {
		Candidate c = candidateRep.findById(ccd.get(0).getIdCandidateCD()).get();
		for (CandidateCommercialData cc : ccd) {
			cc.setCandidate(c);
		}

		candidateCommercialDataRep.saveAll(ccd);
		return 200;
	}

	@GetMapping("findById/{idCandidateCommercial}")
	public CandidateCommercialData findById(@PathVariable("idCandidateCommercial") Integer idCandidateCommercial) {
		CandidateCommercialData ccd = candidateCommercialDataRep.findById(idCandidateCommercial).get();
		return ccd;
	}

	@PostMapping("addCandidateCommercialData")
	public String addCandidate(@RequestBody CandidateCommercialData ccd) {
		candidateCommercialDataRep.save(ccd);
		return "Ok, inserito";
	}

	@PutMapping("updateCandidateCommercialData")
	public String updateCandidate(@RequestBody CandidateCommercialData ccd) {
		candidateCommercialDataRep.save(ccd);
		return "Ok, aggiornato";
	}

	@DeleteMapping("deleteCandidateCommercialData/{idCandidateCommercial}")
	public String deleteCandidate(@PathVariable("idCandidateCommercial}") Integer idCandidateCommercial) {
		candidateCommercialDataRep.deleteById(idCandidateCommercial);
		return "Ok, eliminato";
	}
}

package com.ctr;

import java.math.BigInteger;
import java.util.List;

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
		model.addAttribute("findById", c);
		return "candidate/findByIdResults";
	}

	////////////////////////////////////////////////////////////

	@GetMapping("/preAddCandidate")
	public String preAddCandidate() {
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
		model.addAttribute("findToUpdateCandidate", c);
		return "candidate/updateCandidate";
	}

	@GetMapping("updateCandidate")
	public String updateCandidate(Model model, Candidate c) {
		candidateRep.save(c);
		return "candidate/Ok";
	}

	///////////////////////////////////////////////////////////////////////

	@GetMapping("preDeleteCandidate")
	public String preDeleteCandidate() {
		return "candidate/deleteCandidate";
	}

	@GetMapping("deleteCandidate")
	public String deleteCandidate(Model model, Integer idCandidate) {
		candidateRep.deleteById(idCandidate);
		return "candidate/Ok";
	}

	///////////////////////////////////////////////////////////////////////

	@GetMapping("/preFindBySurname")
	public String preFindBySurname() {

		return "candidate/findBySurname";
	}

	@GetMapping("/findBySurname")
	public String findBySurname(Model model, String surname) {
		List<Candidate> listaCandidati = candidateRep.findBySurname(surname);
		model.addAttribute("findBySurname", listaCandidati);

		return "candidate/findBySurnameResults";
	}

	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("/preFindByPhone")
	public String preFindByPhone() {

		return "candidate/findByPhone";
	}

	@GetMapping("/findByPhone")
	public String findByPhone(Model model, BigInteger phone) {
		List<Candidate> listaCandidati = candidateRep.findByPhone(phone);
		model.addAttribute("findByPhone", listaCandidati);

		return "candidate/findByPhoneResults";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("/preFindByCity")
	public String preFindByCity() {

		return "candidate/findByCity";
	}

	@GetMapping("/findByCity")
	public String findByCity(Model model, String city) {
		List<Candidate> listaCandidati = candidateRep.findByCity(city);
		model.addAttribute("findByCity", listaCandidati);

		return "candidate/findByCityResults";
	}
	
	///////////////////////////////////////////////////////////////////////
	
}
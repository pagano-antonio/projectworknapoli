package com.ctr;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CandidateRepository;
import com.model.Candidate;

@Controller
@RequestMapping("CandidateCtr")
public class CandidateCtr {

	@Autowired
	public CandidateRepository candidateRep;

	////////////////////////////////////////////////////////////////////////

	@GetMapping("/searchCandidateForm")
	public String searchCandidateForm() {

		return "candidate/searchCandidate";
	}

	@PostMapping("/searchCandidate")
	public String searchCandidate(Model model, Candidate candidate) {
		System.out.println(candidate.getPhone());
		List<Candidate> candidates = candidateRep.findByCriteria(candidate.getName(), candidate.getSurname(),
				candidate.getBirthPlace(), candidate.getBirthday(), candidate.getCity(), candidate.getAddress(),
				candidate.getEmail(), candidate.getPhone());
		System.out.println("risultati candidati: " + candidates.size());

		if (candidates.size() == 1) {
			model.addAttribute("toastMessage", candidates.size() + " candidate founded!");

		} else {
			model.addAttribute("toastMessage", candidates.size() + " candidates founded!");
		}
		model.addAttribute("showToast", true);

		model.addAttribute("candidates", candidates);
		System.out.println("risultati");
		return "candidate/candidateListResults";
	}

	@GetMapping("/preFindById")
	public String preFindById() {

		return "candidate/findById";
	}

	@GetMapping("/findById")
	public String findById(Model model, Integer idCandidate) {
		Candidate c = candidateRep.findById(idCandidate).get();
		List <Candidate> candidates = new ArrayList<>();
		candidates.add(c);
		model.addAttribute("candidates", candidates);
		model.addAttribute("toastMessage", candidates.size() + " candidate founded!");
		model.addAttribute("showToast", true);
		return "candidate/candidateListResults";
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
	public String findByIdToUpdateCandidate( Model model,Integer idCandidate) {
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

}

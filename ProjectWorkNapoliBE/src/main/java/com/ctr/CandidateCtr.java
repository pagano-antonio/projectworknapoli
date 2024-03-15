package com.ctr;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CandidateRepository;
import com.dao.ContractTypeRepository;
import com.dao.EducationDegreeTypeRepository;
import com.dao.EducationRepository;
import com.dao.SkillRepository;
import com.dao.StateJobInterviewRepository;
import com.dao.WorkExperienceRepository;
import com.model.Candidate;
import com.model.Education;
import com.model.EducationDegreeType;
import com.model.Skill;
import com.model.StateJobInterview;
import com.model.WorkExperience;

import jakarta.transaction.Transactional;

@Controller
@RequestMapping("CandidateCtr")
public class CandidateCtr {

	@Autowired
	public CandidateRepository candidateRep;

	@Autowired
	private SkillRepository SkillRep;

	@Autowired
	private EducationDegreeTypeRepository educationDegreeTypeRep;

	@Autowired
	private ContractTypeRepository contractTypeRep;

	@Autowired
	private StateJobInterviewRepository stateJobInterviewRepositoryRep;
	
	@Autowired
    private WorkExperienceRepository workExperienceRep;

	@Autowired
	public EducationRepository educationRep;

	////////////////////////////////////////////////////////////////////////

	@GetMapping("/searchCandidateForm")
	public String searchCandidateForm(Model model) {
		List<Skill> skills = SkillRep.findAll();
		List<EducationDegreeType> degrees = educationDegreeTypeRep.findAll();
		List<StateJobInterview> stateJobInterviews = stateJobInterviewRepositoryRep.findAll();
		model.addAttribute("stateJobInterviews", stateJobInterviews);
		model.addAttribute("skills", skills);
		model.addAttribute("degrees", degrees);

		return "candidate/searchCandidate";
	}

	@PostMapping("/searchCandidate")
	public String searchCandidate(Model model, Candidate candidate,
			@RequestParam(name = "selectedSkills", required = false) List<Integer> selectedSkills,
			@RequestParam(name = "degree", required = false) Integer degree,
			@RequestParam(name = "jobinterview", required = false) Integer jobinterview,
			@RequestParam(name = "dateAfter", required = false) LocalDate dateAfter) {
		System.out.println(candidate.getPhone());
		List<Candidate> candidates = candidateRep.findByCriteria(candidate.getName(), candidate.getSurname(),
				candidate.getBirthPlace(), candidate.getBirthday(), candidate.getCity(), candidate.getAddress(),
				candidate.getEmail(), candidate.getPhone(), selectedSkills != null ? selectedSkills : null, degree,
				jobinterview, dateAfter);
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

	@Transactional
	@PostMapping("/addCandidate")
	public String addCandidate(Model model, Candidate c) {
		
		Candidate candidate = candidateRep.saveAndFlush(c);

		List<EducationDegreeType> degreeType = educationDegreeTypeRep.findAll();
		model.addAttribute("degreeType", degreeType);
	
		model.addAttribute("candidate", candidate);
		
		return "candidate/AddMoreDetails";
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

package com.rest;

import java.time.LocalDate;
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
import com.dao.CandidateSkillRepository;
import com.dao.EducationRepository;
import com.dao.WorkExperienceRepository;
import com.dto.CandidateDTO;
import com.model.Candidate;
import com.model.CandidateCommercialData;
import com.model.CandidateSkill;
import com.model.Education;
import com.model.SearchRequest;
import com.model.Skill;
import com.model.WorkExperience;

@RestController
@RequestMapping("CandidateRest")
@CrossOrigin
public class CandidateRest {

	@Autowired
	private CandidateRepository candidateRep;
	@Autowired
	private CandidateSkillRepository candidateSkillRep;

	@Autowired
	private EducationRepository educationRep;

	@Autowired
	private WorkExperienceRepository workRep;

	@Autowired
	private CandidateCommercialDataRepository comRep;

	@PostMapping("/searchCandidate")
	public List<Candidate> searchCandidate(@RequestBody SearchRequest request) {
		LocalDate birthdayPlusOneDay = null;
		if (request.getCandidate().getBirthday() != null) {
			birthdayPlusOneDay = request.getCandidate().getBirthday().plusDays(1);
			System.out.println(birthdayPlusOneDay);
		}

		LocalDate afterPlusOneDay = null;
		if (request.getDateAfter() != null) {
			afterPlusOneDay = request.getDateAfter().plusDays(1);
			System.out.println(afterPlusOneDay);
		}

		List<Candidate> candidates = candidateRep.findByCriteria(request.getCandidate().getName(),
				request.getCandidate().getSurname(), request.getCandidate().getBirthPlace(), birthdayPlusOneDay,
				request.getCandidate().getCity(), request.getCandidate().getAddress(),
				request.getCandidate().getEmail(), request.getCandidate().getPhone(), request.getSelectedSkills(),
				request.getDegree(), request.getJobinterview(), afterPlusOneDay, request.getCompany());

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
	public int deleteCandidate(@PathVariable("idCandidate") Integer idCandidate) {
		candidateRep.deleteById(idCandidate);
		return 200;
	}

	@PostMapping("/updateCandidateDTO")
	public int updateCandidateDTO(@RequestBody CandidateDTO c) {

		Candidate toUpdate = new Candidate();
		toUpdate.setIdCandidate(c.getIdCandidate());
		toUpdate.setName(c.getName());
		toUpdate.setSurname(c.getSurname());
		toUpdate.setAddress(c.getAddress());
		toUpdate.setBirthday(c.getBirthday());
		toUpdate.setBirthPlace(c.getBirthPlace());
		toUpdate.setCity(c.getCity());
		toUpdate.setEmail(c.getEmail());
		toUpdate.setPhone(c.getPhone());

		System.out.println(toUpdate.getIdCandidate());

		candidateSkillRep.deleteByCandidateIdCandidate(toUpdate.getIdCandidate());
		System.out.println("delete skills ok");

		System.out.println(c.getSkills());
		for (Skill s : c.getSkills()) {
			System.out.println(s);
			CandidateSkill sk = new CandidateSkill();
			sk.setCandidate(toUpdate);
			sk.setSkill(s);
			candidateSkillRep.save(sk);
		}

		System.out.println("save skills ok");

		educationRep.deleteByCandidateIdCandidate(toUpdate.getIdCandidate());

		for (Education d : c.getEducations()) {
			Education dNew = new Education();
			dNew.setCandidate(toUpdate);
			dNew.setDate(d.getDate());
			dNew.setEducationDegreeType(d.getEducationDegreeType());
			dNew.setFinalGrade(d.getFinalGrade());
			dNew.setPlace(d.getPlace());
			dNew.setSchoolName(d.getSchoolName());
			educationRep.save(dNew);

		}
		System.out.println("save education ok");

		workRep.deleteByCandidateIdCandidate(toUpdate.getIdCandidate());

		for (WorkExperience w : c.getWorkExperiences()) {
			WorkExperience wNew = new WorkExperience();
			wNew.setCandidate(toUpdate);
			wNew.setCity(w.getCity());
			wNew.setCompany(w.getCompany());
			wNew.setStartDate(w.getStartDate());
			wNew.setDescription(w.getDescription());
			wNew.setEndDate(w.getEndDate());
			wNew.setTitle(w.getTitle());

			workRep.save(wNew);

		}

		System.out.println("save work ok " + toUpdate.getIdCandidate());

		comRep.deleteByCandidateIdCandidate(toUpdate.getIdCandidate());

		for (CandidateCommercialData ccd : c.getCommercialData()) {
			CandidateCommercialData cNew = new CandidateCommercialData();
			cNew.setCandidate(toUpdate);
			cNew.setBusinessCost(ccd.getBusinessCost());
			cNew.setCurrentRal(ccd.getCurrentRal());
			cNew.setMonthRefund(ccd.getMonthRefund());
			cNew.setNotes(ccd.getNotes());
			cNew.setProposedRal(ccd.getProposedRal());
			cNew.setSubsidyFlag(ccd.getSubsidyFlag());
			comRep.save(cNew);

		}

		System.out.println("save ccd ok " + toUpdate.getIdCandidate());

		return 200;
	}
}

package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.CandidateRepository;
import com.dao.CompanyClientRepository;
import com.dao.EducationRepository;
import com.dao.JobInterviewRepository;
import com.dao.JobOfferRepository;
import com.google.gson.Gson;
import com.model.Candidate;
import com.model.CompanyClient;
import com.model.JobInterview;
import com.model.JobOffer;

@Controller
public class HomeCtr {

	@Autowired
	public CandidateRepository candidateRep;

	@Autowired
	private JobInterviewRepository JobInterviewRep;

	@Autowired
	private JobOfferRepository jobOfferRep;

	@Autowired
	public CompanyClientRepository companyRep;

	@Autowired
	public EducationRepository educationRep;

	@GetMapping("/gestionaleCandidati")
	public String home(Model model) {
		List<Candidate> c = candidateRep.findAll();
		List<JobOffer> j = jobOfferRep.findAll();
		List<JobInterview> i = JobInterviewRep.findAll();
		List<CompanyClient> cc = companyRep.findAll();
		List<Object[]> cities = candidateRep.countCandidatesByCity();
		List<Object[]> degrees = educationRep.countCandidatesByEducationDegreeType();

		List<Object[]> states = JobInterviewRep.countJobInterviewsByState();
		List<Object[]> ages = candidateRep.countCandidatesByAgeGroup();
		List<Object[]> salary = jobOfferRep.countJobOffersByRalGroup();

		List<Object[]> compOff = companyRep.countJobOffersByCompany();
		model.addAttribute("candidatesNumber", c.size());
		model.addAttribute("jobsNumber", j.size());
		model.addAttribute("jobInterviewNumber", i.size());
		model.addAttribute("companiesNumber", cc.size());

		Gson gson = new Gson();
		String citiesJson = gson.toJson(cities);
		model.addAttribute("cities", citiesJson);

		String degreesJson = gson.toJson(degrees);
		model.addAttribute("degrees", degreesJson);

		String statesJson = gson.toJson(states);
		model.addAttribute("states", statesJson);

		String compOfferJson = gson.toJson(compOff);
		model.addAttribute("compOffer", compOfferJson);

		String salaryson = gson.toJson(salary);
		model.addAttribute("salary", salaryson);

		String agesJson = gson.toJson(ages);
		model.addAttribute("ages", agesJson);
		return "home";
	}

}

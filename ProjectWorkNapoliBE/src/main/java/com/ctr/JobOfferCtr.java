package com.ctr;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CompanyClientRepository;
import com.dao.ContractTypeRepository;
import com.dao.JobOfferRepository;
import com.dao.JobOfferSkillRepository;
import com.dao.SkillRepository;
import com.model.CompanyClient;
import com.model.ContractType;
import com.model.JobOffer;
import com.model.JobOfferSkill;
import com.model.Skill;

import jakarta.transaction.Transactional;

@Controller
@RequestMapping("JobOfferCtr")

public class JobOfferCtr {

	@Autowired
	private JobOfferRepository jobOfferRep;

	@Autowired
	private CompanyClientRepository companyClientRep;

	@Autowired
	private ContractTypeRepository contractTypeRep;

	@Autowired
	private SkillRepository SkillRep;

	@Autowired
	private JobOfferSkillRepository jobOfferSkillRep;

	@GetMapping("jobOfferForm")
	public String jobOfferForm(Model model) {
		List<CompanyClient> clients = companyClientRep.findAll();
		List<ContractType> contractsType = contractTypeRep.findAll();
		List<Skill> skills = SkillRep.findAll();
		model.addAttribute("clients", clients);
		model.addAttribute("contractsType", contractsType);
		model.addAttribute("skills", skills);
		return "jobOffer/addJobOffer";
	}

	@GetMapping("searchJobOfferForm")
	public String searchJobOfferForm(Model model) {
		List<CompanyClient> clients = companyClientRep.findAll();
		List<ContractType> contractsType = contractTypeRep.findAll();
		List<Skill> skills = SkillRep.findAll();
		model.addAttribute("clients", clients);
		model.addAttribute("contractsType", contractsType);
		model.addAttribute("skills", skills);
		System.out.println("fo to the search form");
		return "jobOffer/searchJobOffer";
	}

/////////////////////////////////////////////////////////////////////////   

	@GetMapping("jobOffers")
	public String jobOffers(Model model) {
		List<JobOffer> jobOffers = jobOfferRep.findAll();
		model.addAttribute("showToast", true);
		if (jobOffers.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No Job Offers found! Add one first!");
			return "jobOffer/addJobOffer";
		} else {
			model.addAttribute("jobOffers", jobOffers);
			model.addAttribute("toastTitle", "Success");

			if (jobOffers.size() == 1) {
				model.addAttribute("toastMessage", jobOffers.size() + " Job Offer founded!");

			} else {
				model.addAttribute("toastMessage", jobOffers.size() + " Job Offers founded!");
			}
			return "jobOffer/jobOffers";
		}
	}

	@GetMapping("updateJobOfferForm")
	public String updateJobOfferForm(Model model, @RequestParam("id") Integer id) {
		JobOffer jobOfferToEdit = jobOfferRep.findById(id).get();
		List<CompanyClient> clients = companyClientRep.findAll();
		List<ContractType> contractsType = contractTypeRep.findAll();
		List<Skill> skills = SkillRep.findAll();
		List<JobOfferSkill> skillsSelected = jobOfferSkillRep.findByJobOfferIdJobOffer(id);
		List<Integer> idSkillsArray = new ArrayList<>();

		for (JobOfferSkill jobOfferSkill : skillsSelected) {
			idSkillsArray.add(jobOfferSkill.getSkill().getIdSkill());
		}
		model.addAttribute("clients", clients);
		model.addAttribute("contractsType", contractsType);
		model.addAttribute("skills", skills);
		model.addAttribute("idSkillsArray", idSkillsArray);
		model.addAttribute("jobOfferToEdit", jobOfferToEdit);
		return "jobOffer/updateJobOffer";
	}

/////////////////////////////////////////////////////////////////////////   
	@Transactional
	@PostMapping("addJobOffer")
	public String addJobOffer(Model model, @ModelAttribute JobOffer jobOffer,
			@RequestParam("selectedSkills") List<Integer> selectedSkills) {
		System.out.println(selectedSkills);

		System.out.println("operation add complete for " + jobOffer);
		jobOfferRep.save(jobOffer);

		jobOfferRep.flush();
		int jobId = jobOffer.getIdJobOffer();
		System.out.println("Job ID after save: " + jobId);

		if (selectedSkills != null && !selectedSkills.isEmpty()) {
			List<Skill> selectedSkillList = SkillRep.findAllById(selectedSkills);
			for (Skill skill : selectedSkillList) {
				JobOfferSkill jb = new JobOfferSkill();
				jb.setJobOffer(jobOffer);
				jb.setSkill(skill);
				jobOfferSkillRep.save(jb);
			}
		}

		List<JobOffer> jobOffers = jobOfferRep.findAll();
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Job Offer created!");
		model.addAttribute("showToast", true);
		model.addAttribute("jobOffers", jobOffers);
		return "jobOffer/jobOffers";
	}

/////////////////////////////////////////////////////////////////////////

	@Transactional
	@PostMapping("updateJobOffer")
	public String updateJobOffer(Model model, @ModelAttribute JobOffer jobOffer,
			@RequestParam("selectedSkills") List<Integer> selectedSkills) {

		jobOfferRep.save(jobOffer);

		jobOfferRep.flush();

		int jobId = jobOffer.getIdJobOffer();

		List<JobOfferSkill> oldSkills = jobOfferSkillRep.findByJobOfferIdJobOffer(jobId);
		if (selectedSkills != null && !selectedSkills.isEmpty()) {
			for (JobOfferSkill oldJob : oldSkills) {
				jobOfferSkillRep.delete(oldJob);
			}
		}
		if (selectedSkills != null && !selectedSkills.isEmpty()) {
			List<Skill> selectedSkillList = SkillRep.findAllById(selectedSkills);
			for (Skill skill : selectedSkillList) {
				JobOfferSkill jb = new JobOfferSkill();
				jb.setJobOffer(jobOffer);
				jb.setSkill(skill);
				jobOfferSkillRep.save(jb);
			}
		}

		List<JobOffer> jobOffers = jobOfferRep.findAll();
		model.addAttribute("jobOffers", jobOffers);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Job Offer updated!");
		model.addAttribute("showToast", true);
		return "jobOffer/jobOffers";
	}

/////////////////////////////////////////////////////////////////////////	

	@GetMapping("deleteJobOffer/{id}")
	public String deleteJobOffer(Model model, @PathVariable("id") int id) {
		System.out.println("operation delete complete for id " + id);
		jobOfferRep.deleteById(id);

		List<JobOffer> jobOffers = jobOfferRep.findAll();
		model.addAttribute("jobOffers", jobOffers);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Job Offer deleted!");
		model.addAttribute("showToast", true);
		return "jobOffer/jobOffers";
	}

/////////////////////////////////////////////////////////////////////////

	@PostMapping("searchJobOffer")
	public String searchJobOffer(Model model, @ModelAttribute JobOffer jobOffer,
			@RequestParam(name = "stipendiomin", required = false) Integer stipendiomin,
			@RequestParam(name = "stipendiomax", required = false) Integer stipendiomax,
			@RequestParam(name = "selectedSkills", required = false) List<Integer> selectedSkills) {

		System.out.println("selectedSkills: " + selectedSkills);

		List<JobOffer> searchResults = jobOfferRep.findByOptionalCriteria(jobOffer.getIdJobOffer(), jobOffer.getTitle(),
				jobOffer.getStartDate(), jobOffer.getEndDate(),
				jobOffer.getCompanyClient() != null ? jobOffer.getCompanyClient().getIdCompanyClient() : null,
				jobOffer.getContractType() != null ? jobOffer.getContractType().getIdContractType() : null,
				stipendiomin, stipendiomax, selectedSkills != null ? selectedSkills : null);

		System.out.println(searchResults.size());

		if (searchResults.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Job offer not found. Try again.");

			return "jobOffer/searchJobOffer";
		} else {
			model.addAttribute("toastTitle", "Success");

			if (searchResults.size() == 1) {
				model.addAttribute("toastMessage", searchResults.size() + " Job Offer founded!");

			} else {
				model.addAttribute("toastMessage", searchResults.size() + " Job Offers founded!");
			}
		}
		model.addAttribute("showToast", true);
		model.addAttribute("jobOffers", searchResults);
		return "jobOffer/jobOffers";
	}

/////////////////////////////////////////////////////////////////////////   

}

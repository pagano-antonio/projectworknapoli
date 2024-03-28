package com.rest;

import java.util.ArrayList;
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

import com.dao.JobOfferRepository;
import com.dto.JobOfferDTO;
import com.model.JobOffer;
import com.service.JobOfferService;

@CrossOrigin
@RestController
@RequestMapping("JobOffer")

public class JobOfferRest {

	@Autowired
	private JobOfferRepository jobOfferRep;

	@Autowired
	private JobOfferService jobOfferService;

///////////////////////////////////////////////////////////////////////// 
	@GetMapping("/getJobOffers")
	public List<JobOfferDTO> getJobOffers() {
		List<JobOffer> jobOffers = jobOfferRep.findAll();
		List<JobOfferDTO> jobOfferDTOs = new ArrayList<>();

		for (JobOffer jobOffer : jobOffers) {
			jobOfferDTOs.add(jobOfferService.mapToDTO(jobOffer));
		}

		return jobOfferDTOs;
	}

	@PostMapping("addJobOffer")
	public JobOffer addJobOffer(@RequestBody JobOffer jobOffer) {
		JobOffer saved = jobOfferRep.save(jobOffer);

		return saved;
	}

/////////////////////////////////////////////////////////////////////////

	@PutMapping("updateJobOffer")
	public String updateJobOffer(@RequestBody JobOffer jobOffer) {
		System.out.println("operation update complete for " + jobOffer);
		jobOfferRep.save(jobOffer);

		return "operation update complete";
	}

/////////////////////////////////////////////////////////////////////////	

	@DeleteMapping("deleteJobOffer/{id}")
	public int deleteJobOffer(@PathVariable("id") Integer id) {
		System.out.println("delete??");
		jobOfferRep.deleteById(id);
		return 200;
	}

/////////////////////////////////////////////////////////////////////////

	@GetMapping("findById/{id}")
	public JobOffer findById(@PathVariable("id") int id) {

		JobOffer res = jobOfferRep.findById(id).get();

		return res;
	}

/////////////////////////////////////////////////////////////////////////   

}

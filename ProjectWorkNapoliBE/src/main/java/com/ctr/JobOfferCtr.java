package com.ctr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.JobOfferRepository;
import com.model.JobOffer;

@Controller
@RequestMapping("JobOfferCtr")

public class JobOfferCtr {

	@Autowired
	private JobOfferRepository jobOfferRep;

/////////////////////////////////////////////////////////////////////////   

	@PostMapping("addJobOffer")
	public String addJobOffer(Model model, @RequestBody JobOffer jobOffer) {
		System.out.println("operation add complete for " + jobOffer);
		jobOfferRep.save(jobOffer);

		return "";
	}

/////////////////////////////////////////////////////////////////////////

	@PutMapping("updateJobOffer")
	public String updateJobOffer(Model model, @RequestBody JobOffer jobOffer) {
		System.out.println("operation update complete for " + jobOffer);
		jobOfferRep.save(jobOffer);

		return "";
	}

/////////////////////////////////////////////////////////////////////////	

	@DeleteMapping("deleteJobOffer/{id}")
	public String deleteJobOffer(Model model, @PathVariable("id") int id) {
		System.out.println("operation delete complete for id " + id);
		jobOfferRep.deleteById(id);

		return "";
	}

/////////////////////////////////////////////////////////////////////////

	@GetMapping("findById/{id}")
	public String findById(Model model, @PathVariable("id") int id) {

		JobOffer res = jobOfferRep.findById(id).get();

		return "";
	}

/////////////////////////////////////////////////////////////////////////   

}

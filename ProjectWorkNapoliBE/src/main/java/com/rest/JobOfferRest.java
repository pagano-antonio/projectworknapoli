package com.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.dao.JobOfferRepository;
import com.model.JobOffer;



@RestController
@RequestMapping("JobOffer")

public class JobOfferRest {

	@Autowired
	private JobOfferRepository jobOfferRep;
	
/////////////////////////////////////////////////////////////////////////   

@PostMapping("addJobOffer")
public String addJobOffer(@RequestBody JobOffer jobOffer) {
System.out.println("operation add complete for " + jobOffer);
jobOfferRep.save(jobOffer);

return "operation add complete";
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
public String deleteJobOffer(@PathVariable("id") int id) {
	System.out.println("operation delete complete for id " + id);
	jobOfferRep.deleteById(id);

	return "operation delete complete";
}

/////////////////////////////////////////////////////////////////////////

@GetMapping("findById/{id}")
public JobOffer findById(@PathVariable("id") int id) {

	JobOffer res = jobOfferRep.findById(id).get();

	return res;
}

/////////////////////////////////////////////////////////////////////////   


}

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

import com.dao.JobInterviewRepository;
import com.model.JobInterview;


@RestController
@RequestMapping("JobInterview")

public class JobInterviewRest {

	@Autowired
	private JobInterviewRepository jobInterviewRep;
	
/////////////////////////////////////////////////////////////////////////   

@PostMapping("addJobInterview")
public String addJobInterview(@RequestBody JobInterview jobInterview) {
System.out.println("operation add complete for " + jobInterview);
jobInterviewRep.save(jobInterview);

return "operation add complete";
}

/////////////////////////////////////////////////////////////////////////

@PutMapping("updateJobInterview")
public String updateJobInterview(@RequestBody JobInterview jobInterview) {
	System.out.println("operation update complete for " + jobInterview);
	jobInterviewRep.save(jobInterview);

	return "operation update complete";
}

/////////////////////////////////////////////////////////////////////////	

@DeleteMapping("deleteJobInterview/{id}")
public String deleteJobInterview(@PathVariable("id") int id) {
	System.out.println("operation delete complete for id " + id);
	jobInterviewRep.deleteById(id);

	return "operation delete complete";
}

/////////////////////////////////////////////////////////////////////////

@GetMapping("findById/{id}")
public JobInterview findById(@PathVariable("id") int id) {

	JobInterview res = jobInterviewRep.findById(id).get();

	return res;
}

/////////////////////////////////////////////////////////////////////////   


}

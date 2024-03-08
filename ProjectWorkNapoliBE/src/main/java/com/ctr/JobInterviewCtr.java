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

import com.dao.JobInterviewRepository;
import com.model.JobInterview;

@Controller
@RequestMapping("JobInterviewCtr")
public class JobInterviewCtr {

	@Autowired
	private JobInterviewRepository JobInterviewRep;

	@PostMapping("addJobInterview")
	public String addJobInterview(Model model, @RequestBody JobInterview jobInterview) {
		System.out.println("operation add complete for " + jobInterview);
		JobInterviewRep.save(jobInterview);

		return "";
	}

	@PutMapping("updateJobInterview")
	public String updateJobInterview(Model model, @RequestBody JobInterview jobInterview) {
		System.out.println("operation update complete for " + jobInterview);
		JobInterviewRep.save(jobInterview);

		return "";
	}

	@DeleteMapping("deleteJobInterview/{id}")
	public String deleteJobInterview(Model model, @PathVariable("id") int id) {
		System.out.println("operation delete complete for id " + id);
		JobInterviewRep.deleteById(id);

		return "";
	}

	@GetMapping("findById/{id}")
	public String findById(Model model, @PathVariable("id") int id) {

		JobInterview res = JobInterviewRep.findById(id).get();

		return "";
	}
}

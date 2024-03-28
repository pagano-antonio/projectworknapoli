package com.rest;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dao.JobOfferSkillRepository;
import com.model.JobOfferSkill;

@RestController
@CrossOrigin
@RequestMapping("/JobOfferSkill")
public class JobOfferSkillRest {

	@Autowired
	private JobOfferSkillRepository JobOfferSkillRep;

	@PostMapping("/addJobOfferSkill")
	public int addJobOfferSkill(@RequestBody List<JobOfferSkill> jobOfferSkills) {
		System.out.println("add jb offer");

		JobOfferSkillRep.saveAllAndFlush(jobOfferSkills);

		return 200;
	}

	@GetMapping("findById/{id}")
	@ResponseBody
	public JobOfferSkill findById(@PathVariable("id") int id) {

		JobOfferSkill res = JobOfferSkillRep.findById(id).get();

		return res;

	}

	@PostMapping
	public String add(@RequestBody JobOfferSkill s) {

		JobOfferSkillRep.save(s);
		System.out.println("Inserito nel db:" + s.getIdJobOfferSkill());
		return "OK";
	}

	@PutMapping
	public String update(@RequestBody JobOfferSkill s) {

		JobOfferSkillRep.save(s);
		System.out.println("Aggiornato nel db");
		return "OK";
	}

	@DeleteMapping("deleteById/{id}")
	public void delete(@PathVariable("id") Integer id) {

		JobOfferSkillRep.deleteById(id);
		System.out.println("Eliminato dal db");

	}

}

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

import com.dao.WorkExperienceRepository;
import com.model.WorkExperience;

@RestController
@CrossOrigin
@RequestMapping("WorkExperienceRest")
public class WorkExperienceRest {
	@Autowired
	private WorkExperienceRepository workExperienceRep;

	@PostMapping("addWorkExperience")
	public int addWorkExperience(@RequestBody List<WorkExperience> works) {
		System.out.println("works-->" + works);
		workExperienceRep.saveAll(works);
		return 200;
	}

	@GetMapping("findById/{id}")
	@ResponseBody
	public WorkExperience findById(@PathVariable("id") int id) {

		WorkExperience res = workExperienceRep.findById(id).get();

		return res;

	}

	@PostMapping
	public String add(@RequestBody WorkExperience w) {

		workExperienceRep.save(w);
		System.out.println("Inserito nel db:" + w.getIdWorkExperience());
		return "OK";
	}

	@PutMapping
	public String update(@RequestBody WorkExperience w) {

		workExperienceRep.save(w);
		System.out.println("Aggiornato nel db");
		return "OK";
	}

	@DeleteMapping("deleteById/{id}")
	public void delete(@PathVariable("id") Integer id) {

		workExperienceRep.deleteById(id);
		System.out.println("Eliminato dal db");

	}

}

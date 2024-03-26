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

import com.dao.SkillRepository;
import com.model.Skill;

@RestController
@RequestMapping("/skill")
@CrossOrigin
public class SkillRest {

	@Autowired
	private SkillRepository skillRep;

	@GetMapping("findById/{id}")
	@ResponseBody
	public Skill findById(@PathVariable("id") int id) {

		Skill res = skillRep.findById(id).get();

		return res;

	}

	@GetMapping("getSkills")
	public List<Skill> getSkills() {
		List<Skill> skills = skillRep.findAll();
		return skills;

	}

	@PostMapping
	public String add(@RequestBody Skill s) {

		skillRep.save(s);
		System.out.println("Inserito nel db:" + s.getIdSkill());
		return "OK";
	}

	@PutMapping
	public String update(@RequestBody Skill s) {

		skillRep.save(s);
		System.out.println("Aggiornato nel db");
		return "OK";
	}

	@DeleteMapping("deleteById/{id}")
	public void delete(@PathVariable("id") Integer id) {

		skillRep.deleteById(id);
		System.out.println("Eliminato dal db");

	}

}

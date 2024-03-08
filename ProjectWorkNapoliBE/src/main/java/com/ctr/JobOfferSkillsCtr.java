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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.JobOfferSkillRepository;
import com.model.JobOfferSkill;

@Controller
@RequestMapping("/JobOfferSkill")
public class JobOfferSkillsCtr {

	@Autowired
	private JobOfferSkillRepository JobOfferSkillRep;

	@GetMapping("findById/{id}")
	@ResponseBody
	public String findById(Model model, @PathVariable("id") int id) {

		JobOfferSkill res = JobOfferSkillRep.findById(id).get();

		return "";

	}

	@PostMapping
	public String add(Model model, @RequestBody JobOfferSkill s) {

		JobOfferSkillRep.save(s);
		System.out.println("Inserito nel db:" + s.getIdJobOfferSkill());
		return "";
	}

	@PutMapping
	public String update(Model model, @RequestBody JobOfferSkill s) {

		JobOfferSkillRep.save(s);
		System.out.println("Aggiornato nel db");
		return "";
	}

	@DeleteMapping("deleteById/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {

		JobOfferSkillRep.deleteById(id);
		System.out.println("Eliminato dal db");
		return "";

	}

}

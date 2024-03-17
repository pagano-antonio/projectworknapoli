package com.ctr;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.SkillRepository;
import com.model.Skill;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("skillCtr")
public class SkillCtr {

	@Autowired
	private SkillRepository SkillRep;

	@GetMapping("/indexSkill")
	public String home(Model model) {

		return "skill/indexSkill";
	}

	//////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/allSkills")
	public String allSkills(Model model) {
		List<Skill> skills = SkillRep.findAll();
		model.addAttribute("showToast", true);

		if (skills.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No skill found. Add one first!");
			return "skill/addSkill";
		} else {
			model.addAttribute("skills", skills);
			model.addAttribute("toastTitle", "Success");

			if (skills.size() == 1) {
				model.addAttribute("toastMessage", "1 skill found");
			} else {
				model.addAttribute("toastMessage", skills.size() + " skills found");
			}
			return "skill/allSkills";
		}

	}

	@GetMapping("/searchSkillForm")
	public String searchSkillForm(Model model) {
		return "skill/searchSkill";
	}

	@GetMapping("/updateSkillForm")
	public String updateSkillForm(Model model, @RequestParam("id") Integer id) {

		Skill s = SkillRep.findById(id).get();
		model.addAttribute("skillFound", s);
		return "skill/updateSkill";
	}

	@GetMapping("/toAdd")
	public String toAddWorkExperience(Model model, HttpServletRequest request) {

		return "skill/addSkill";

	}

	@GetMapping("/addSkill")
	public String addSkill(Model model, Skill s) {

		SkillRep.save(s);
		return "skill/ok";

	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/tofindById")
	public String tofindById() {
		return "skill/researchById";
	}

	@GetMapping("findById")
	public String findById(@RequestParam("id") Integer id, Model model) {

		Optional<Skill> skillFound = SkillRep.findById(id);
		model.addAttribute("showToast", true);
		if (skillFound.isPresent()) {
			model.addAttribute("skillFound", skillFound.get());
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", "Skill found!");
			return "skill/updateSkill";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Skill not found!");
			return "skill/updateById";
		}

	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/toDeleteById")
	public String toDeleteById() {
		return "skill/deleteById";
	}

	@GetMapping("/delete")
	public String delete(Model model, @RequestParam("id") Integer id) {
		Optional<Skill> s = SkillRep.findById(id);
		if (s.isPresent()) {
			SkillRep.deleteById(id);

			SkillRep.flush();

			List<Skill> skills = SkillRep.findAll();

			if (skills.size() > 0) {
				model.addAttribute("skills", skills);
				model.addAttribute("showToast", true);
				model.addAttribute("toastTitle", "Success");
				model.addAttribute("toastMessage", "Skill deleted");
				return "skill/allSkills";
			} else {
				model.addAttribute("showToast", true);
				model.addAttribute("toastTitle", "Warning");
				model.addAttribute("toastMessage", "Last skill successfully deleted. Please add a new skill!");
				return "skill/addSkill";
			}
		} else {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Skill not found!");

			return "skill/deleteById";
		}
	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/toUpdateById")
	public String toUpdateById() {
		return "skill/updateById";
	}

	@PostMapping("/update")
	public String update(Model model, Skill s) {

		SkillRep.save(s);

		SkillRep.flush();

		List<Skill> skills = SkillRep.findAll();
		model.addAttribute("skills", skills);
		model.addAttribute("showToast", true);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Skill updated");
		return "skill/allSkills";
	}

	@PostMapping("/searchSkill")
	public String searchSkill(Model model, @ModelAttribute Skill s,
			@RequestParam(name = "id", required = false) Integer id) {
		// Controlla se idSkill è null e lo imposta a zero se necessario
		List<Skill> skills = SkillRep.findByCriteria(id, s.getTitle(), s.getDescription());
		model.addAttribute("skills", skills);
		model.addAttribute("showToast", true);
		if (skills.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Skill not found. Try again");
			return "skill/searchSkill";
		} else {
			model.addAttribute("toastTitle", "Success");
			if (skills.size() == 1) {
				model.addAttribute("toastMessage", "1 skill found");
			} else {
				model.addAttribute("toastMessage", skills.size() + " skills found");
			}
		}
		return "skill/allSkills";
	}

}

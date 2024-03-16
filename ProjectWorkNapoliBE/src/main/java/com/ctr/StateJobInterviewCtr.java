package com.ctr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.StateJobInterviewRepository;
import com.model.StateJobInterview;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("stateJobIntCtr")
public class StateJobInterviewCtr {

	@Autowired
	private StateJobInterviewRepository StateJobInterviewRep;

	@GetMapping("/indexStateInterv")
	public String home(Model model) {

		return "stateInterview/indexStateInterv";
	}

	@GetMapping("goToAllStateJobInterview")
	public String goToAllStateJobInterview(Model model) {
		List<StateJobInterview> states = StateJobInterviewRep.findAll();
		if (states.size() > 0) {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", states.size() + " State Job Interview found!");
			model.addAttribute("states", states);

			return "stateInterview/allStateJobInterview";
		} else {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No state job interview. Add one first!");
			return "stateInterview/addStateInterview";

		}

	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/toAdd")
	public String toAddstateInterview(Model model, HttpServletRequest request) {

		return "stateInterview/addStateInterview";

	}

	@PostMapping("/addStateInterview")
	public String addWorkExperience(Model model, @ModelAttribute StateJobInterview s) {
		StateJobInterviewRep.save(s);
		model.addAttribute("showToast", true);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "State Job Interview Added!");
		List<StateJobInterview> states = StateJobInterviewRep.findAll();
		model.addAttribute("states", states);

		return "stateInterview/allStateJobInterview";

	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/tofindById")
	public String tofindById() {
		return "stateInterview/researchById";
	}

	@GetMapping("findById")
	public String findById(Model model, @RequestParam("id") Integer id) {

		StateJobInterview s = StateJobInterviewRep.findById(id).get();
		model.addAttribute("state", s);
		return "stateInterview/updateStateJobInterview";

	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/toDeleteById")
	public String toDeleteById() {
		return "stateInterview/deleteById";
	}

	@GetMapping("/delete")
	public String delete(Model model, @RequestParam("id") Integer id) {
		StateJobInterviewRep.deleteById(id);
		StateJobInterviewRep.flush();

		List<StateJobInterview> states = StateJobInterviewRep.findAll();
		if (states.size() > 0) {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", "State Job Interview deleted!");
			model.addAttribute("states", states);

			return "stateInterview/allStateJobInterview";
		} else {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Deletion success, add one more.");
			return "stateInterview/addStateInterview";

		}
	}

	//////////////////////////////////////////////////////////////////////////////////

	@GetMapping("/toUpdateById")
	public String toUpdateById() {
		return "stateInterview/updateById";
	}

	@GetMapping("/updateStateJobInterviewForm")
	public String updateStateJobInterviewForm(Model model, @RequestParam("id") Integer id) {
		StateJobInterview s = StateJobInterviewRep.findById(id).get();
		model.addAttribute("state", s);
		return "stateInterview/updateStateJobInterview";
	}

	@PostMapping("/updateStateJobInterview")
	public String updateStateJobInterview(Model model, @ModelAttribute StateJobInterview s) {
		StateJobInterviewRep.save(s);
		model.addAttribute("state", s);
		StateJobInterviewRep.flush();
		List<StateJobInterview> states = StateJobInterviewRep.findAll();
		if (states.size() > 0) {
			model.addAttribute("showToast", true);
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage", "State Job Interview updated!");
			model.addAttribute("states", states);

		}
		return "stateInterview/allStateJobInterview";
	}

	@GetMapping("/searchJobInterviewForm")
	public String searchJobInterviewForm(Model model) {
		return "stateInterview/searchStateJobInterview";

	}

	@PostMapping("/searchJobInterview")
	public String searchJobInterview(Model model, @ModelAttribute StateJobInterview s,
			@RequestParam(name = "id", required = false) Integer id) {

		List<StateJobInterview> states = StateJobInterviewRep.findByCriteria(id, s.getTitle(), s.getDescription());

		model.addAttribute("showToast", true);
		System.out.println("id: " + id);

		System.out.println("states: " + states.size());
		if (states.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "State job interview not found. Try again");
			return "stateInterview/searchStateJobInterview";
		} else {
			model.addAttribute("states", states);
			model.addAttribute("toastTitle", "Success");

			if (states.size() == 1) {
				model.addAttribute("toastMessage", "1 state job interview found");
			} else {
				model.addAttribute("toastMessage", states.size() + " states job interview found");
			}
			return "stateInterview/allStateJobInterview";

		}
	}
}

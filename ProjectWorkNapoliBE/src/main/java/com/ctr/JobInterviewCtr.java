package com.ctr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.dao.CandidateRepository;
import com.dao.EmployeeRepository;
import com.dao.JobInterviewRepository;
import com.dao.StateJobInterviewRepository;
import com.model.Candidate;
import com.model.Employee;
import com.model.JobInterview;
import com.model.StateJobInterview;

@Controller
@RequestMapping("JobInterviewCtr")
public class JobInterviewCtr {

	@Autowired
	private JobInterviewRepository JobInterviewRep;

	@Autowired
	private StateJobInterviewRepository stateJobInterviewRep;

	@Autowired
	private CandidateRepository candidateRep;

	@Autowired
	private EmployeeRepository employeeRep;

	@GetMapping("allJobInterviews")
	public String allJobInterviews(Model model) {
		List<JobInterview> interviews = JobInterviewRep.findAll();

		if (interviews.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No interviews found! Add one first!");
			return "JobInterview/addJobInterview";
		} else {
			model.addAttribute("interviews", interviews);
			model.addAttribute("toastTitle", "Success");

			if (interviews.size() == 1) {
				model.addAttribute("toastMessage", interviews.size() + " interview founded!");

			} else {
				model.addAttribute("toastMessage", interviews.size() + " interviews founded!");
			}
			model.addAttribute("showToast", true);
			return "JobInterview/allJobInterview";
		}

	}

	@GetMapping("addJobInterviewForm")
	public String addJobInterviewForm(Model model) {
		List<Candidate> candidates = candidateRep.findAll();
		List<StateJobInterview> states = stateJobInterviewRep.findAll();
		List<Employee> employees = employeeRep.findAll();
		model.addAttribute("candidates", candidates);
		model.addAttribute("states", states);
		model.addAttribute("employees", employees);
		return "JobInterview/addJobInterview";
	}

	@GetMapping("searchJobInterviewForm")
	public String searchJobInterviewForm(Model model) {
		List<Candidate> candidates = candidateRep.findAll();
		List<StateJobInterview> states = stateJobInterviewRep.findAll();
		List<Employee> employees = employeeRep.findAll();
		model.addAttribute("candidates", candidates);
		model.addAttribute("states", states);
		model.addAttribute("employees", employees);
		return "JobInterview/searchJobInterview";
	}

	@PostMapping("/addJobInterview")
	public String addJobInterview(Model model, @ModelAttribute JobInterview jobInterview,
			@RequestParam("dateFormat") String d) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = dateFormat.parse(d);
			jobInterview.setDate(date);
			JobInterviewRep.save(jobInterview);
		} catch (ParseException e) {
			// Gestisci l'eccezione di analisi qui
			e.printStackTrace();
			return "Errore durante la conversione della data!";
		}

		JobInterviewRep.flush();
		List<JobInterview> interviews = JobInterviewRep.findAll();
		model.addAttribute("showToast", true);
		if (interviews.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No interviews found! Add one first!");
			return "JobInterview/addJobInterview";
		} else {
			model.addAttribute("interviews", interviews);
			model.addAttribute("toastTitle", "Success");

			if (interviews.size() == 1) {
				model.addAttribute("toastMessage", interviews.size() + " interview founded!");

			} else {
				model.addAttribute("toastMessage", interviews.size() + " interviews founded!");
			}
			return "JobInterview/allJobInterview";
		}
	}

	@GetMapping("updateJobInterviewForm")
	public String updateJobInterviewForm(Model model, @RequestParam("id") int id) {

		List<Candidate> candidates = candidateRep.findAll();
		List<StateJobInterview> states = stateJobInterviewRep.findAll();
		List<Employee> employees = employeeRep.findAll();
		model.addAttribute("candidates", candidates);
		model.addAttribute("states", states);
		model.addAttribute("employees", employees);

		JobInterview res = JobInterviewRep.findById(id).get();
		model.addAttribute("jobInterview", res);

		return "JobInterview/updateJobInterview";
	}

	@PostMapping("/updateJobInterview")
	public String updateJobInterview(Model model, @ModelAttribute JobInterview jobInterview,
			@RequestParam("dateFormat") String d) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = dateFormat.parse(d);
			jobInterview.setDate(date);
			JobInterviewRep.save(jobInterview);
		} catch (ParseException e) {
			e.printStackTrace();
			return "Errore durante la conversione della data!";
		}

		JobInterviewRep.flush();
		List<JobInterview> interviews = JobInterviewRep.findAll();
		model.addAttribute("interviews", interviews);
		model.addAttribute("showToast", true);
		model.addAttribute("toastTitle", "Success");
		model.addAttribute("toastMessage", "Interview updated");
		return "JobInterview/allJobInterview";
	}

	@GetMapping("deleteJobInterview")
	public String deleteJobInterview(Model model, @RequestParam("id") int id) {
		Optional<JobInterview> j = JobInterviewRep.findById(id);
		List<JobInterview> interviews = JobInterviewRep.findAll();
		model.addAttribute("interviews", interviews);
		if (j.isPresent()) {
			JobInterviewRep.deleteById(id);
			JobInterviewRep.flush();
			if (interviews.size() == 0) {
				model.addAttribute("toastTitle", "Success");
				model.addAttribute("toastMessage", "Job interview deleted. No other found! Please add one!");
				return "JobInterview/addJobInterview";
			} else {
				model.addAttribute("toastTitle", "Success");
				model.addAttribute("toastMessage", " Interview deleted!");

			}

		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "Job interview not found!");
		}

		model.addAttribute("showToast", true);
		return "JobInterview/allJobInterview";
	}

	@PostMapping("/searchJobInterview")
	public String searchJobInterview(Model model, @ModelAttribute JobInterview jobInterview,
			@RequestParam(name = "dateFormat", required = false) String d,
			@RequestParam(name = "idString", required = false) String idString,
			@RequestParam(name = "outcomeString", required = false) String outcomeString) {
		if (d != null && !d.isEmpty()) {
			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = dateFormat.parse(d);
				jobInterview.setDate(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// Converte idString in un numero solo se rappresenta un numero valido
		if (idString != null && !idString.isEmpty()) {
			try {
				int id = Integer.parseInt(idString);
				jobInterview.setIdJobInterview(id);
			} catch (NumberFormatException e) {
				// Se outcomeString non può essere convertito in un numero, non fare nulla
			}
		}

		// Converte outcomeString in un numero solo se rappresenta un numero valido
		if (outcomeString != null && !outcomeString.isEmpty()) {
			try {
				int outcome = Integer.parseInt(outcomeString);
				jobInterview.setOutcome(outcome);
			} catch (NumberFormatException e) {
				// Se outcomeString non può essere convertito in un numero, non fare nulla
			}
		}

		// Utilizza i criteri per cercare le job interviews
		List<JobInterview> interviews = JobInterviewRep.findByCriteria(jobInterview.getIdJobInterview(),
				jobInterview.getCandidate().getIdCandidate(), jobInterview.getDate(),
				jobInterview.getStateJobInterview().getIdStateJobInterview(), jobInterview.getNotes(),
				jobInterview.getOutcome(), jobInterview.getEmployee().getIdEmployee());

		model.addAttribute("showToast", true);

		if (interviews.size() > 0) {
			model.addAttribute("interviews", interviews);
			model.addAttribute("toastTitle", "Success");
			model.addAttribute("toastMessage",
					interviews.size() == 1 ? "1 interview found" : interviews.size() + " interviews found");
			return "JobInterview/allJobInterview";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No interview found. Try Again.");
			return "JobInterview/searchJobInterview";
		}
	}

}

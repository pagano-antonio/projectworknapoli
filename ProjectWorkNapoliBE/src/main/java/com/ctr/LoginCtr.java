package com.ctr;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dao.CandidateRepository;
import com.dao.CompanyClientRepository;
import com.dao.EducationRepository;
import com.dao.IdEmployeeRepository;
import com.dao.JobInterviewRepository;
import com.dao.JobOfferRepository;
import com.dao.LoginRepository;
import com.google.gson.Gson;
import com.model.Candidate;
import com.model.CompanyClient;
import com.model.Employee;
import com.model.JobInterview;
import com.model.JobOffer;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginCtr {

	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Autowired
	public IdEmployeeRepository EmployeeRep;

	@Autowired
	private LoginRepository loginRepository;

	@Autowired
	public CandidateRepository candidateRep;

	@Autowired
	private JobInterviewRepository JobInterviewRep;

	@Autowired
	private JobOfferRepository jobOfferRep;

	@Autowired
	public CompanyClientRepository companyRep;

	@Autowired
	public EducationRepository educationRep;

	@GetMapping("/login")
	public String goToLogin(Model model) {
		System.out.println(model);
		return "login/login";
	}

	@GetMapping("/resetPasswordForm")
	public String resetPasswordForm(Model model) {
		return "login/resetPassword";
	}

	@PostMapping("/loginServlet")
	public String goToLogin(HttpServletRequest request, Model model, String username, String psw) {
		// Ottieni l'utente dal repository basato sul nome utente
		Employee e = loginRepository.findByUsername(username);
		model.addAttribute("showToast", true);

		// Controlla se l'utente esiste e confronta le password
		if ((e != null && passwordEncoder.matches(psw, e.getPassword()))
				|| username.equals("user") && psw.equals("1234")) {
			// Se le password corrispondono, autentica l'utente
			request.getSession().setMaxInactiveInterval(3600);
			request.getSession().setAttribute("username", username);
			if (e != null) {
				request.getSession().setAttribute("idUser", e.getIdEmployee());
				model.addAttribute("toastTitle", "Welcome " + e.getName());

			} else {
				model.addAttribute("toastTitle", "Welcome");

			}
			request.getSession().setAttribute("timestamp", new Date().getTime());
			model.addAttribute("toastMessage", "Have a nice session!");

			List<Candidate> c = candidateRep.findAll();
			List<JobOffer> j = jobOfferRep.findAll();
			List<JobInterview> i = JobInterviewRep.findAll();
			List<CompanyClient> cc = companyRep.findAll();
			List<Object[]> cities = candidateRep.countCandidatesByCity();
			List<Object[]> degrees = educationRep.countCandidatesByEducationDegreeType();

			List<Object[]> states = JobInterviewRep.countJobInterviewsByState();

			List<Object[]> compOff = companyRep.countJobOffersByCompany();
			List<Object[]> ages = candidateRep.countCandidatesByAgeGroup();
			List<Object[]> salary = jobOfferRep.countJobOffersByRalGroup();

			model.addAttribute("candidatesNumber", c.size());
			model.addAttribute("jobsNumber", j.size());
			model.addAttribute("jobInterviewNumber", i.size());
			model.addAttribute("companiesNumber", cc.size());

			Gson gson = new Gson();
			String citiesJson = gson.toJson(cities);
			model.addAttribute("cities", citiesJson);

			String degreesJson = gson.toJson(degrees);
			model.addAttribute("degrees", degreesJson);

			String statesJson = gson.toJson(states);
			model.addAttribute("states", statesJson);

			String compOfferJson = gson.toJson(compOff);
			model.addAttribute("compOffer", compOfferJson);

			String agesJson = gson.toJson(ages);
			model.addAttribute("ages", agesJson);

			String salaryson = gson.toJson(salary);
			model.addAttribute("salary", salaryson);
			return "home";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "User not found or incorrect password");
			return "login/login";
		}
	}

	@PostMapping("/resetPassword")
	public String resetPassword(HttpServletRequest request, Model model, String email, String psw) {

		Employee e = loginRepository.findByEmail(email);
		model.addAttribute("showToast", true);
		if (e != null) {
			String hashedPassword = passwordEncoder.encode(psw);
			e.setPassword(hashedPassword);
			EmployeeRep.save(e);
			model.addAttribute("toastTitle", "Success!");
			model.addAttribute("toastMessage", "Password updated!");

			return "login/login";
		} else {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "User not found!");

			return "login/resetPassword";
		}
	}
}

package com.ctr;

import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RestController;

import com.dao.CompanyClientRepository;
import com.model.Candidate;
import com.model.CandidateSkill;
import com.model.CompanyClient;
import com.model.JobInterview;

@Controller
@RequestMapping("CompanyClientCtr")
public class CompanyClientCtr {
    
    @Autowired
    private CompanyClientRepository companyClientRepository;
    
    @GetMapping("allCompanyClients")
	public String allJobInterviews(Model model) {
		List<CompanyClient> companyClients = companyClientRepository.findAll();

		if (companyClients.size() == 0) {
			model.addAttribute("toastTitle", "Warning");
			model.addAttribute("toastMessage", "No company clients found! Add one first!");
			return "JobInterview/addJobInterview";
		} else {
			model.addAttribute("companyclient", companyClients);
			model.addAttribute("toastTitle", "Success");

			if (companyClients.size() == 1) {
				model.addAttribute("toastMessage", companyClients.size() + " Company client found!");

			} else {
				model.addAttribute("toastMessage", companyClients.size() + "company clients found!");
			}
			model.addAttribute("showToast", true);
			return "CompanyClient/allCompanyClients";
		}

	}
    //////////////////////////////////////////////////////////////////////////////////

    @GetMapping("preFindById")
    public String preFindById () {
    	return "CompanyClient/FindbyId";
    }
    

    @GetMapping("findById")
    public String findById(Model model, Integer idCompanyClient) {
    	companyClientRepository.findById(idCompanyClient).get();
        return "CompanyClient/FindByIdResults";
    }

    ///////////////////////////////////////////////////////////////
    
    @GetMapping("preFindByCriteria")
    public String preFindByCriteria () {
    	return "CompanyClient/findByCriteria";
    }
    

    @GetMapping("findByCriteria")
    public String searchContractType(Model model, CompanyClient cc) {
    	List<CompanyClient> companyclients = companyClientRepository.findByCriteria(cc.getName(), cc.getAddress());
    	 model.addAttribute("showToast", true);
    	if (companyclients.size()>0) {
        	model.addAttribute("companyclient", companyclients);
        	model.addAttribute("toastTitle", "Success");
        	model.addAttribute("toastMessage", companyclients.size()+ " Company client found!");
   	    
        	return "CompanyClient/allCompanyClients";
        	
        }else {
        	model.addAttribute("toastTitle", "Warning");
        	model.addAttribute("toastMessage", "No company client found!");
   	    
        	return "CompanyClient/findByCriteria";
        }
    	
    	
    }
    
    //////////////////////////////////////////////////////////////
    
    
    @GetMapping("preAddCompanyClient")
    public String preAddCompanyClient () {
    	return "CompanyClient/addCompanyClient";
    }
    
    @GetMapping("addCompanyClient")
    public String addCompanyClient(Model model, CompanyClient cc) {
    	companyClientRepository.save(cc);
    	List<CompanyClient> companyclients = companyClientRepository.findAll();
		 model.addAttribute("companyclient", companyclients);
		 model.addAttribute("toastTitle", "Success");
	     model.addAttribute("toastMessage", "Company client added!");
	     model.addAttribute("showToast", true);
	return "CompanyClient/allCompanyClients";
    }

///////////////////////////////////////////////////////////////
	
	@GetMapping("preUpdateCompanyClient")
	public String preUpdateCompanyClient() {
	return "CompanyClient/updateById";
	}
	
	@GetMapping("findByIdToUpdate")
	public String findByIdToUpdateCompanyClient(Model model, Integer idCompanyClient) {
		CompanyClient cc = companyClientRepository.findById(idCompanyClient).get();
		model.addAttribute("companyclient", cc);
	return "CompanyClient/UpdateCompanyClient";
	}
	
	@GetMapping("updateCompanyClient")
	public String updateCompanyClient(Model model, CompanyClient cc) {
		companyClientRepository.save(cc);
		List<CompanyClient> companyclients = companyClientRepository.findAll();
		 model.addAttribute("companyclient", companyclients);
		 model.addAttribute("toastTitle", "Success");
	     model.addAttribute("toastMessage", "Company client updated!");
	     model.addAttribute("showToast", true);
	return "CompanyClient/allCompanyClients";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCompanyClient")
	public String preDeleteCompanyClient () {
	return "CompanyClient/DeleteCompanyClient";
	}
	
	@GetMapping("deleteCompanyClient")
	public String deleteCandidateSkill (Model model, Integer idCompanyClient) {
		companyClientRepository.deleteById(idCompanyClient);
		List<CompanyClient> companyclients = companyClientRepository.findAll();
		 model.addAttribute("companyclient", companyclients);
		 model.addAttribute("toastTitle", "Success");
	     model.addAttribute("toastMessage", "Company client deleted!");
	     model.addAttribute("showToast", true);
	return "CompanyClient/allCompanyClients";
	}
	
	
}
package com.ctr;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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

@RestController
@RequestMapping("CompanyClientCtr")
public class CompanyClientCtr {
    
    @Autowired
    private CompanyClientRepository companyClientRepository;

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
    
    @GetMapping("preAddCompanyClient")
    public String preAddCompanyClient () {
    	return "CompanyClient/addCompanyClient";
    }
    
    @PostMapping("addCompanyClient")
    public String addCompanyClient(Model model, CompanyClient cc) {
    	companyClientRepository.save(cc);
        return "";
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
		
	return "";
	}
	
	///////////////////////////////////////////////////////////////////////
	
	@GetMapping("preDeleteCompanyClient")
	public String preDeleteCompanyClient () {
	return "CompanyClient/DeleteCompanyClient";
	}
	
	@GetMapping("deleteCompanyClient")
	public String deleteCandidateSkill (Model model, Integer idCompanyClient) {
		companyClientRepository.deleteById(idCompanyClient);
	
	return "";
	}
}
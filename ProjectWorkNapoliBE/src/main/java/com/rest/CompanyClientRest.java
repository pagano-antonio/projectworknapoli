package com.rest;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RestController;

import com.dao.CompanyClientRepository;
import com.dto.CompanyClientDTO;
import com.model.CompanyClient;
import com.service.CompanyService;

@RestController
@CrossOrigin
@RequestMapping("CompanyClient")

public class CompanyClientRest {

	@Autowired
	private CompanyClientRepository CompanyClientRep;

	@Autowired
	private CompanyService companyClientService;

	/////////////////////////////////////////////////////////////////////////

	@GetMapping("/getAllCompanies")
	public List<CompanyClientDTO> getAllCompanies() {
		List<CompanyClient> companies = CompanyClientRep.findAll();
		List<CompanyClientDTO> companiesDTOs = new ArrayList<>();

		for (CompanyClient c : companies) {
			companiesDTOs.add(companyClientService.mapToDTO(c));
		}

		return companiesDTOs;
	}

	@PostMapping("addCompanyClient")
	public String addCompanyClient(@RequestBody CompanyClient CompanyClient) {
		System.out.println("operation add complete for " + CompanyClient);
		CompanyClientRep.save(CompanyClient);

		return "operation add complete";
	}

	/////////////////////////////////////////////////////////////////////////

	@PutMapping("updateCompanyClient")
	public String CompanyClient(@RequestBody CompanyClient CompanyClient) {
		System.out.println("operation update complete for " + CompanyClient);
		CompanyClientRep.save(CompanyClient);

		return "operation update complete";
	}

	/////////////////////////////////////////////////////////////////////////

	@DeleteMapping("deleteCompanyClient/{id}")
	public String deleteCompanyClient(@PathVariable("id") int id) {
		System.out.println("operation delete complete for id " + id);
		CompanyClientRep.deleteById(id);

		return "operation delete complete";
	}

	/////////////////////////////////////////////////////////////////////////

	@GetMapping("findById/{id}")
	public CompanyClient findById(@PathVariable("id") int id) {

		CompanyClient res = CompanyClientRep.findById(id).get();

		return res;
	}

	/////////////////////////////////////////////////////////////////////////

}

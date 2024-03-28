package com.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.ContractTypeRepository;
import com.dto.ContractTypeDTO;
import com.model.ContractType;
import com.service.ContractTypeService;

@RestController
@RequestMapping("ContractType")

public class ContractTypeRest {

	@Autowired
	private ContractTypeRepository ContractTypeRep;

	@Autowired
	private ContractTypeService ContractTypeServ;

/////////////////////////////////////////////////////////////////////////  

	@GetMapping("/getAllContractType")
	public List<ContractTypeDTO> getAllContractType() {
		List<ContractType> contracts = ContractTypeRep.findAll();
		List<ContractTypeDTO> cDTOs = new ArrayList<>();

		for (ContractType c : contracts) {
			cDTOs.add(ContractTypeServ.mapToDTO(c));
		}

		return cDTOs;
	}

	@PostMapping("addContractType")
	public String addContractType(@RequestBody ContractType ContractType) {
		System.out.println("operation add complete for " + ContractType);
		ContractTypeRep.save(ContractType);

		return "operation add complete";
	}

/////////////////////////////////////////////////////////////////////////

	@PutMapping("updateContractType")
	public String CompanyClient(@RequestBody ContractType ContractType) {
		System.out.println("operation update complete for " + ContractType);
		ContractTypeRep.save(ContractType);

		return "operation update complete";
	}

/////////////////////////////////////////////////////////////////////////	

	@DeleteMapping("deleteContractType/{id}")
	public String deleteContractType(@PathVariable("id") int id) {
		System.out.println("operation delete complete for id " + id);
		ContractTypeRep.deleteById(id);

		return "operation delete complete";
	}

/////////////////////////////////////////////////////////////////////////

	@GetMapping("findById/{id}")
	public ContractType findById(@PathVariable("id") int id) {

		ContractType res = ContractTypeRep.findById(id).get();

		return res;
	}

/////////////////////////////////////////////////////////////////////////   

}
